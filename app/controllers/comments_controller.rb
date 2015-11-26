class CommentsController < ApplicationController
  def create
    @question = Question.find(question_params['question_id'])
    @comment = @question.comments.build(comment_params)
    @comment.update_attributes(:user_id => current_user.id)

    redirect_to "/questions/#{@question.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def question_params
    params.require(:question).permit(:question_id)
  end
end
