require_relative '../helpers/yelp_api_call'

get '/' do
  # Look in app/views/index.erb
 erb :index
end

get '/restaurants/new' do
  erb :new_restaurant
end

post '/restaurants' do
  @data = Yelp.fetch_restaurants(params[:address], params[:city], params[:state])
  Restaurant.populate(@data)
  redirect "/restaurants"
end

get '/restaurants' do
  @restaurants = Restaurant.all
  erb :restaurants
end
