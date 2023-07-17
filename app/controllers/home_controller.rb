class HomeController < ApplicationController
  def index
    @pods = Pod.where.not(teacher_id: nil)

    return unless params[:search].present?

    search_term = params[:search]
    @pods = if search_term.length == 1 && search_term.to_i.between?(1, 5)
              @pods.where(grade: search_term)
            else
              @pods.where('name LIKE ? OR address LIKE ? OR zip_code LIKE ?',
                          "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
            end
  end

  def about; end
end
