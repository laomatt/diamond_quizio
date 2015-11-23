class Question < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user
  belongs_to :category

  def approve
    self.update_attributes(:accepted => true)
  end

  def disapprove(reason)
    self.update_attributes(:accepted => false, :disapproval_reason => reason)
  end

end
