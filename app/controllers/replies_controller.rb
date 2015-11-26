class RepliesController < ApplicationController
  def create
    @comment = Comment.find(comment_params['comment_id'])
    @reply = @comment.replies.build(reply_params)
    @reply.update_attributes(:user_id => current_user.id)

    redirect_to :back
  end

  private

  def reply_params
    params.require(:reply).permit(:reply)
  end

  def comment_params
    params.require(:comment).permit(:comment_id)
  end
end
