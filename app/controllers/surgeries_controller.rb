class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @surgerie = Surgery.find(params[:id])
  end

end
