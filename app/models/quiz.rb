class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :quiz_attempts, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3, maximum: 200 }
  validates :description, length: { maximum: 1000 }
  validates :category, length: { maximum: 100 }

  scope :published, -> { where(is_published: true) }
  scope :by_category, -> (category) { where(category: category) if category.present? }

  def total_points
    questions.sum(:points)
  end

  def question_count
    questions.count
  end
end
