class TypesController < ApplicationController
  respond_to :html, :json

  before_action :authenticate_user!
  before_action :set_type, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :read, Type
    @types = Type.all
    respond_with(@types)
  end

  def show
    authorize! :read, Type
    respond_with(@type)
  end

  def new
    authorize! :create, Type
    @type = Type.new
    respond_with(@type)
  end

  def edit
    authorize! :update, Type
  end

  def create
    authorize! :create, Type
    @type = Type.new(type_params)
    @type.save
    respond_with(@type)
  end

  def update
    authorize! :update, Type
    @type.update(type_params)
    respond_with(@type)
  end

  def destroy
    authorize! :destroy, Type
    @type.destroy
    respond_with(@type)
  end

  private
    def set_type
      @type = Type.find(params[:id])
    end

    def type_params
      params.require(:type).permit(:name, :color)
    end
end
