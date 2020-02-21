class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = @department.items
  end

  def show
  end

  def new
  end

  def create
    if @item.save(items_params)
      redirect_to [@department, @item]
    else
      render :new
    end
  end
  
  def edit
  end

  def update
    if @item.update(items_params)
      redirect_to [@department, @item]
    else
      render :edit
    end
  end
  

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_department
    @department = Department.find(params[:department_id])
  end

  def items_params
    params.require(:department).permit(:name, :price, :sku, :description)
  end

end
