class QuestionsController < ApplicationController
  
  def new
  	@user = "hi"
  	@question = Question.new
  end

end
