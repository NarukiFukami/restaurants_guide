class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:edit, :show, :update, :destroy]

  def show
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
    # redirect_to restaurant_path(@restaurant)
      redirect_to restaurants_path, notice: "データを保存しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path(@restaurant), notice: "アップデートしました"
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to redirect_to restaurants_path, notice: "deleted"
  end

  private

  def restaurant_params
    params[:restaurant].permit(
      :name,
      :address,
    )
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
