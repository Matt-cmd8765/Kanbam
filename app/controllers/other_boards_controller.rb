class OtherBoardsController < ApplicationController
  def new
    @other_board = OtherBoard.new
    @board = KanbanBoard.find(params[:board])
  end
  
  def create
    @other_board = OtherBoard.new(other_board_params)

    respond_to do |format|
      if @other_board.save
        format.html { redirect_to kanban_board_url(@other_board.kanban_board_id), notice: "User successfully added." }
        format.json { render :show, status: :created, location: @other_board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @other_board.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def other_board_params
    params.require(:other_board).permit(:kanban_board_id, :subscriber_id)
  end
end
