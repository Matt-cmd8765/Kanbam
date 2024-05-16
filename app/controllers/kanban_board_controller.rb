class KanbanBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @boards = @user.kanban_boards.all
    @columns = KanbanColumn.all
    # @cards = Card.rank(:row_order)
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
