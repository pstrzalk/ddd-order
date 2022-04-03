module Order
  module Operations
    class SetBillingAddress < Trailblazer::Operation
      step :validate_params
      step :find_aggregate
      step :set_billing_address
      step :validate_aggregate
      step :save

      def find_aggregate(ctx, order_id:, **)
        ctx[:model] = Models::Order.find(order_id)
      end

      def validate_params(_ctx, params:, **)
        params[:city].present? && params[:postcode].present? && params[:street].present?
      end

      def set_billing_address(_ctx, model:, params:, **)
        address = Models::Address.new(
          city: params[:city],
          postcode: params[:postcode],
          street: params[:street]
        )

        model.billing_address = address
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
