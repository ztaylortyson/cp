require 'open-uri'

module Foo

  	def get_sbn
  	  @myhash = {}
      url = "https://apps.calbar.ca.gov/attorney/Licensee/Detail/#{current_user.sbn}"
      @page = Nokogiri::HTML(URI.open(url))
      		@myhash[:name] = @page.xpath('//*[@id="moduleMemberDetail"]/div[2]/h3/b').text.strip.split(/\n/)[0]
            @myhash[:sbn] = @page.xpath('//*[@id="moduleMemberDetail"]/div[2]/h3/b').text.strip.split(/\n/)[2]
      		@myhash[:address] = @page.xpath('//*[@id="moduleMemberDetail"]/div[3]/p[1]/text()').text.strip#.split(':')[1]
      		ph = @page.xpath('//*[@id="moduleMemberDetail"]/div[3]/p[2]').text
            @myhash[:phone] = ph.match(/\b(\d{2}[\s|\-|\d]{2}\d{2}[\s|\d][\s|\-|\d]\d{2,5})\b/).to_s
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



    def blah
        str = @myhash[:address]
        str2 = str.split(/\:/)
        str3 = str2[1].split(/\,/)


        if str3.count > 3
            @myhash[:firm] = str3[0]
            @myhash[:address] = str3[1]
            @myhash[:city] = str3[2]
            @myhash[:state] = str3[2].split()[0]
            @myhash[:zip] = str3[2].split()[1]
        else
            @myhash[:address] = str3[0]
            @myhash[:city] = str3[1]
            @myhash[:state] = str3[2].split()[0]
            @myhash[:zip] = str3[2].split()[1]
        end


    end



end

