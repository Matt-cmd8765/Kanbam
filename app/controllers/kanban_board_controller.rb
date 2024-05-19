class KanbanBoardController < ApplicationController
  def index
    @user = current_user
    @boards = @user.kanban_boards.all
  end

  def show
    board = KanbanBoard.find(params[:id])
    @columns = board.kanban_columns.all
  end

  def create
  end
end
