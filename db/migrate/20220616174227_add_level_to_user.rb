class AddLevelToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :level, :int
  end
end
