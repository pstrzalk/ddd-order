module Order
  module Models
    class Order < ActiveRecord::Base
      has_many :payments

      validate :billing_address_valid?
      validate :shipping_address_valid?

      accepts_nested_attributes_for :payments

      def billing_address
        return unless billing_address_json.present?

        Address.new(
          city: billing_address_json['city'],
          street: billing_address_json['street'],
          postcode: billing_address_json['postcode'],
        )
      end

      def billing_address=(address)
        value = address.blank? ? nil : address.to_h

        self.billing_address_json = value
      end

      def shipping_address
        return unless shipping_address_json.present?

        Address.new(
          city: shipping_address_json['city'],
          street: shipping_address_json['street'],
          postcode: shipping_address_json['postcode'],
        )
      end

      def shipping_address=(address)
        value = address.blank? ? nil : address.to_h

        self.shipping_address_json = value
      end

      def customer
        Customer::Models::Customer.find(customer_id)
      end

      private

      def billing_address_valid?
        return if billing_address.nil?
        return if billing_address.city.present? &&
                  billing_address.postcode.present? &&
                  billing_address.street.present?

        errors.add(:billing_address, :invalid_data)
      end

      def shipping_address_valid?
        return if shipping_address.nil?
        return if shipping_address.city.present? &&
                  shipping_address.postcode.present? &&
                  shipping_address.street.present?

        errors.add(:shipping_address, :invalid_data)
      end
    end
  end
end
