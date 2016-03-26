class ProductsController < ApplicationController
  def show
    render json: Product.find(params[:id])
  end

  def list
    render json: Product.all
  end

  def range
    render json: Product.where("id > ?", params[:id])
  end

  def range_to_index
    render json: Product.where("id >= ?", params[:id]).order("id asc").limit(product[:count])
  end

  def new
    product = Product.new(product_params)
    render json: product if product.save
  end

  def update
    product = Product.find(params[:id])
    redirect_to products_url if product.update(product_params)
  end

  def delete
    Product.find(params[:id]).delete
    redirect_to "list"
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity)
  end
end
