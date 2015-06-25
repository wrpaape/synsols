class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.belongs_to :company, index: true, foreign_key: true
      t.integer :courses_count, default: 0
      t.integer :employees_count, default: 0

      t.timestamps null: false
    end
  end
end
