class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    render json: { id: @product.id, name: @product.name, unit_price: @product.unit_price }
  end

  private

  def products_params
    params.require(:product).permit(:name, :description, :unit_price)
  end
end
