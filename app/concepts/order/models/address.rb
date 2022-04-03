module Order
  module Models
    class Address
      attr_reader :city, :postcode, :street

      def initialize(city: '', postcode: '', street: '')
        @city = city
        @postcode = postcode
        @street = street
      end

      def to_h
        {
          city: @city,
          postcode: @postcode,
          street: @street
        }
      end
    end
  end
end
