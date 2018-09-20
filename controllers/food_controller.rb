require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/bee.rb')
require_relative( '../models/plant.rb')
require_relative( '../models/food.rb')
require_relative( '../models/action.rb')
require('pry-byebug')

get '/foods' do
  @foods = Food.all
  @actions = Action.all
  erb ( :"foods/index" )
end

get '/foods/new' do
  @bees = Bee.all
  @plants = Plant.all
  erb( :"foods/new" )
end

post '/foods' do

  @bee = Bee.find(params['bee_id'].to_i)
  @plant = Plant.find(params['plant_id'].to_i)
  @pollen = @plant.pollen

  if @bee.is_hungry_enough(@pollen)
    @bee.eat(@pollen)
    @bee.update
    food = Food.new(params)
    food.save
    redirect to("/foods")
  else
    @message = "is stuffed, pick another one"
    erb ( :"foods/create")
  end
end

post '/foods/:id/delete' do
  Food.destroy(params['id'])
  redirect to("/foods")
end
