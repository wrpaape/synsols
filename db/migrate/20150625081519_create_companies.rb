class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.integer :locations_count
      t.integer :employees_count
      t.integer :courses_count

      t.timestamps null: false
    end
  end
end
