class QuestionsController < ApplicationController

	def new
		@user = "hi"
		@question = Question.new
	end

	def create
		@user = "hi"

		p"*"*80
		p question_params

		@question = Question.create(question_params)
		if @question.save
			flash[:success] = "question submitted!"
			render action: "index" 
		else
			flash[:danger] = "sorry there was an error"
			render action: "index"
		end
	end



	private 


	def question_params
		params.require(:question).permit(:question, :real_answer,
			:dummy_answer1, :dummy_answer2, :dummy_answer3, :citation, :category_id)
	end

end
