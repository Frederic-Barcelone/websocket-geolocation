class LoginController < ApplicationController
  def index
    if current_user
      redirect_to home_path
    end
  end
end
