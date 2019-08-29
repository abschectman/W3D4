# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord

  belongs_to :answerchoice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Answerchoice

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answerchoice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  

  def sibling_responses
    self.question.responses.select { |response| response.id != self.id }
  end

  def respondent_already_answered?
    if self.sibling_responses.any? { |response| response.user_id == self.user.id }
      errors[:double] << "Cannot respond twice"
    end
  end

  validate  :respondent_already_answered?
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
end


