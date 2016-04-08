json.array!(@individuals) do |individual|
  json.extract! individual, :id, :name, :employer, :IARD, :result, :CRD
  json.url individual_url(individual, format: :json)
end
