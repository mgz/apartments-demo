class ApartmentFilter
  def self.call(apartments:, agencies:)
    apartments.each{|a| a.assign_agency!(agencies)}
    
    apartments.reject! do |apartment|
      same_apartments = apartments.grep(apartment)
      same_apartments.sort_by!(&:priority)
      
      same_apartments.last.priority > apartment.priority
    end
    
    apartments.uniq!
    
    apartments
  end
end