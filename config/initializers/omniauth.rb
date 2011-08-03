Rails.application.config.middleware.use OmniAuth::Builder do
  
    client_options = { :ssl => { :ca_file => "/usr/share/curl/curl-ca-bundle.crt" } }
    redirect_uri = 'http://localhost:3000/auth/salesforce/callback'
    
    if Rails.env.production?
      client_options = nil
      redirect_uri = 'https://cold-moon-137.herokuapp.com/auth/salesforce/callback'
    end
    
    RAILS_DEFAULT_LOGGER.debug "env? ", Rails.env
    RAILS_DEFAULT_LOGGER.debug "uri? ", redirect_uri
    
    #production
    #provider :salesforce, 
    #  ENV['SALESFORCE_OAUTH2_KEY'], 
    #  ENV['SALESFORCE_OAUTH2_SECRET'],
    #  { :redirect_uri => 'https://cold-moon-137.herokuapp.com/auth/salesforce/callback'}
    
    provider :salesforce, 
      ENV['SALESFORCE_OAUTH2_KEY'], 
      ENV['SALESFORCE_OAUTH2_SECRET'],
      { :client_options => client_options }
      { :redirect_uri => redirect_uri}
    
    
end