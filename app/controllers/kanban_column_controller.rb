class KanbanColumnController < ApplicationController
    
  def sort
    @column = KanbanColumn.find(params[:id])
    @column.update(row_order_position: params[:row_order_position])
    head :no_content
  end
end
