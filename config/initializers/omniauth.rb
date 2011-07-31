Rails.application.config.middleware.use OmniAuth::Builder do
  provider :salesforce, 
    '3MVG99OxTyEMCQ3ivs8wbC2A8c1RKWGH16lDCWDv513AJh4g_XFjq1jmACXclk6iU49epvTXBclJNb3lW0lHK', 
    '3584425645079061440',
    { :redirect_uri => 'https://cold-moon-137.herokuapp.com/auth/salesforce/callback'}
    
    
    
end