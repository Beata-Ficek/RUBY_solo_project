require_relative('../db/sql_runner')
require('pry-byebug')
require_relative('plant')

class Bee

  attr_accessor :name,  :hunger_level, :id, :type_id

  def initialize( options )
    @id = options ['id'].to_i if options['id']
    @name = options['name']
    @type_id =  options['type_id'].to_i
    @hunger_level = options['hunger_level'].to_i if options['hunger_level']
  end

  def is_hungry_enough(pollen)
    if @hunger_level + pollen <= 100
      return true
    else
      return false
    end
  end

  def eat(pollen)
    if is_hungry_enough(pollen)
    @hunger_level += pollen
   end
 end



  def how_hungry()
    if @hunger_level <= 40
      return "is very hungry"
    elsif @hunger_level.between?(41, 70)
      return "is okay"
    elsif @hunger_level >= 71
      return "is full"
    end
  end

  def save()
    sql = "INSERT INTO bees
    (
      name,
      type_id,
      hunger_level
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"

    values = [@name, @type_id, @hunger_level]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE bees
    SET
    (
      name,
      type_id,
      hunger_level
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @type_id, @hunger_level, @id]
      SqlRunner.run(sql, values)
    end

    def type_of_bee()
      return Type.find(@type_id)
    end

    def plants_pollinated_by_bees()
      sql = "SELECT plants.* FROM plants INNER JOIN food ON food.plant_id = plants.id WHERE food.bee_id = $1;"
      values = [@id]
      results = SqlRunner.run(sql, values)
      return results.map {|plant| Plant.new( plant )}
    end

    def self.all()
      sql = "SELECT * FROM bees"
      results = SqlRunner.run( sql )
      return results.map { |bee| Bee.new( bee ) }
    end

    def self.find( id )
      sql = "SELECT * FROM bees WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      bee = Bee.new( result )
      return bee
    end

    def delete()
      sql = "DELETE FROM bees
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end


    def self.delete_all()
      sql = "DELETE FROM bees"
      SqlRunner.run( sql )
    end

  def format_name
    return "#{@name.capitalize}"
  end
end
