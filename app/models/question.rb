class Question < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user
  belongs_to :category
  has_many :comments

  def approve
    self.update_attributes(:accepted => true)
  end

  def disapprove(reason, user)
    message = "#{reason} (by #{user.name})"
    self.update_attributes(:accepted => false, :disapproval_reason => message, :status => message)
  end

  def self.search_question(params)
    output = Question.all
    unless params[:question].empty?
      output = where('question LIKE ?', "%#{params[:question]}%")
    end
    output
  end
end
