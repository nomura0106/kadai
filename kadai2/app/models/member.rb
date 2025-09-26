class Member < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 20 }

  validates :height, presence: true
  validates :weight, presence: true

  validate :height_must_be_positive
  validate :weight_must_be_positive

  private

  def height_must_be_positive
    if height.present? && height < 1
      errors.add(:height, "は1以上を入力してください")
    end
  end

  def weight_must_be_positive
    if weight.present? && weight < 1
      errors.add(:weight, "は1以上を入力してください")
    end
  end
end
