class AddDefaultToStatus < ActiveRecord::Migration[5.1]
  def change
      remove_column :tasks, :status
      add_column :tasks, :status, :boolean, default: false
  end
end
