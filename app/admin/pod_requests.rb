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
      elsif pod_request.canceled?
        (link_to 'Approve', approve_admin_pod_request_path(pod_request), method: :put)
      end
    end
  end
  

  member_action :approve, method: :put do
   pod_request = PodRequest.find(params[:id])
    if pod_request.child.validate_approved_pod_request_count
      redirect_to admin_pod_request_path(pod_request), alert: 'Child already has an approved pod request'
    else
      pod_request.update(status: 'approved')
      PodRequestMailer.with(pod_request: pod_request).approved_notification.deliver_now
      redirect_to admin_pod_requests_path, notice: "Pod Request has been approved."
    end
 end

  
  member_action :cancel, method: :put do
    pod_request = PodRequest.find(params[:id])
    pod_request.update(status: 'canceled')
    PodRequestMailer.with(pod_request: pod_request).canceled_notification.deliver_now
    redirect_to admin_pod_requests_path, notice: "Pod Request has been canceled."
  end
  controller do
    def update
      super do |success, failure|
        success.html do
          resource.send_status_update_email if resource.saved_change_to_status?
          redirect_to admin_pod_request_path(resource), notice: 'Pod request status updated successfully.'
        end
        failure.html do
          render :edit
        end
      end
    end
  end
 end
