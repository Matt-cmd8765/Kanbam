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
    # ! This is from the cards controller, it may not work for comments.
    @comment = Comment.find(params[:id])
    @card = Card.find(@comment.card_id)
  end

  def update
    @comment = Comment.find(params[:id])
    @card = Card.find(@comment.card_id)

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to card_path(@card), notice: "Comment was successfully edited." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def like
    @comment = Comment.find(params[:comment_id])
    Like.create(user_id: current_user.id, comment_id: @comment.id)
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :card_id, :parent_id)
  end
end
