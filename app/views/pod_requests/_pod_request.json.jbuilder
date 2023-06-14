json.extract! pod_request, :id, :child_id, :pod_id, :status, :created_at, :updated_at
json.url pod_request_url(pod_request, format: :json)
