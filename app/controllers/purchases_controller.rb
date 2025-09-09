class PurchasesController < ApplicationController
  before_action :set_purchase, only:%i[create show  destroy]

  def show
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = current_user.purchase.build(purchase_params)
    if @purchase.save
      redirect_to purchases_path notice: 'Compra exitosa'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @purchase.destroy
    if @purchase.destroy
      redirect_to purchases_path
    end
  end

  private
    
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:code, :subtotal_amount, :total_amount, :completed_at, :status, :tax_amount)
    end
end
