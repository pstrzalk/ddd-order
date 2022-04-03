module Order
  module Operations
    class AddPayment < Trailblazer::Operation
      step :find_aggregate
      step :build_payment
      step :validate_aggregate
      step :save

      def find_aggregate(ctx, params:, order_id:)
        ctx[:model] = Models::Order.find(order_id)
      end

      def build_payment(_ctx, model:, params:, **)
        model.payments.build(params)
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
