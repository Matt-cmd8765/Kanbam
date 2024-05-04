class KanbanBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @boards = @user.kanban_boards.all
  end

  def new
  end

  def create
  end
end
