require 'open-uri'

module TrialCalendars
    
    def launch
        @myhash = {}
        get_svcal1
        get_caldate
        scrape
    end

    def get_svcal1
        url = "http://www.sandiego.courts.ca.gov/portal/online/calendar/D_SVCAL1.HTML"
        @page = Nokogiri::HTML(URI.open(url))
    end


    def get_caldate
        @myhash[:caldate] = @page.xpath('//center/font[1]')[0].text
    end

    def scrape
        @arry = []
        @page.xpath('//tr[@class="MYDETAILTABLE"]').each do |i|
            if i.inner_html.include?('Civil Court Trial') # Civil Jury Trial
                 @myhash[:trial_name] = i.css('td')[3].text
                 @myhash[:trial_number] = i.css('td')[1].text
                 @myhash[:trial_time] = i.css('td')[0].text
                 @myhash[:type] = "Court Trial"
            elsif i.inner_html.include?('Civil Jury Trial')
                 @myhash[:trial_name] = i.css('td')[3].text
                 @myhash[:trial_number] = i.css('td')[1].text
                 @myhash[:trial_time] = i.css('td')[0].text
                 @myhash[:type] = "Jury Trial"
            end
        end
        @arry << @myhash
    end


end