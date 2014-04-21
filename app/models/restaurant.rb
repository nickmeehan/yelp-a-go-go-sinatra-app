class Restaurant < ActiveRecord::Base
  # Remember to create a migration!
  def self.populate(data)
    data["businesses"].shift
    data["businesses"].each do |restaurant|
      self.create(
        :address => restaurant["location"]["address"][0],
        :name => restaurant["name"],
        :rating => restaurant["rating"],
        :phone_number => restaurant["phone"],
        :category => restaurant["categories"][0][0]
      )
    end
  end
end
