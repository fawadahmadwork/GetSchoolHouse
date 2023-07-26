class PodsController < ApplicationController
  load_and_authorize_resource

  def index
    @pods = Pod.where.not(teacher_id: nil)

    return unless params[:search].present?

    search_term = params[:search]
    if search_term =~ /^grade\s+(\d+)$/i
      grade = Regexp.last_match(1).to_i
      @pods = if grade.between?(1, 5)
                @pods.where(grade: grade)
              else
                @pods.none
              end
    elsif search_term.length == 1 && search_term.to_i.between?(1, 5)
      @pods = @pods.where(grade: search_term)
    else
      @pods = @pods.where('name LIKE ? OR address LIKE ? OR zip_code LIKE ?', "%#{search_term}%", "%#{search_term}%",
                          "%#{search_term}%")
    end

    @search_active = params[:search].present?
  end

  def show
    @pod = Pod.find(params[:id])
    @review = @pod.reviews.build
    @pod_request = PodRequest.new
    @approved_children = @pod.children.joins(:pod_requests).where(pod_requests: { status: 'approved' }).distinct
  end
end
