class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories
    @total_amounts = {}
    @categories.each do |category|
      @total_amounts[category.id] = category.dealings.sum(&:amount)
    end
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      flash.now[:alert] = 'Category was not created'
      render :create
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
