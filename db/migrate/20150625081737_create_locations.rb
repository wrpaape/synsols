class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.belongs_to :company, index: true, foreign_key: true
      t.integer :courses_count
      t.integer :employees_count

      t.timestamps null: false
    end
  end
end
