module Customer
  module Operations
    class RegisterCustomer < Trailblazer::Operation
      step :build_aggregate
      step :validate_aggregate
      step :save

      def build_aggregate(ctx, params:, **)
        ctx[:model] = Models::Customer.new(params)
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
