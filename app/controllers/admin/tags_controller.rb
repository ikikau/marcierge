# encoding: utf-8

class Admin::TagsController < Admin::ApplicationController

  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new params[:tag]
  end

  def create
    @tag = Tag.new params[:tag]

    if @tag.save
      redirect_to edit_admin_tag_path(@tag),
        notice: 'タグが作成されました'
    else
      flash.now[:alert] = 'タグの作成に失敗しました'
      render :new
    end
  end

  def edit
    @tag = Tag.find params[:id]
  end

  def update
    @tag = Tag.find params[:id]

    if @tag.update_attributes params[:tag]
      redirect_to edit_admin_tag_path(@tag),
        notice: 'タグが更新されました'
    else
      flash.now[:alert] = 'タグの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    tag = Tag.find params[:id]
    tag.destroy

    redirect_to admin_tags_path,
      notice: 'タグを削除しました'
  end

end

