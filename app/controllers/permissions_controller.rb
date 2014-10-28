class PermissionsController < ApplicationController
  respond_to :html, :json

  before_action :authenticate_user!
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  def index
    authorize! :manage, Permission
    @permissions = Permission.all
    respond_with(@permissions)
  end

  def show
    authorize! :manage, Permission
    respond_with(@permission)
  end

  def new
    authorize! :manage, Permission
    @permission = Permission.new
    respond_with(@permission)
  end

  def edit
    authorize! :manage, Permission
  end

  def create
    authorize! :manage, Permission
    @permission = Permission.new(permission_params)
    @permission.save
    respond_with(@permission)
  end

  def update
    authorize! :manage, Permission
    @permission.update(permission_params)
    respond_with(@permission)
  end

  def destroy
    authorize! :manage, Permission
    @permission.destroy
    respond_with(@permission)
  end

  private
    def set_permission
      @permission = Permission.find(params[:id])
    end

    def permission_params
      params.require(:permission).permit(:manager_read, :manager_create, :manager_update, :manager_delete, :member_read, :member_create, :member_update, :member_delete)
    end
end
