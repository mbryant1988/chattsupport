class BusinessesController < ApplicationController
  before_action :find_business, only: [:show, :edit, :update, :destroy]
  def index
    if params[:category].blank?
      @businesses = Business.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @businesses = Business.where(category_id: @category_id).order('created_at DESC')
    end

  end

  def show
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(businesses_params)
    if @business.save
      redirect_to @business
    else
      render "New"
    end
  end

  def edit
  end

  def update
    if @business.update(businesses_params)
      redirect_to @business
    else
      render "Edit"
    end
  end

  def destroy
    @business.destroy
    redirect_to root_path
  end

  private

  def businesses_params
    params.require(:business).permit(:company, :description, :url, :category_id)
  end

  def find_business
    @business = Business.find(params[:id])
  end
end
