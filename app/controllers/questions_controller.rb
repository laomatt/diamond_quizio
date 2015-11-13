class QuestionsController < ApplicationController

	def new
		@user = "hi"
		@question = Question.new
	end

	def create
		@category = Category.find(category_params["category_id"])
		@question = @category.questions.build(question_params)
		if @question.save
			flash[:success] = "question submitted!"
			redirect_to @category
		else
			flash[:danger] = "sorry there was an error"
			redirect_to @category
		end
	end



	private 

	def category_params
		params.require(:category).permit(:category_id)
	end

	def question_params
		params.require(:question).permit(:question, :real_answer,
			:dummy_answer1, :dummy_answer2, :dummy_answer3, :citation, :category_id)
	end



end
