require_relative('../db/sql_runner')
require('pry-byebug')

class Type

  attr_accessor :id, :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end
  

  def save()
    sql = "INSERT INTO types
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROM types
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql ,values).first
    type = Type.new(result)
    return type
  end

def self.all()
  sql = "SELECT * FROM types"
  type_data = SqlRunner.run(sql)
  types = map_items(type_data)
  return types
end

def self.map_items(type_data)
  return type_data.map { |type| Type.new(type) }
end

end
