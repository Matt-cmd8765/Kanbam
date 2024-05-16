class KanbanBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    # Only selecting first board. NEED TO CHANGE LATER
    @board = @user.kanban_boards.first
    @columns = @board.kanban_columns.all
  end

  def sort
    @card = Card.find(params[:id])
    @card.update(row_order_position: params[:row_order_position])
    head :no_content
    # @roworder = params[:row_order_position]
    # debugger
  end

  def new
  end

  def create
  end
end
