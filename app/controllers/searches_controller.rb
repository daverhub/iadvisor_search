class SearchesController < ApplicationController
  def index
    if params[:CRD].present?
        @results = AdvisorInfo::Search.firm(params[:CRD], {CSV: params[:CSV]})
        Firm.find_or_create_by(@results)
    elsif params[:IARD].present?
        @results = AdvisorInfo::Search.individual(params[:IARD], {CSV: params[:CSV]} )
        Individual.find_or_create_by(@results)
    end
    @download_csv = params[:CSV]
    @firms = Firm.all
    @individuals = Individual.all
  end

  def download_csv
    send_file("#{Rails.root}/lib/data.csv", filename: "data.csv")
  end
end
