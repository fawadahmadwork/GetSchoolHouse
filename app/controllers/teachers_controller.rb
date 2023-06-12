class TeachersController < ApplicationController
  load_and_authorize_resource

  before_action :set_teacher, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  def index
    @teachers = Teacher.all
  end

  def show
  end

  
  def new
    @teacher = Teacher.new
  end

  
  def edit
  end


  def create
    @teacher = Teacher.new(teacher_params)

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully created." }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teacher_url(@teacher), notice: "Teacher was successfully updated." }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url, notice: "Teacher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
   
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    
    def teacher_params
      params.require(:teacher).permit(:name, :qualififcation, :grade)
    end
end