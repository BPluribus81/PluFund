class TalksToAmazonFps

  if Rails.env.test?
    Token = 'AKIAI4TYKGHFGPDKG2HQ'
    Secret = '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'
  end

  def self.get_multi_use_pipeline_url(callback_url, id, amount, limit, description, is_shippable)
    AmazonFlexPay.access_key = Token
    AmazonFlexPay.secret_key = Secret
    AmazonFlexPay.go_live! if Rails.env.production?
    AmazonFlexPay.multi_use_pipeline(id,
                                     callback_url,
                                     :transaction_amount => amount,
                                     :global_amount_limit => amount + limit,
                                     :collect_shipping_address => is_shippable,
                                     :payment_reason => description)
  end

  def postfill
    unless params[:callerReference].blank?
      @order = Order.postfill!(params)
    end
    # "A" means the user cancelled the preorder before clicking "Confirm" on Amazon Payments.
    if params['status'] != 'A' && @order.present?
      redirect_to :action => :share, :uuid => @order.uuid
    else
      redirect_to root_url
    end
  end

end