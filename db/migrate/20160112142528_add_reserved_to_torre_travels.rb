class AddReservedToTorreTravels < ActiveRecord::Migration
  def change
    add_column :torre_travels, :reserved, :integer
  end
end
