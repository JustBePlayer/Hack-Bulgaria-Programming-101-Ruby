class CategoriesController < ApplicationController

  def list
    render json: Category.all
  end

  def show
    render json: Category.find(params[:id])
  end

  def count
    render json: Category.all.count
  end

  def range
    render json: Category.where("id > ?", params[:id])
  end

  def range_to_index
    render json: Category.where("id > ?", params[:id]).order("id asc").limit(params[:count])
  end

  def create
    category = Category.new(category_params[:category])
    if category.save
      redirect_to categories_url
    end
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to category
    end
  end

  def delete
    category = Category.find(params[:id])
    category.delete
    redirect_to action: "list"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
