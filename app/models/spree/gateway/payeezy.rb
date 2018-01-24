module Spree
  class Gateway::Payeezy < Gateway
    preference :apikey, :string
    preference :apisecret
    preference :token


    def provider_class
      ActiveMerchant::Billing::PayeezyGateway
    end

    def purchase(money, creditcard, gateway_options)
      gateway_options[:description] = "Spree Order"
      provider.purchase(money, creditcard, gateway_options)
    end
  end
end
