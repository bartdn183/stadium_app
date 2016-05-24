class RemoveSeatFromStadium < ActiveRecord::Migration
  def change
    remove_column :stadia, :seat, :string
  end
end
