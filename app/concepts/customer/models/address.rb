module Customer
  module Models
    class Address < ActiveRecord::Base
      belongs_to :customer

      validates_presence_of :postcode, :street
    end
  end
end
