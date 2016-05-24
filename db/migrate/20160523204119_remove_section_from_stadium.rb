class RemoveSectionFromStadium < ActiveRecord::Migration
  def change
    remove_column :stadia, :section, :string
  end
end
