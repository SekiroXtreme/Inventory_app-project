class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit show destroy update]

  def index
  end

  def new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to warehouse_product_path(current_user), notice: "Producto añadido con éxito"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to warehouse_product_path(current_user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    if @product.destroy
      redirect_to warehouse_product_path(current_user)
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :price, :stock, :description)
    end

end
