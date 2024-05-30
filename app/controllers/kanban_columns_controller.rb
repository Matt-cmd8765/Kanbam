class KanbanColumnsController < ApplicationController

  def edit
    @column = KanbanColumn.find(params[:id])
    @column.cards.build
  end

  def sort
    @column = KanbanColumn.find(params[:id])
    @column.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  # PATCH/PUT /column/1 or /column/1.json
  def update
    @column = KanbanColumn.find(params[:id])
    respond_to do |format|
      if @column.update(kanban_column_params)
        format.html { redirect_to kanban_board_url(@column.kanban_board_id), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # WIP 
  def destroy
    @column = KanbanColumn.find(params[:id])
    @column.destroy!
    board = KanbanBoard.find(params[:id])

    respond_to do |format|
      format.html { redirect_to kanban_board_path(board), notice: "Column was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Currently only makes cards, may need to update it eventually
  def kanban_column_params
    params.require(:kanban_column).permit(cards_attributes: [:name, :start_date, :end_date, :due_date, :kanban_column_id, :_destroy])
  end

end
