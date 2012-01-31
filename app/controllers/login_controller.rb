class LoginController < ApplicationController
  def index
    if current_user
      redirect_to devices_path
    end
  end
end
