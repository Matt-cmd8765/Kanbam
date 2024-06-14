class CommentsController < ApplicationController

  def new
    @card = Card.find(params[:card_id])
    @comment = @card.comments.new(parent_id: params[:parent_id])
    @parent_id = params[:parent_id]
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

  def like
    #! This probably won't work you need to change it.
    @comment = Comment.find(params[:comment_id])
    Like.create(user_id: current_user.id, comment_id: @comment.id)
    redirect_to card_path(@card)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :card_id, :parent_id)
  end
end
