class DealingsController < ApplicationController
  def index
    @dealings = current_user.dealings
    @category = Category.find(params[:category_id])
  end

  def create
    @dealing = Dealing.new(dealing_params)
    @dealing.author_id = current_user.id

    category_ids = params[:dealing][:category_ids]
    @dealing.categories = Category.where(id: category_ids)

    if @dealing.save
      redirect_to category_path(@dealing.categories.first), notice: 'Transaction was successfully created.'
    else
      flash.now[:alert] = 'Transaction was not created'
      render :new
    end
  end

  private

  def dealing_params
    params.require(:dealing).permit(:name, :amount, category_ids: []) 
  end
end