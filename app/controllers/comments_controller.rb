class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def show
  end

  def create
    @card = Card.find(params[:card_id])
    @comment = Comment.new(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to card_path(@card), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :card_id)
  end
end
