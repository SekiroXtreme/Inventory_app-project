class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[edit show update destroy]  

  def index
    @warehouses = current_user.warehouses
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = current_user.warehouses.build(warehouse_params)
    if @warehouse.save
      redirect_to user_warehouses_path(current_user), notice: "Depósito añadido con éxito" 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @warehouse.update(warehouse_params)
      redirect_to user_warehouses_path(current_user), notice: "Depósito actualizado con éxito"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse.destroy
    redirect_to user_warehouses_path(current_user), notice: "Depósito eliminado con éxito"
  end

  private

  def set_warehouse
    @warehouse = current_user.warehouses.find(params[:id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:name)
  end
end
