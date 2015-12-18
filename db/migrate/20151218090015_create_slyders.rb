class CreateSlyders < ActiveRecord::Migration
  def change
    create_table :slyders do |t|
      t.text :description
      
      t.timestamps null: false
    end
  end
end
