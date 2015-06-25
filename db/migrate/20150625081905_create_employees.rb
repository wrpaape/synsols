class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :job_title
      t.date :hire_date
      t.belongs_to :location, index: true, foreign_key: true
      t.belongs_to :company, index: true, foreign_key: true
      t.integer :participants_count

      t.timestamps null: false
    end
  end
end
