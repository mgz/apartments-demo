class Apartment
  attr_reader :agency
  attr_reader :address, :number, :city, :price, :agency_name
  
  def initialize(address:, apartment:, city:, price:, rental_agency:)
    @address = address
    @number = apartment
    @city = city
    @price = price
    @agency_name = rental_agency
  end
  
  def ==(other)
    @address == other.address &&
      @number == other.number &&
      @city == other.city
  end
  
  def hash
    [@address, @number, @city].hash
  end
  
  def eql?(other)
    self == other
  end
  
  def assign_agency!(all_agencies)
    @agency = all_agencies.find{|a| a.name == @agency_name}
  end
  
  delegate :priority, to: :agency
end