class ReviewsController < ApplicationController
    def create
        @pod = Pod.find(params[:pod_id])
        @review = @pod.reviews.create(review_params)
        redirect_to pod_path(@pod)
      end
    
      private
        def review_params
          params.require(:review).permit(:name, :review,)
        end
end
 