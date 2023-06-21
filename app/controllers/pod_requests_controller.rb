class PodRequestsController < InheritedResources::Base
  def create
    @pod_request = PodRequest.new(pod_request_params)
    @pod_request.status = 'pending' # Set the initial status to 'pending'

    if @pod_request.save
      PodRequestMailer.user_notification(current_user, @pod_request).deliver_now
      PodRequestMailer.admin_notification(current_user, @pod_request).deliver_now
      
      redirect_to @pod_request.child, notice: 'Pod request was successfully created.'
    else
      render 'pods/show'
    end
  end

 private

    def pod_request_params
      params.require(:pod_request).permit(:child_id, :pod_id, :status)
    end

end
