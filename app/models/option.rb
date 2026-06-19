class Option < ApplicationRecord
  belongs_to :question

  validates :text, presence: true, length: { minimum: 1, maximum: 500 }
  validate :only_one_correct_option_per_question

  private

  def only_one_correct_option_per_question
    if is_correct && question.options.where(is_correct: true).where.not(id: id).exists?
      error.add(:is_correct, "can only be one correct option per question")
    end
  end
end
