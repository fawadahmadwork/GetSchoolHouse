class TeachersController < ApplicationController
   load_and_authorize_resource
   before_action :authenticate_user!
  def index
    @teachers = Teacher.all
  end
  def show
    @teacher = Teacher.find(params[:id])
  end
end