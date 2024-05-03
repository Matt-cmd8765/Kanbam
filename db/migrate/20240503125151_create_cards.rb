class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :position
      t.date :start_date
      t.date :end_date
      t.date :due_date
      t.references :kanban_column, null: false, foreign_key: true

      t.timestamps
    end
  end
end
