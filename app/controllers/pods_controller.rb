class PodsController < ApplicationController
  load_and_authorize_resource
  before_action :set_pod, only: %i[show edit update destroy]
  def index
    @pods = Pod.all

    return unless params[:search].present?

    search_term = params[:search]
    @pods = if search_term.length == 1 && search_term.to_i.between?(1, 5)
              Pod.where(grade: search_term)
            else
              Pod.where('name LIKE ? OR address LIKE ? OR zip_code LIKE ?',
                        "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
            end
  end

  def show
    @review = @pod.reviews.build
    @pod_request = PodRequest.new
    @approved_children = @pod.children.joins(:pod_requests).where(pod_requests: { status: 'approved' }).distinct
  end

  def new
    @pod = Pod.new
  end

  def edit; end

  def create
    @pod = Pod.new(pod_params)

    respond_to do |format|
      if @pod.save
        format.html { redirect_to pod_url(@pod), notice: 'Pod was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pod.update(pod_params)
        format.html { redirect_to pod_url(@pod), notice: 'Pod was successfully updated.' }
        format.json { render :show, status: :ok, location: @pod }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pod.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pod.destroy

    respond_to do |format|
      format.html { redirect_to pods_url, notice: 'Pod was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_pod
    @pod = Pod.find(params[:id])
  end

  def pod_params
    params.require(:pod).permit(:name, :address, :grade, :zip_code)
  end
end
