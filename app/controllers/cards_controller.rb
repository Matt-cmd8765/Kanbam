class CardsController < ApplicationController
	
  def show
    @card = Card.find(params[:id])
  end
  
  def sort
		@card = Card.find(params[:id])
		@card.update(row_order_position: params[:row_order_position], kanban_column_id: params[:column_id])
		head :no_content
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy!

    respond_to do |format|
      format.html { redirect_to kanban_boards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end
