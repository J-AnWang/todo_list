class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :date
      t.string :note
      t.timestamps
    end
  end
end
