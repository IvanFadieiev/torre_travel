class CreateTorreTravels < ActiveRecord::Migration
  def change
    create_table :torre_travels do |t|
      t.integer :housing
      t.decimal :price
      t.integer :distance
      t.text :description
      t.integer :lang

      t.timestamps null: false
    end
  end
end
