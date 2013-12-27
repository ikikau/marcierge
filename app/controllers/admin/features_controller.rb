# encoding: utf-8

class Admin::FeaturesController < Admin::ApplicationController

  def index
    @features = Feature.order('created_at desc').page(params[:page])
  end

  def new
    @feature = Feature.new params[:feature]
  end

  def create
    @feature = Feature.new params[:feature]

    if @feature.save
      redirect_to edit_admin_feature_path(@feature),
        notice: '特集記事が作成されました'
    else
      flash.now[:alert] = '特集記事の作成に失敗しました'
      render :new
    end
  end

  def edit
    @feature = Feature.find params[:id]
  end

  def update
    @feature = Feature.find params[:id]

    if @feature.update_attributes params[:feature]
      redirect_to edit_admin_feature_path(@feature),
        notice: '特集記事が更新されました'
    else
      flash.now[:alert] = '特集記事の更新に失敗しました'
      render :edit
    end
  end

  def destroy
    feature = Feature.find params[:id]
    feature.destroy

    redirect_to admin_features_path,
      notice: '特集記事を削除しました'
  end

end

