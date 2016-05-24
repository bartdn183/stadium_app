class RemoveRowFromStadium < ActiveRecord::Migration
  def change
    remove_column :stadia, :row, :string
  end
end
