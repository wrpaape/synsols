class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description, default: "N/A"
      t.integer :enrollment_cap
      t.belongs_to :company, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true
      t.integer :employees_count, default: 0

      t.timestamps null: false
    end
  end
end
