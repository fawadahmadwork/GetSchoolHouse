class HomeController < ApplicationController
def index
    @pods = Pod.includes(:teacher).where.not(teachers: { id: nil })
   
end

end

