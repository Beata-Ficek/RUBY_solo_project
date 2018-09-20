require ( 'sinatra' )
require ( 'sinatra/contrib/all' )
require_relative( '../models/bee.rb')
require_relative('../models/type.rb')
require('pry-byebug')

# index
get '/bees' do
  @bees = Bee.all
  @types = Type.all
  erb ( :"bees/index" )
end

# new
get '/bees/new' do
  @bees = Bee.all()
  @types = Type.all()
  erb ( :"bees/new" )
end

# create
post '/bees' do
  @bee = Bee.new(params)
  @bee.save()
  erb ( :"bees/create")
end

# show
get '/bees/:id' do
  @bee = Bee.find(params['id'].to_i)
  erb( :"bees/show" )
end

# edit
post '/bees/:id/edit' do
  @types = Type.all
  @bee = Bee.find(params['id'])
  erb( :"/bees/edit" )
end

# update

post '/bees/:id' do
  bee = Bee.new(params)
  bee.update
  redirect to "/bees/#{params['id']}"
end

# destroy
post '/bees/:id/delete' do
  @bee = Bee.find(params['id'])
  @bee.delete()
  redirect to "/bees"
end
