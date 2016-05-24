class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
      t.string :name
      t.string :section
      t.string :row
      t.string :seat

      t.timestamps null: false
    end
  end
end
