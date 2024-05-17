class KanbanBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    # Only selecting first board. NEED TO CHANGE LATER
    @board = @user.kanban_boards.first
    @columns = @board.kanban_columns.all
  end

  def new
  end

  def create
  end
end
