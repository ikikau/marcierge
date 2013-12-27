# encoding: utf-8

class Admin::InformationController < Admin::ApplicationController

  def index
    @information = Information.order('created_at').page(params[:page])
  end

  def new
    @information = Information.new params[:information]
  end

  def create
    @information = Information.new params[:information]

    if @information.save
      redirect_to edit_admin_information_path(@information),
        notice: 'お知らせが作成されました'
    else
      flash.now[:alert] = 'お知らせの作成に失敗しました'
      render :new
    end
  end

  def edit
    @information = Information.find params[:id]
  end

  def update
    @information = Information.find params[:id]

    if @information.update_attributes params[:information]
      redirect_to edit_admin_information_path(@information),
        notice: 'お知らせが更新されました'
    else
      flash.now[:alert] = 'お知らせの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    information = Information.find params[:id]
    information.destroy

    redirect_to admin_information_index_path,
      notice: 'お知らせを削除しました'
  end

end

