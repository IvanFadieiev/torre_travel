class RemoveLangFromTorreTravels < ActiveRecord::Migration
  def change
    remove_column :torre_travels, :lang, :integer
  end
end
