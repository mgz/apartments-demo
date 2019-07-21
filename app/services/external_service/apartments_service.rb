module ExternalService
  class ApartmentsService < BaseExternalService
    
    private

    def self.create_objects(raw_data)
      objects = []
      raw_data.each do |hash|
        objects << Apartment.new(**(hash.symbolize_keys))
      end
      objects
    end
    
    def self.endpoint_url
      'https://raw.githubusercontent.com/kirillplatonov/apartments-feed-test/master/apartments.yml'
    end
  end
end