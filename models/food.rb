require_relative ('../db/sql_runner')

class Food

  attr_accessor :bee_id, :plant_id, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @bee_id = options['bee_id'].to_i
    @plant_id = options['plant_id'].to_i
  end

  def save
    sql = "INSERT INTO food
    (
      bee_id,
      plant_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@bee_id, @plant_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM food"
    results = SqlRunner.run( sql )
    return results.map{|food| Food.new (food)}
  end

  def plant()
    sql = "SELECT * FROM plants WHERE id = $1"
    values = [@plant_id]
    results = SqlRunner.run( sql, values )
    return Plant.new( results.first )
  end

  def bee()
    sql = "SELECT * FROM bees WHERE id = $1"
    values = [@bee_id]
    results = SqlRunner.run( sql, values )
    return Bee.new( results.first )
  end

  def self.delete_all()
    sql = "DELETE FROM food"
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM food WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
