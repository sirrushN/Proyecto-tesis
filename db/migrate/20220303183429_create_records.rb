class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.references :course, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
