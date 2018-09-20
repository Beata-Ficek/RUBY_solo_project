require_relative('../db/sql_runner')

class Plant

  attr_accessor :name, :season, :pollen, :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @season = options['season']
    @pollen = options['pollen'].to_i if options['pollen']
  end

  def save()
    sql = "INSERT INTO plants
    (
      name,
      season,
      pollen
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @season, @pollen]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def update()
    sql = "UPDATE plants
    SET
    (
      name,
      season,
      pollen
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @season, @pollen, @id]
      SqlRunner.run(sql, values)
    end

  def bee_pollinated_plant
    sql = "SELECT bees.* FROM bees INNER JOIN food ON food.bee_id = bees.id WHERE food.plant_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |bee| Bee.new (bee) }
  end

  def self.all()
    sql = "SELECT * FROM plants"
    results = SqlRunner.run(sql)
    return results.map { |plant| Plant.new (plant) }
  end

  def self.find( id )
    sql = "SELECT * from plants WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Plant.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM plants"
    SqlRunner.run( sql )
  end

  def delete()
    sql = "DELETE FROM plants
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
