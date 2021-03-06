class OrdersController < ApplicationController
  respond_to :html, :json

  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :read, Order
    if params[:per_page]
      @per_page = params[:per_page]
    else
      @per_page = 10
     end
    @orders = Order.paginate(:per_page => @per_page, :page => params[:page])
    respond_with(@orders)
  end

  def show
    authorize! :read, @order
    respond_with(@order)
  end

  def new
    authorize! :create, Order
    @order = Order.new
    respond_with(@order)
  end

  def edit
    authorize! :update, Order
  end

  def create
    authorize! :create, Order
    @order = Order.new(order_params)
    @order.user = current_user
    @order.save
    redirect_to orders_path
  end

  def update
    authorize! :update, Order
    @order.user = current_user
    @order.update(order_params)
    @order.save
    redirect_to orders_path
  end

  def destroy
    authorize! :destroy, Order
    @order.destroy
    redirect_to orders_path
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:type_id, :category_id, :begin_date, :end_date, :user_id)
    end
end
