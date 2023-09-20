class SalesController < ApplicationController
  before_action :set_sale, only: %i[create show destroy]

  def show
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = current_user.sale.build(sale_params)
    if @sale.save
      redirect_to sales_path notice: 'Venta exitosa'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @sale.destroy
    if @sale.destroy
      redirect_to sales_path
    end
  end

  private   

    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:code, :subtotal_amount, :total_amount, :completed_at, :status, :tax_amount)
    end
end
