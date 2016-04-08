module AdvisorInfo
  class Search
    def initialize
      super
    end
    
    def self.firm(id, opts = {})
      firm = {}
      url = 'http://www.adviserinfo.sec.gov/IAPD/IAPDFirmSummary.aspx?ORG_PK='
      doc = Nokogiri::HTML(open(url + "#{id}"))
      if doc.css('.result-panel').text.include?("No match")
        firm[:result] = doc.css('.result-panel').text
      else
        doc = doc.css('.bcrow')
        if doc.css('.not-registered')
          firm[:name] = doc.css('.summary-displayname').text

          firm[:status] = doc.css('.not-registered').text
        else
          firm[:name] = doc.css('.summary-displayname').text
          firm[:juristiction] = doc.css('table#tbRegStatus').css('td').first.text
          firm[:registration_status] =  doc.css('table#tbRegStatus').css('td')[1].text
          firm[:effective_date] =  doc.css('table#tbRegStatus').css('td').last.text
        end
      end
      if opts[:CSV]
        AdvisorInfo.generate_csv(firm)
      end
      firm 
    end
    
    def self.individual(id, opts = {})
      individual = {}
      url = 'http://www.adviserinfo.sec.gov/IAPD/IAPDIndvlSummary.aspx?INDVL_PK='
      doc = Nokogiri::HTML(open(url + "#{id}"))
      if doc.css('.result-panel').text.include?("No match")
        individual[:result] = doc.css('.result-panel').text
      else
        doc = doc.css('.bcrow')
        info = doc.css('.listViewItemStyle').text.split("\r\n").reject!(&:empty?)
        individual[:name] = doc.css('.summary-displayname').text
        individual[:employer] = info.first.strip
        individual[:IARD] = info[1].strip.match(/#\S(\d+)/)[1]
      end
      if opts[:CSV]
        AdvisorInfo.generate_csv(individual)
      end
      individual
    end

  end
end

