class Question < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user

  belongs_to :category
  has_many :comments

  has_many :question_stats

  def approve
    self.update_attributes(:accepted => true)
  end

  def disapprove(reason, user)
    message = "#{reason} (by #{user.name})"
    self.update_attributes(:accepted => false, :disapproval_reason => message, :status => message)
  end

  def trash
    self.update_attributes(:accepted => false, :disapproval_reason => "Marked for removal")
  end

  def self.search_question(params)
    output = Question.all
    unless params[:question].blank?
      output = where('question LIKE ?', "%#{params[:question]}%")
    end

    unless params[:category_id].blank?
      output = where('category_id = ?', "#{params[:category_id]}")
    end
    output
  end
end
