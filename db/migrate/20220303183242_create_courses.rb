class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.references :professor, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.string :period

      t.timestamps
    end
  end
end
