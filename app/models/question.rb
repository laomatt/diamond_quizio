class Question < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :user
  belongs_to :category

  def approve
    self.update_attributes(:approved => true)
  end

end
