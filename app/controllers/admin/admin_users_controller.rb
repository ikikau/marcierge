# encoding: utf-8

class Admin::AdminUsersController < Admin::ApplicationController

  def index
    @admins = AdminUser.all
  end

  def new
    @admin = AdminUser.new params[:admin]
  end

  def create
    @admin = AdminUser.new params[:admin]

    if @admin.save
      redirect_to edit_admin_admin_user_path(@admin),
        notice: '管理者が作成されました'
    else
      flash.now[:alert] = '管理者の作成に失敗しました'
      render :new
    end
  end

  def edit
    @admin = AdminUser.find params[:id]
  end

  def update
    @admin = AdminUser.find params[:id]

    if @admin.update_attributes params[:admin]
      redirect_to edit_admin_admin_user_path(@admin),
        notice: '管理者が更新されました'
    else
      flash.now[:alert] = '管理者の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    admin = AdminUser.find params[:id]
    admin.destroy

    redirect_to admin_admin_users_path,
      notice: '管理者を削除しました'
  end

end

