module ExternalService
  class AgenciesService < BaseExternalService
    
    private

    def self.create_objects(raw_data)
      objects = []
      raw_data.each_pair do |name, priority|
        objects << Agency.new(name, priority: priority)
      end
      objects
    end
    
    def self.endpoint_url
      'https://raw.githubusercontent.com/kirillplatonov/apartments-feed-test/master/rental_agencies.yml'
    end
  end
end