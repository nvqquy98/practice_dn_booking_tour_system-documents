class ToursController < ApplicationController
  before_action :load_tour, only: %i(index show)
  def index; end

  def show
    @tour_details = @tour.tour_details
  end

  private
  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour

    flash[:danger] = "Tours don't exist !"
    redirect_to root_path
  end
end
