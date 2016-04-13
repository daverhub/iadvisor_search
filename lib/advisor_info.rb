require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

module AdvisorInfo
  extend self
  base_uri = 'http://www.adviserinfo.sec.gov/IAPD/'
  #http://www.adviserinfo.sec.gov/IAPD/IAPDFirmSummary.aspx?ORG_PK=111604
  #http://www.adviserinfo.sec.gov/IAPD/IAPDIndvlSummary.aspx?INDVL_PK=2160718

  def self.generate_csv(data)
   CSV.open("lib/data.csv", "wb") do |csv|
     csv << data.keys
     csv << data.values
    end
  end

end
