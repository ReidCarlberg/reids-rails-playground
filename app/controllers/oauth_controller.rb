class OauthController < ApplicationController
  def start
    redirect_to client.web_server.authorize_url(
      :redirect_uri => 'http://localhost:3000/test1/success'
    )
  end

  def callback
    access_token = client.web_server.get_access_token(
      params[:code], :redirect_uri => 'http://localhost:3000/test1/success'
    )
    user_json = access_token.get('/me')
    # in reality you would at this point store the access_token.token value as well as 
    # any user info you wanted
    render :json => user_json
  end

  protected

  def client
    @client ||= OAuth2::Client.new(
      '3MVG99OxTyEMCQ3ivs8wbC2A8c9ugyWl9WDUOvGMdZyhhCylGIr_ivpqu_y.Efd6bDUNSOD5vUA2q68nLrWMB', 
      '4202789895455605424', 
      :site => 'https://login.salesforce.com',
      :authorize_path =>'/services/oauth2/authorize',
      :access_token_path => '/services/oauth2/token',
      :ssl=>{
        :verify=>OpenSSL::SSL::VERIFY_NONE
      }
    )
  end
end
