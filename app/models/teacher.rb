class Teacher < ApplicationRecord
  has_one :pod
  validates :grade, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validate :grade_match_with_pod

  def grade_match_with_pod
    return unless pod && grade != pod.grade

    errors.add(:grade, 'must match the grade of the associated pod')
  end
end
