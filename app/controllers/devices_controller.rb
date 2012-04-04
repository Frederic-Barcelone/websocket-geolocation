class DevicesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @devices = current_user.devices
  end

  def sync
    Pusher['my_channel'].trigger('my_event', {:message => 'hello world'})
  end

  def show
    p "sync test page"
  end
end
