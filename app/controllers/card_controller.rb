class CardController < ApplicationController
	def sort
		@card = Card.find(params[:id])
		@card.update(row_order_position: params[:row_order_position])
		head :no_content
	end
end
