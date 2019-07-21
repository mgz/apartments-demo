require 'terminal-table'

module Formatter
  class PlainTextFormatter
    def self.call(apartments)
      rows = []
      rows << %w{Address Apartment City Price Rental\ Agency}
      rows << :separator
      
      apartments.map do |apartment|
        rows << [
          apartment.address,
          apartment.number,
          apartment.city,
          apartment.price,
          apartment.agency_name
        ]
      end
      Terminal::Table.new rows: rows
    end
  end
end