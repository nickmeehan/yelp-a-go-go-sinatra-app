require 'oauth'
require 'json'
require 'debugger'


class Yelp
  def self.fetch_restaurants( address, city, state )
    split_search_path( address, city, state )
    api_call
    # populate!
  end

  def self.split_search_path( address, city, state )
    @path_input = ( address.split(" ") + city.split(" ") + state.split( " ") ).join("%20")
  end

  def self.api_call
    consumer_key = ENV['CONSUMER_KEY']
    consumer_secret = ENV['CONSUMER_SECRET']
    token = ENV['TOKEN']
    token_secret = ENV['TOKEN_SECRET']

    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    path = "/v2/search?term=restaurants&sort=1&location=#{@path_input}"
    yelp_data = access_token.get(path).body
    @yelp_object = JSON.parse yelp_data
  end

  # def self.populate!
  #   @yelp_object["businesses"].shift
  #   @yelp_object["businesses"].each do |restaurant|
  #     Restaurant.create(
  #       :address => restaurant["location"]["address"][0],
  #       :name => restaurant["name"],
  #       :rating => restaurant["rating"],
  #       :phone_number => restaurant["phone"],
  #       :category => restaurant["categories"][0][0]
  #     )
  #   end
  # end
end
