class SessionsController < ApplicationController
  def new
    redirect_to '/auth/salesforce'
  end

  def create
    ENV['sfdc_token'] = request.env['omniauth.auth']['credentials']['token']
    ENV['sfdc_instance_url'] = request.env['omniauth.auth']['instance_url']
    render :text => request.env['omniauth.auth'].inspect
    session[:user_info] = request.env['omniauth.auth']['user_info']
    session[:user_hash] = request.env['omniauth.auth']['user_hash']
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Signed out!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
  
end

