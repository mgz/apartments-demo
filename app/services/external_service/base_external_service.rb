require 'open-uri'

module ExternalService
  class BaseExternalService
    def self.call
      create_objects(load_data)
    end
    
    private
    
    def self.load_data
      YAML.load(open(endpoint_url).read)
    end
    
    def self.create_objects(raw_data)
      throw 'Please implement create_objects'
    end
    
    def self.endpoint_url
      throw 'Please implement endpoint_url'
    end
    
  end
end