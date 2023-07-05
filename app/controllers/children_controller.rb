class ChildrenController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: %i[show edit update destroy]
  before_action :set_child, only: %i[show edit update destroy]

  def index
    @children = current_user.children
  end

  def show
    @pod_requests = @child.pod_requests.order(status: :desc)
  end

  def new
    @child = current_user.children.new
  end

  def edit; end

  def create
    @child = Child.new(child_params)
    @child = current_user.children.new(child_params)

    respond_to do |format|
      if @child.save
        format.html { redirect_to child_url(@child), notice: 'Child was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @child.update(child_params)
        format.html { redirect_to child_url(@child), notice: 'Child was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @child.destroy

    respond_to do |format|
      format.html { redirect_to children_url, notice: 'Child was successfully destroyed.' }
    end
  end

  def correct_user
    @child = current_user.children.find_by(id: params[:id])
    redirect_to children_path, notice: 'its not your child :-) ' if @child.nil?
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, :age, :grade, :user_id, :gender, :address, :parent_name, :phone_number,
                                  :enrollment_date)
  end
end
