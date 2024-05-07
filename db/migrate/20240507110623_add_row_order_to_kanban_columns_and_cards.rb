class AddRowOrderToKanbanColumnsAndCards < ActiveRecord::Migration[7.1]
  def change
    add_column :kanban_columns, :row_order, :integer
    add_column :cards, :row_order, :integer
  end
end
