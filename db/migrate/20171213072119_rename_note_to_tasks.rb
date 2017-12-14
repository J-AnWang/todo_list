class RenameNoteToTasks < ActiveRecord::Migration[5.1]
  def change
      change_column :tasks, :note, :text
  end
end
