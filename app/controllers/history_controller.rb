require 'LoginHistory'

class HistoryController < ApplicationController
  before_filter :validate_user

  def index
    render :text => LoginHistory.get_first_hundred
  end

  def validate_user
    if !session[:user_info] 
      redirect_to "/", notice => "Please login as an admin user to continue."
    end
  end
  
end
