class HomeController < ApplicationController
def index
    @pods = Pod.all
end

end

