require 'pry'
class Pokemon

attr_accessor :id, :type, :name, :db


def initialize(pokemon)
  @id = pokemon[:id]
  @name = pokemon[:name]
  @type = pokemon[:type]
  @db = pokemon[:db]
end
  # def initialize(id:, name:, type:, db: )
  #   @id, @name, @type, @db = id, name, type, db
  # end

def self.save(name, type, id)
  # binding.pry
  id.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
end

def self.find(id, db)
  # binding.pry
  poke = db.execute("SELECT * FROM pokemon WHERE (pokemon.id = ?)", id).flatten
  Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db )
  # binding.pry
end



end
