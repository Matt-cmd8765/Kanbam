class KanbanBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @boards = @user.kanban_boards.all
    @columns = KanbanColumn.rank(:row_order)
  end

  def new
  end

  def create
  end
end
