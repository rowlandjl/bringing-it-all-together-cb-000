class Dog 
  attr_accessor :name, :breed 
  attr_reader :id 
  
  def initialize(hash)
    @id = nil 
    @name = hash[:name]
    @breed = hash[:breed]
  end 
  
end 