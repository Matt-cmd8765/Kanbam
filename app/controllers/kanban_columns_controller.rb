class KanbanColumnsController < ApplicationController

  def new
    @column = KanbanColumn.new
    @board_id = params[:board]
  end
  
  def create
    @column = KanbanColumn.new(add_kanban_column_params)
    board = KanbanBoard.find(@column.kanban_board_id)
    respond_to do |format|
      if @column.save
        format.html { redirect_to kanban_board_path(board), notice: "Column was successfully added." }
        format.json { render :show, status: :created, location: @column }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @column = KanbanColumn.find(params[:id])
    @board = KanbanBoard.find(params[:board])
  end

  # PATCH/PUT /column/1 or /column/1.json
  def update
    @column = KanbanColumn.find(params[:id])

    respond_to do |format|
      if @column.update(add_kanban_column_params)
        format.html { redirect_to kanban_board_url(@column.kanban_board_id), notice: "Column was successfully updated." }
        format.json { render :show, status: :ok, location: @column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @column = KanbanColumn.find(params[:id])
    @column.destroy!
    board = KanbanBoard.find(params[:id])

    respond_to do |format|
      format.html { redirect_to kanban_board_path(board), notice: "Column was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # this is needed to store data for the sortable javascript controller
  def sort
    @column = KanbanColumn.find(params[:id])
    @column.update(row_order_position: params[:row_order_position])
    head :no_content
  end

  private

  def kanban_column_params
    params.require(:kanban_column).permit(:name)
  end

  def add_kanban_column_params
    params.require(:kanban_column).permit(:name, :kanban_board_id)
  end

end
