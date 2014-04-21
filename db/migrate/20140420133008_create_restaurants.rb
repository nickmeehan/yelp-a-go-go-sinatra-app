class CreateRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.float  :rating
      t.string :category

      t.timestamps
    end
  end

  def down
    drop_table :restaurants
  end
end
