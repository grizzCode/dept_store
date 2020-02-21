class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]
  def index
    @departments = Department.all
  end

  def show
  end

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to departments_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @department.save
      redirect_to departments_path
    else
      render :edit
    end
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
  
  def set_department
    @department = Department.find(params[:id])
  end
end
