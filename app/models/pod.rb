class Pod < ApplicationRecord
  belongs_to :teacher, optional: true
  has_one_attached :image
  has_many :reviews, dependent: :destroy
  has_many :pod_requests
  has_many :children, through: :pod_requests
  validates :name, :address, :grade, :zip_code, presence: true
  validates :grade, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :zip_code, presence: true, format: { with: /\A\d{5}\z/, message: 'should be in the format: 12345' }
  validates :teacher, presence: true, if: :active?
  validate :teacher_grade_match, on: %i[create update]
  validates :teacher_id, uniqueness: { allow_nil: true }

  def active?
    teacher.present?
  end

  def self.active_pods
    where.not(teacher_id: nil)
  end

  def self.pod_requests
    PodRequest.joins(:pod).where(pods: { id: all })
  end

  def approved_children
    children.where(pod_requests: { status: 'approved' })
  end

  private

  def teacher_grade_match
    return unless teacher.present? && teacher.grade != grade

    errors.add(:base, "Teacher's grade must be equal to the pod's grade")
  end
end
