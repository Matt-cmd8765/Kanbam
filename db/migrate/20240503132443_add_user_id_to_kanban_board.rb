class AddUserIdToKanbanBoard < ActiveRecord::Migration[7.1]
  def change
    add_column :kanban_boards, :user_id, :integer
  end
end
