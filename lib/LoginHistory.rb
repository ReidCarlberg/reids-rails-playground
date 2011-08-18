require 'rubygems'
require 'httparty'

class LoginHistory
  include HTTParty
  #doesn't seem to pick up env variable correctly if I set it here
  #headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  format :json
  #debug_output $stderr

  def self.set_headers
    headers 'Authorization' => "OAuth #{ENV['sfdc_token']}"
  end

  def self.root_url
    puts "****** root url "
    puts "instance ", ENV['sfdc_instance_url']
    puts "api ", ENV['sfdc_api_version']
    myUrl = ENV['sfdc_instance_url'].sub("{version}",ENV['sfdc_api_version'])
    puts "myUrl ", myUrl
    #@root_url = ENV['sfdc_instance_url']+"/services/data/v"+ENV['sfdc_api_version']
    @root_url = myUrl
  end

  def self.get_first_hundred
    puts "**************** Login History First Hundred"
    LoginHistory.set_headers
    #myQuery = LoginHistory.root_url+"query/?q=#{CGI::escape('SELECT Name, Id from Account LIMIT 100')}"
    myQuery = LoginHistory.root_url+"query/?q=#{CGI::escape('SELECT UserId, LoginTime from LoginHistory')}"
    puts "myQuery ", myQuery
    get(myQuery)
  end

end