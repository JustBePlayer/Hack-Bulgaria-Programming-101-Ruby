class BrandsController < ApplicationController
  def count
    @brand = Brand.all.count
    render json: @brand
  end

  def create
    @brand = Brand.new(brand_params[:brand])
    @brand.save!

    render json: @brand
  end

  def show
    render json: Brand.find(params[:id])
  end

  def all
    render json: Brand.all
  end

  def update
    #render json: params[:name]
    brand = Brand.find(params[:id])
    if brand.update(brand_params)
      render json: brand
    end
  end

  def range
    brands = Brand.where("id > ?", params[:id])
    render json: brands
  end

  def delete
    brand = Brand.find(params[:id])
    brand.destroy
    redirect_to action: "all"
  end

  def range_to_index
    brands = Brand.where("id > ?", params[:id]).order('id asc').limit(params[:count])
    render json: brands
  end

  def new
    @brand = Brand.new
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :description)
  end
end
