class DevicesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @devices = current_user.devices
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
  end

  def destroy
  end

end
