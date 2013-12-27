# encoding: utf-8

class Admin::CreatorsController < Admin::ApplicationController

  def index
    @creators = Creator.order('created_at desc').page(params[:page])
  end

  def new
    @creator = Creator.new params[:creator]
  end

  def create
    @creator = Creator.new params[:creator]

    if @creator.save
      redirect_to edit_admin_creator_path(@creator),
        notice: 'クリエータが作成されました'
    else
      flash.now[:alert] = 'クリエータの作成に失敗しました'
      render :new
    end
  end

  def edit
    @creator = Creator.find params[:id]
  end

  def update
    @creator = Creator.find params[:id]

    if @creator.update_attributes params[:creator]
      redirect_to edit_admin_creator_path(@creator),
        notice: 'クリエータが更新されました'
    else
      flash.now[:alert] = 'クリエータの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    creator = Creator.find params[:id]
    creator.destroy

    redirect_to admin_creators_path,
      notice: 'クリエータを削除しました'
  end

end

