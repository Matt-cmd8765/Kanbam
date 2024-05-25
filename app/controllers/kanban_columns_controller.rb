class KanbanColumnsController < ApplicationController
  
  def new
    @column = KanbanColumn.new
  end

  def create
    @column = KanbanColumn.new(kanban_column_params)

    respond_to do |format|
      if @column.save
        format.html { redirect_to kanban_board_url(@column), notice: "Board was successfully created." }
        format.json { render :show, status: :created, location: @column }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort
    @column = KanbanColumn.find(params[:id])
    @column.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  private

  def kanban_column_params
    params.require(:kanban_column).permit(:name, :kanban_column_id)
  end


end
