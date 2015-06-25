class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
