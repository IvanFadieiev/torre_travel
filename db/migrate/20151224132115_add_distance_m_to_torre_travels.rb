class AddDistanceMToTorreTravels < ActiveRecord::Migration
  def change
    add_column :torre_travels,:distance_m, :integer
    add_column :torre_travels,:address, :text 
  end
end
