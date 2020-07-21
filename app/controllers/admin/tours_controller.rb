class Admin::ToursController < Admin::ApplicationController
  before_action :load_tour, except: %i(new create index)
  def index
    @tours = Tour.paginate page: params[:page]
  end

  def show; end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new params[:tour]
    if @tour.save
      flash[:success] = "Tour create scuccess !"
      redirect_to @tour
    else
      flash[:danger] = "Tour incorrect !"
      render :new
    end
  end

  def edit; end

  def update
    if @tour.update params[:tour]
      flash[:success] = " Tour update success !"
      redirect_to @tour
    else
      render :edit
    end
  end

  def destroy
    if @tour.destroy
      flash[:success] = " Tour has deleted !"
    else
      flash[:danger] = "Tour don't exist !"
    end
    redirect_to admin_tours_path
  end

  private
  def load_tour
    @tour = Tour.find_by id: params[:id]
    return if @tour

    flash[:danger] = "Tour don't exist !"
    redirect_to admin_tours_path
  end
end
