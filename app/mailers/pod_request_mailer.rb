class PodRequestMailer < ApplicationMailer
  def user_notification(user, pod_request)
      @user = user
      @pod_request = pod_request
      mail(to: @user.email, subject: 'Pod Request Created')
  end

  def admin_notification(admin_user, pod_request)
      @admin_user = admin_user
      @pod_request = pod_request
      mail(to: @admin_user.email, subject: 'New Pod Request')
  end
  
  
  def approved_notification
      @pod_request = params[:pod_request]
      @user = @pod_request.child.user
      @pod = @pod_request.pod
      mail(to: @user.email, subject: "Pod Request Approved")
  end
  
  def canceled_notification
      @pod_request = params[:pod_request]
      @user = @pod_request.child.user
      @pod = @pod_request.pod
      mail(to: @user.email, subject: "Pod Request Canceled")
  end
  
  
end