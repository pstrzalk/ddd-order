module Customer
  module Operations
    class AddAddress < Trailblazer::Operation
      step :find_aggregate
      step :build_address
      step :validate_aggregate
      step :save

      def find_aggregate(ctx, customer_id:, **)
        ctx[:model] = Models::Customer.find(customer_id)
      end

      def build_address(_ctx, model:, params:, **)
        model.addresses.build(params)
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
