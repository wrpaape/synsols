class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.text :description, default: "N/A"
      t.integer :enrollment_cap
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
