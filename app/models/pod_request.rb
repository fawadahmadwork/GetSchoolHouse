class PodRequest < ApplicationRecord
  belongs_to :child
  belongs_to :pod
  scope :pending, -> { where(status: 'pending') }
  scope :canceled, -> { where(status: 'canceled') }
  scope :approved, -> { where(status: 'approved') }
  def pending?
    status == 'pending'
  end
end
