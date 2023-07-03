module Api
    module V1
      class PodsController < ApplicationController
       def index
          zip_code = params[:zip_code]
          pods = Pod.where(zip_code: zip_code).where.not(teacher_id: nil)
          
          render json: pods
        end
      end
    end
  end
  