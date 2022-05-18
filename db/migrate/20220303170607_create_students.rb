class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.text :address
      t.integer :phone

      t.timestamps
    end
  end
end
