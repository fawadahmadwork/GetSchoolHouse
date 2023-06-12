class HomeController < ApplicationController
def index
    @pods = Pod.includes(:teacher).where.not(teachers: { id: nil })
    @pods = @pods.page(params[:page]).per(5)
end

end

