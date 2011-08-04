Rails.application.config.middleware.use OmniAuth::Builder do
  
    client_options = { :ssl => { :ca_file => "/usr/share/curl/curl-ca-bundle.crt" } }
    redirect_uri = 'http://localhost:3000/auth/salesforce/callback'
    
    if Rails.env.production?
      client_options = nil
      redirect_uri = 'https://cold-moon-137.herokuapp.com/auth/salesforce/callback'
    end

    puts "************HELLO LOGS!"
    puts "************Settings"
    puts "Production? ", Rails.env.production?
    puts "Client ", ENV['SALESFORCE_OAUTH2_KEY']
    puts "secret ", ENV['SALESFORCE_OAUTH2_SECRET']
    puts "URI ", ENV['SALESFORCE_OAUTH2_URI']
    puts "options ", client_options
    #production
    #provider :salesforce, 
    #  ENV['SALESFORCE_OAUTH2_KEY'], 
    #  ENV['SALESFORCE_OAUTH2_SECRET'],
    #  { :redirect_uri => 'https://cold-moon-137.herokuapp.com/auth/salesforce/callback'}
    
    provider :salesforce, 
      ENV['SALESFORCE_OAUTH2_KEY'], 
      ENV['SALESFORCE_OAUTH2_SECRET'],
      { :redirect_uri => 'https://cold-moon-137.herokuapp.com/auth/salesforce/callback'},
      { :client_options => client_options }
    
    
end