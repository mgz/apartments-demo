class Agency
  attr_reader :name, :priority
  
  def initialize(name, priority:)
    @name = name
    @priority = priority
  end
end