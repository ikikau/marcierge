# encoding: utf-8

class Admin::EventsController < Admin::ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new params[:event]
  end

  def create
    @event = Event.new params[:event]

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
  end

  def update
    @event = Event.find params[:id]

    if @event.update_attributes params[:event]
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

end

