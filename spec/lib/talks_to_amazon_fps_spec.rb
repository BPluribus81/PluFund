require 'spec_helper'

describe TalksToAmazonFps do

  context 'beginning a prepayment' do
    before do
      @callback_url = 'http://localhost/callback'
      @id = 1
      @amount = 1
      @limit = 2
      @description = 'Test'
      @is_shippable = 'True'
    end

    it 'provides a URL to complete the prepayment' do
      result = TalksToAmazonFps.new.get_multi_use_pipeline_url(
          @callback_url,
          @id,
          @amount,
          @limit,
          @description,
          @is_shippable
      )
      expect(result.include?('amazon.com/cobranded-ui/actions/start')).to be_true
    end
  end

  context 'completing a prepayment' do

    before do
      @amazon_response = {
          :callerReference => 'some_id',
          :tokenID => 'tokenID',
          :addressLine1 => 'addressLine1',
          :addressLine2 => 'addressLine2',
          :city => 'city',
          :state => 'state',
          :status => 'status',
          :zip => 'zip',
          :phoneNumber => 'phoneNumber',
          :country => 'country',
          :expiry => 'expiry' # parseable date
      }
    end

    it 'consumes callback values from completed prepayment' do
      result = TalksToAmazonFps.new.process_pipeline_callback(@amazon_response)
      expect(result).to eq(:success)
    end

    it 'consumes callback values from aborted prepayment' do
      @amazon_response[:status] = TalksToAmazonFps::STATUS_CANCELLED
      result = TalksToAmazonFps.new.process_pipeline_callback(@amazon_response)
      expect(result).to eq(:cancelled)
    end
  end
end
