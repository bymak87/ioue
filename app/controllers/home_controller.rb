class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to "/users/#{current_user.id}"
    end
  end
end
