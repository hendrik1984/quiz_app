class Question < ApplicationRecord
  belongs_to :quiz
  has_many :options, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  validates :text, presence: true, length: { minimum: 1, maximum: 500 }
  validates :points, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
  validates :order_index, numericality: { greater_than_or_equal_to: 0 }

  accept_nested_attributes_for :options, allow_destroy: true, reject_if: :all_blank

  def correct_option
    options.find_by(is_correct: true)
  end
end
