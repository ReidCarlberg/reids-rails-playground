class AdminController < ApplicationController 
  
  before_filter :validate_user, :only=> [:finddata]
  
  def index
    
  end

  def finddata
    handleInit()
  end
  


  def handleInit
    source = "http://feeds.feedburner.com/CodeShareLatestProjects" # url or local file
    content = "" # raw content of rss feed will be loaded here
    open(source) do |s| content = s.read end
    rss = RSS::Parser.parse(content, false)
   rss.items.each do |current|
    #print "here is the sample."
     #current = rss.items[0]
      rawHtml = Net::HTTP.get URI.parse(current.link)
      doc = Nokogiri::HTML.parse(rawHtml)
      sourceUrl = doc.xpath("//a[@class='download']/@href").to_s()
      installUrl = doc.xpath("//a[@class='install']/@href").to_s()
      memberName = doc.xpath("//a[starts-with(@href, '/codeshare/MemberProfilePage?')]/text()").to_s()
      newListing = Option.new
      newListing.title = current.title
      newListing.link = current.link
      newListing.description = current.description[0..250]
      newListing.pubdate = current.date.to_s()
      newListing.guid = current.guid.to_s()
      newListing.author = memberName
      newListing.sourceUrl = sourceUrl
      newListing.installUrl = installUrl
      newListing.save
      print "Saved! ", newListing.title, "\n"
   end
  end

  private

    def validate_user
      if !session[:user_info] || session[:user_hash][:user_id] != "005300000048uZ1AAI"
        redirect_to "/", notice => "Please login as an admin user to continue."
      end
    end
  
end
