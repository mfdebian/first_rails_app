class CreateTraders < ActiveRecord::Migration[7.1]
  def change
    create_table :traders do |t|
      t.string :name
      t.string :location
      t.string :role
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
