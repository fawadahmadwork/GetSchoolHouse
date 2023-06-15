class PodRequest < ApplicationRecord
  belongs_to :child
  belongs_to :pod
  scope :pending, -> { where(status: 'pending') }
  scope :canceled, -> { where(status: 'canceled') }
  scope :approved, -> { where(status: 'approved') }
  validate :validate_approved_pod_request, on: :update, if: :status_changed_to_approved?
  
  def pending?
    status == 'pending'
  end
  private
  
  def validate_approved_pod_request
    if child.approved_pod_request && child.approved_pod_request != self
      errors.add(:base, "Child already has an approved pod request")
    end
  end
  
  def status_changed_to_approved?
    status == 'approved' && status_changed?
  end
end
