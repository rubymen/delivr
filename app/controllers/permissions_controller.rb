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

  def edit
    authorize! :manage, Permission
  end

  def update
    authorize! :manage, Permission
    @permission.update(permission_params)
    redirect_to permissions_path
  end

  private
    def set_permission
      @permission = Permission.find(params[:id])
    end

    def permission_params
      params.require(:permission).permit(:manager_read, :manager_create, :manager_update, :manager_delete, :member_read, :member_create, :member_update, :member_delete)
    end
end
