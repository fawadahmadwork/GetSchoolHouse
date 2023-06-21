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
  def canceled?
    status == 'canceled'
  end
  
  
  def validate_approved_pod_request
    if child.approved_pod_request && child.approved_pod_request != self
      errors.add(:base, "Child already has an approved pod request")
    end
  end
  
  def status_changed_to_approved?
    status == 'approved' && status_changed?
  end

  def send_status_update_email
    template = case status
               when 'approved'
                 :approved_notification
               when 'canceled'
                 :canceled_notification
               else
                 return
               end

    PodRequestMailer.with(pod_request: self).send(template).deliver_now
  end
end
