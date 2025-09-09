class ProductsController < ApplicationController
  before_action :set_warehouse
  before_action :set_product, only: %i[show edit update destroy]


  def index
    @products = @warehouse.products
  end

  def show; end

  def new
    @product = @warehouse.products.new
  end

  def create
    @product = @warehouse.products.new(product_params)
    if @product.save
      redirect_to warehouse_products_path(@warehouse), notice: 'Producto añadido con éxito'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to warehouse_products_path(@warehouse), notice: 'Producto actualizado con éxito'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to warehouse_products_path(@warehouse), notice: 'Producto eliminado con éxito'
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:warehouse_id])
  end

  def set_product
    @product = @warehouse.products.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :stock, :description)
  end

end


