class AddStadiumToVendors < ActiveRecord::Migration
  def change
    add_reference :vendors, :stadium, index: true, foreign_key: true
  end
end
