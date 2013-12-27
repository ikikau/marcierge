# encoding: utf-8

class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.order('created_at desc').page(params[:page])
  end

  def new
    @user = User.new params[:user]
  end

  def create
    @user = User.new params[:user]
    @user.confirm!

    if @user.save
      redirect_to edit_admin_user_path(@user),
        notice: 'ユーザが作成されました'
    else
      flash.now[:alert] = 'ユーザの作成に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      redirect_to edit_admin_user_path(@user),
        notice: 'ユーザが更新されました'
    else
      flash.now[:alert] = 'ユーザの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to admin_users_path,
      notice: 'ユーザを削除しました'
  end

end

