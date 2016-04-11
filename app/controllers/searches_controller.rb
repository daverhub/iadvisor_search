class SearchesController < ApplicationController
  def index
    csv = {:CSV => params[:CSV]}
    if params[:CRD].present?
      @results_arr = []
      if params[:CRD].include?(',')
        id_array = params[:CRD].split(',')
        id_array.each do |i|
          @results_arr << search_firm(i.strip, csv)
        end
        @results_arr
      else
        @results_arr << search_firm(params[:CRD], csv)
      end
    elsif params[:IARD].present?
       @results_arr = []
      if params[:IARD].include?(',')
        id_array = params[:IARD].split(',')
        id_array.each do |i|
          @results_arr << search_individual(i.strip, csv)
        end
        @results_arr
      else
        @results_arr << search_individual(params[:IARD], csv)
      end
    end
    @download_csv = params[:CSV]
    @firms = Firm.all
    @individuals = Individual.all
  end

  def download_csv
    send_file("#{Rails.root}/lib/data.csv", filename: "data.csv")
  end
  def search_firm(id, csv)
    search_result = AdvisorInfo::Search.firm(id, csv)
    Firm.find_or_create_by(id)
    search_result
  end
  def search_individual(id, csv)
    search_result =  AdvisorInfo::Search.individual(id, csv)
    Individual.find_or_create_by(id)
    search_result
  end
end
