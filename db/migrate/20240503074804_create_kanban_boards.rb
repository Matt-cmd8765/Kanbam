class CreateKanbanBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :kanban_boards do |t|
      t.string :name

      t.timestamps
    end
  end
end
