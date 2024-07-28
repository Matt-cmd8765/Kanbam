class CardsController < ApplicationController
	
  def new
    @card = Card.new
    @column_id = params[:column]
  end
  
  def show
    @card = Card.find(params[:id])
    column = KanbanColumn.find(@card.kanban_column_id)
    @board = KanbanBoard.find(column.kanban_board_id)
  end

  def edit
    @card = Card.find(params[:id])
  end
  
  # this is needed to store data for the sortable javascript controller
  def sort
		@card = Card.find(params[:id])
		@card.update(row_order_position: params[:row_order_position], kanban_column_id: params[:column_id])
		head :no_content
  end

  def create
    @card = Card.new(new_card_params)
    column_id = @card.kanban_column_id
    column = KanbanColumn.find(column_id)
    board = KanbanBoard.find(column.kanban_board_id)
    
    respond_to do |format|
      if @card.save
        format.html { redirect_to kanban_board_path(board), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @card = Card.find(params[:id])
    column_id = @card.kanban_column_id
    column = KanbanColumn.find(column_id)
    board = KanbanBoard.find(column.kanban_board_id)
    respond_to do |format|
      if @card.update(update_card_params)
        format.html { redirect_to kanban_board_path(board), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card = Card.find(params[:id])
    column_id = @card.kanban_column_id
    column = KanbanColumn.find(column_id)
    board = KanbanBoard.find(column.kanban_board_id)
    @card.destroy!

    respond_to do |format|
      format.html { redirect_to kanban_board_path(board), notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def new_card_params
    params.require(:card).permit(:name, :description, :start_date, :due_date, :kanban_column_id)
  end

  def update_card_params
    params.require(:card).permit(:name, :description, :start_date, :due_date)
  end

end


