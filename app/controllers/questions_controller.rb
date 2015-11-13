class QuestionsController < ApplicationController
  
  def new
  	@user = "hi"
  	@categories = Category.all
  	@question = Question.new
  end

end
