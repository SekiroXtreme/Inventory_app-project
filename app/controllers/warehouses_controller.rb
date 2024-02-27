class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[edit create show destroy update]  

  def show 
    @warehouses = Warehouse.all
  end
  
  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = current_user.warehouses.build(warehouse_params)
    if @warehouse.save
      redirect_to user_warehouse_path(@warehouse, current_user) notice: "Depósito añadido con éxito"
    else
      render :new , status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @warehouse.update
    if @warehouse.update
      redirect_to user_warehouse_path(@warehouse, current_user)
    else
      render :edit , status: :unprocessable_entity
  end

  def destroy
    @warehouse.destroy
    if @warehouse.destroy
      redirect_to user_warehouse_path
    end
  end

  private
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def warehouse_params
      params.require(:warehouse).permit(:name)
    end
  end
end
