class CreateCommercials < ActiveRecord::Migration
  def change
    create_table :commercials do |t|
      t.string :body
      t.string :phone
      t.string :email
      t.string :address

      t.timestamps null: false
    end
  end
end
