class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    if current_user.children.present?
      @pod = Pod.find(params[:pod_id])
      @comment = @pod.comments.create(comment_params)
      redirect_to pod_path(@pod)
    end
end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :pod_id)
    end
    

end

