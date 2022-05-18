class CreateProfessors < ActiveRecord::Migration[6.1]
  def change
    create_table :professors do |t|
      t.string :name
      t.text :address
      t.integer :phone

      t.timestamps
    end
  end
end
