class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :description
      t.references :torre_travel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
