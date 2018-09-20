require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/bees_controller')
require_relative('controllers/plants_controller')
require_relative('controllers/food_controller')
also_reload('./models/*')

get '/index' do
  erb( :index )
end

get '/more' do
  erb ( :show )
end
