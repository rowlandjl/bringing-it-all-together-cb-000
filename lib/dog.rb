class Dog 
  attr_accessor :name, :breed 
  attr_reader :id 
  
  def initialize(hash)
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
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed)
    
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end 
  
end 






