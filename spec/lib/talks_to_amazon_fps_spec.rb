require 'spec_helper'

describe TalksToAmazonFps do

  before do
    @callback_url = 'http://localhost/callback'
    @id           = 1
    @amount       = 1
    @limit        = 2
    @description  = 'Test'
    @is_shippable = 'True'
  end

  it do
    result = TalksToAmazonFps.get_multi_use_pipeline_url(
        @callback_url,
        @id,
        @amount,
        @limit,
        @description,
        @is_shippable
    )
    #raise result.inspect
    #RuntimeError: "https://authorize.payments-sandbox.amazon.com/cobranded-ui/actions/start?callerKey=AKIAI4TYKGHFGPDKG2HQ&callerReference=1&collectShippingAddress=True&globalAmountLimit=3&paymentReason=Test&pipelineName=MultiUse&returnURL=http%3A%2F%2Flocalhost%2Fcallback&signature=ysqH%2F4RSCpdrDYkd4LUUOWPSGthyKHye6JJmDKsEU%2F4%3D&signatureMethod=HmacSHA256&signatureVersion=2&transactionAmount=1&version=2009-01-09"
  end
end
