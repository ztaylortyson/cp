require 'open-uri'

module Foo

	

  	def get_sbn
  	  @myhash = {}
      url = "https://apps.calbar.ca.gov/attorney/Licensee/Detail/#{current_user.sbn}"
      @page = Nokogiri::HTML(URI.open(url))
      		@myhash[:name] = @page.xpath('//*[@id="moduleMemberDetail"]/div[2]/h3/b').text
      		@myhash[:address] = @page.xpath('//*[@id="moduleMemberDetail"]/div[3]/p[1]/text()').text.strip#.split(':')[1]
      		@myhash[:phone] = @page.xpath('//*[@id="moduleMemberDetail"]/div[3]/p[2]').text
 	
            @myhash[:email] = @page.css("span#e#{get_email_position}").text

    end


    def get_email_position
        result = @page.css('style')[2].text
        position = result.index('inline')
        start = position - 11
        e = result[start..(start+2)]

            if e[0] == 'e'
                return e[1]
            else
                return e[0..1]
            end
    end
 
end