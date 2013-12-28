# encoding: utf-8

class Admin::EventsController < Admin::ApplicationController

  def index
    @events = Event.order('created_at desc').page(params[:page])
  end

  def new
    @event = Event.new params[:event]
    build_associated @event
  end

  def create
    @event = Event.new params[:event]
    build_associated @event

    if @event.save
      redirect_to edit_admin_event_path(@event),
        notice: 'イベントが作成されました'
    else
      flash.now[:alert] = 'イベントの作成に失敗しました'
      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
    build_associated @event
  end

  def update
    @event = Event.find params[:id]
    build_associated @event

    if @event.update_attributes params[:event]
      redirect_to edit_admin_event_path(@event),
        notice: 'イベントが更新されました'
    else
      flash.now[:alert] = 'イベントの更新に失敗しました'
      render :edit
    end
  end

  def destroy
    event = Event.find params[:id]
    event.destroy

    redirect_to admin_events_path,
      notice: 'イベントを削除しました'
  end


private


  def build_associated(event, num_dates = 2)
    event.build_thumbnail unless event.thumbnail.present?
    num = [0, num_dates - event.event_dates.count - 1].max
    num.times { event.event_dates.build }
  end

end

