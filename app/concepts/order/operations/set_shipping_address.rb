module Order
  module Operations
    class SetShippingAddress < Trailblazer::Operation
      step :validate_params
      step :find_aggregate
      step :set_shipping_address
      step :validate_aggregate
      step :save

      def find_aggregate(ctx, order_id:, **)
        ctx[:model] = Models::Order.find(order_id)
      end

      def validate_params(_ctx, params:, **)
        params[:city].present? && params[:postcode].present? && params[:street].present?
      end

      def set_shipping_address(_ctx, model:, params:, **)
        address = Models::Address.new(
          city: params[:city],
          postcode: params[:postcode],
          street: params[:street]
        )

        model.shipping_address = address
      end

      def validate_aggregate(_ctx, model:, **)
        model.valid?
      end

      def save(_ctx, model:, **)
        model.save
      end
    end
  end
end
