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
    @comment = Comment.find(params[:id])
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to card_path(@comment.card_id), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    @comment = Comment.find(params[:comment_id])
    Like.create(user_id: current_user.id, comment_id: @comment.id)
    respond_to do |format|
      format.html { redirect_to card_path(@comment.card_id), notice: "Like was successfully created." }
      format.json { head :no_content }
    end
  end

  def unlike
    @comment = Comment.find(params[:comment_id])
    Like.destroy_by(user_id: current_user.id, comment_id: @comment.id)
    respond_to do |format|
      format.html { redirect_to card_path(@comment.card_id), notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :card_id, :parent_id)
  end
end
