class CardsController < ApplicationController
	
  def show
  end
  
  def sort
		@card = Card.find(params[:id])
		@card.update(row_order_position: params[:row_order_position], kanban_column_id: params[:column_id])
		head :no_content
	end
end
