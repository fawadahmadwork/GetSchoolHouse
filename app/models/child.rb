class Child < ApplicationRecord
has_many :pod_requests
has_one :approved_pod_request, -> { where(status: 'approved') }, class_name: 'PodRequest'
has_one :pod, through: :approved_pod_request, source: :pod
belongs_to :user
validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 6, less_than_or_equal_to: 13 }
end
