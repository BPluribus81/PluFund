class TalksToAmazonFps

  STATUS_CANCELLED = 'A'

  if Rails.env.test?
    Token = 'AKIAI4TYKGHFGPDKG2HQ'
    Secret = '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'
  end

  def initialize
    AmazonFlexPay.access_key = Token
    AmazonFlexPay.secret_key = Secret
    AmazonFlexPay.go_live! if Rails.env.production?
  end

  def get_multi_use_pipeline_url(callback_url, id, amount, limit, description, is_shippable)
    AmazonFlexPay.multi_use_pipeline(id,
                                     callback_url,
                                     :transaction_amount => amount,
                                     :global_amount_limit => amount + limit,
                                     :collect_shipping_address => is_shippable,
                                     :payment_reason => description)
  end

  def process_pipeline_callback(params)

    params.has_key?(:callerReference) &&
        params.has_key?(:tokenID) &&
        params.has_key?(:addressLine1) &&
        params.has_key?(:addressLine2) &&
        params.has_key?(:city) &&
        params.has_key?(:state) &&
        params.has_key?(:status) &&
        params.has_key?(:zip) &&
        params.has_key?(:phoneNumber) &&
        params.has_key?(:country) &&
        params.has_key?(:expiry)

    if (params[:status] != STATUS_CANCELLED && params[:tokenID].present?)
      :success
    else
      :cancelled
    end
  end
end