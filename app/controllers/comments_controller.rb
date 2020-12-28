class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]


  def find_post
    @post = Post.find(params[:post_id])
  end

  def create
    find_post
    @comment = @post.comments.create(comment_params)
    if @comment.persisted?
      { notice: 'Comment was successfully created.' }
    else
      { notice: 'Comment was not created.' }
    end
    redirect_to post_path(@comment.post)
  end

  def update
    find_post
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully updated.' }
      end
    end
  end

  def destroy
    find_post
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, notice: 'Comment was successfully destroyed.' }
    end
  end

  def publish
    find_post
    @comment.update(status: :published)
    respond_to do |format|
      format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully published.' }
    end
  end

  private

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :author_id)
  end
end
