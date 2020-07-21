class StaticPagesController < ApplicationController
  def home
    @categorys = Category.get_home.first(6)
    @tours = Tour.take(6)
  end

  def about; end
end
