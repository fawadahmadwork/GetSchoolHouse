class Pod < ApplicationRecord
validates :grade, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
validates :teacher, presence: true, if: :active?
belongs_to :teacher, optional: true
validates :teacher_id, uniqueness:  { allow_nil: true }
def active?
    teacher.present?
end
end




