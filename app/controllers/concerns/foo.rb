require 'open-uri'

module Foo

	

  	def get_sbn
  	  @myhash = {}
      url = "https://apps.calbar.ca.gov/attorney/Licensee/Detail/#{current_user.sbn}"
      page = Nokogiri::HTML(URI.open(url))
      		@myhash[:name] = page.xpath('//*[@id="moduleMemberDetail"]/div[2]/h3/b').text
      		@myhash[:address] = page.xpath('//*[@id="moduleMemberDetail"]/div[3]/p[1]/text()').text.strip#.split(':')[1]
      		@myhash[:phone] = page.xpath('//*[@id="moduleMemberDetail"]/div[3]/p[2]').text
      		
 	end

 

end