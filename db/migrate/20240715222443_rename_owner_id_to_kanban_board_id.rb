class RenameOwnerIdToKanbanBoardId < ActiveRecord::Migration[7.1]
  def change
    rename_column :other_boards, :owner_id, :kanban_board_id
  end
end
