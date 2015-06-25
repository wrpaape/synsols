class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.integer :locations_count, default: 0
      t.integer :employees_count, default: 0
      t.integer :courses_count, default: 0

      t.timestamps null: false
    end
  end
end
