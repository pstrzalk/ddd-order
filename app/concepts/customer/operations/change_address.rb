module Customer
  module Operations
    class ChangeAddress < Trailblazer::Operation
      step :find_aggregate
      step :find_address
      pass :change_address
      step :validate_aggregate
      step :save

      def find_aggregate(ctx, customer_id:, **)
        ctx[:model] = Models::Customer.find(customer_id)
      end

      def find_address(ctx, model:, address_id:, **)
        ctx[:address] = model.addresses.find { |address| address.id == address_id }
      end

      def change_address(_ctx, address:, params:, **)
        address.assign_attributes(params)
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
