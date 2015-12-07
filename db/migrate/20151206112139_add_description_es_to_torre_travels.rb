class AddDescriptionEsToTorreTravels < ActiveRecord::Migration
  def change
    add_column :torre_travels, :description_es, :text
  end
end
