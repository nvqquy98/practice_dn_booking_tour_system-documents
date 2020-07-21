class CategorysController < ApplicationController
  before_action :load_category, only: %i(show)
  def index
    @categorys = Category.paginate page: params[:page]
  end

  def show
    @tours = @category.tours
  end

  private
  def load_category
    @category = Category.find_by id: params[:id]
    return if @category

    flash[:danger] = " Category don't exist !"
    redirect_to categorys_path
  end
end
