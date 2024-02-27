class WarehousesController < ApplicationController
  def show 

  end
  
  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save
      redirect_to warehouse_path notice: "Depósito añadido con éxito"
    else
      render :new , status: :unprocessable_entity
  end

  def

  def destroy
    @warehouse.destroy
    if @warehouse.destroy
      redirect_to warehouse_path
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