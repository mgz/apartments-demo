module Formatter
  class JSONFormatter
    def self.call(apartments)
      
      apartments.map do |apartment|
        {
          address: apartment.address,
          apartment: apartment.number,
          city: apartment.city,
          price: apartment.price,
          rental_agency: apartment.agency_name
        }
      end
    end
  end
end