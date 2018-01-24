module Spree
  class Gateway::Payeezy < Gateway
    preference :apikey, :string
    preference :apisecret, :string
    preference :token, :string


    def provider_class
      ActiveMerchant::Billing::PayeezyGateway
    end

    def payment_source_class
      Spree::CreditCard
    end

    def purchase(money, creditcard, gateway_options)
      gateway_options[:description] = "Spree Order"
      provider.purchase(money, creditcard, gateway_options)
    end
  end
end
