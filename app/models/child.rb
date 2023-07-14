class Child < ApplicationRecord
  belongs_to :user
  has_many :pod_requests
  has_one :approved_pod_request, -> { where(status: 'approved') }, class_name: 'PodRequest'
  has_one :pod, through: :approved_pod_request, source: :pod
  validates :name, :age, :grade, presence: true
  validate :validate_approved_pod_request_count, on: :create
  def validate_approved_pod_request_count
    return unless pod_requests.approved.exists?

    errors.add(:base, 'Child already has an approved pod request')
  end
end
