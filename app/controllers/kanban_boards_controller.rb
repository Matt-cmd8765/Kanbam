class KanbanBoardsController < ApplicationController
  def index
    @user = current_user
    @boards = @user.kanban_boards.all
  end

  def show
    @board = KanbanBoard.find(params[:id])
    @columns = @board.kanban_columns.all
    @board_id = params[:id]
  end

  def new
    @board = KanbanBoard.new
    @board.kanban_columns.build
  end

  def create
    @board = KanbanBoard.new(kanban_board_params)
    
    respond_to do |format|
      if @board.save
        format.html { redirect_to kanban_board_url(@board), notice: "Board was successfully created." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board = KanbanBoard.find(params[:id])
    @board.destroy!

    respond_to do |format|
      format.html { redirect_to kanban_boards_url, notice: "Board was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def edit
    @board = KanbanBoard.find(params[:id])    
  end

  def update
    @board = KanbanBoard.find(params[:id])
    respond_to do |format|
      if @board.update(kanban_update_column_params)
        format.html { redirect_to kanban_board_url(@board.id), notice: "Column was successfully created." }
        format.json { render :show, status: :ok, location: @column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def kanban_board_params
    params.require(:kanban_board).permit(:name, :user_id, kanban_columns_attributes: [:name, :_destroy])
  end

  def kanban_update_column_params
    params.require(:kanban_board).permit(kanban_columns_attributes: [:name, :kanban_board_id, :_destroy])
  end

# class end
end
