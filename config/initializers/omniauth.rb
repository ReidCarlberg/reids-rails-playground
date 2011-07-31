Rails.application.config.middleware.use OmniAuth::Builder do
  provider :salesforce, 
    '3MVG99OxTyEMCQ3ivs8wbC2A8c.NNv8EDMoyw2u2x3D6kErJKWmot4Kkd16H_pbKZkWdwFZs7zay_27rqJtcQ', 
    '1618732396712108625',
    { :redirect_uri => 'https://cold-moon-137.herokuapp.com/auth/salesforce/callback'}
    
    
    
end