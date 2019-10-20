class Dog 
  attr_accessor :name, :breed 
  attr_reader :id 
  
  def initialize(id: nil, :name, :breed)
    @id = nil 
    @name = hash[:name]
    @breed = hash[:breed]
  end 
  
  def self.create_table 
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table 
    sql = <<-SQL
      DROP TABLE IF EXISTS dogs 
    SQL
    
    DB[:conn].execute(sql)
  end 
  
  def save 
    if self.id 
      self.update 
    else 
      sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
      SQL
      
      DB[:conn].execute(sql, self.name, self.breed)
      
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    end 
  end 
  
  def self.create(hash) 
    dog = self.new(hash)
    dog.save 
    dog
  end 
  
  def self.new_from_db(row) 
    new_dog = self.new(row[0], row[1], row[2])
    new_dog
  end 
  
  def self.find_by_id(id)
  end 
  
  def self.find_or_create_by 
  end 
  
  def self.find_by_name(name)
  end 
  
  def update 
    sql = "UPDATE dogs SET name = ?, breed = ? WHERE id = ?"
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end 
  
end 






