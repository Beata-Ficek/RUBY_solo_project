require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/plant.rb' )


# index
get '/plants' do
  @plants = Plant.all()
  erb ( :"plants/index" )
end

 # new
 get '/plants/new' do
   @plant = Plant.all()
   @seasons = ["Spring", "Summer", "Autumn", "Winter"]
   erb ( :"plants/new" )
 end

# create
post '/plants' do

  @plant = Plant.new(params)
  @plant.save()
  erb ( :"plants/create")
end

# show
get '/plants/:id' do
  @plant = Plant.find(params['id'].to_i)
  erb( :"plants/show" )
end

# edit
post '/plants/:id/edit' do
  @season = ["Spring", "Summer", "Autumn", "Winter"]
  @plant = Plant.find(params['id'])
  erb( :"/plants/edit" )
end

# update
post '/plants/:id' do
  plant = Plant.new(params)
  plant.update
  redirect to "/plants/#{params['id']}"
end

# destroy
post '/plants/:id/delete' do
  @plant = Plant.find(params['id'])
  @plant.delete()
  redirect to "/plants"
end
