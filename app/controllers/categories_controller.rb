class CategoriesController < ApplicationController
  respond_to :html, :json

  before_action :authenticate_user!
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :read, Category
    @categories = Category.all
    respond_with(@categories)
  end

  def show
    authorize! :read, Category
    respond_with(@category)
  end

  def new
    authorize! :create, Category
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    authorize! :create, Category
    @category = Category.new(category_params)
    @category.save
    redirect_to categories_path
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    authorize! :destroy, Category
    @category.destroy
    redirect_to categories_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
