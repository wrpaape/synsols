class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.belongs_to :employee, index: true, foreign_key: true
      t.belongs_to :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
