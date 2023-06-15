ActiveAdmin.register PodRequest do
  permit_params :status

  index do
    selectable_column
    column :id
    column :child
    column :pod
    column :status
    column :created_at
    actions defaults: true do |pod_request|
      if pod_request.pending?
        (link_to 'Approve', approve_admin_pod_request_path(pod_request), method: :put) +
        (link_to  'Cancel', cancel_admin_pod_request_path(pod_request), method: :put)
      
      end
    end
  end

  member_action :approve, method: :put do
    pod_request = PodRequest.find(params[:id])
    pod_request.update(status: 'approved')
    redirect_to admin_pod_requests_path, notice: "Pod Request has been approved."
  end

  member_action :cancel, method: :put do
    pod_request = PodRequest.find(params[:id])
    pod_request.update(status: 'canceled')
    redirect_to admin_pod_requests_path, notice: "Pod Request has been canceled."
  end


  
end
