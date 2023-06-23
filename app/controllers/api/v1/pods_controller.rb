class Api::V1::PodsController < ApplicationController
    module Api
        module V1
            class PodsController < ApplicationController
                def index
                    zip_code = params[:zip_code]
                    pods = Pod.where(zip_code: zip_code)
                    
                    render json: pods
                end
            end
        end
    end
end
  