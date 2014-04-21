class DropBands < ActiveRecord::Migration
  def up
    drop_table :bands
  end

  def down
    create_table(:bands) do |t|
      t.string :name
    end
  end
end
