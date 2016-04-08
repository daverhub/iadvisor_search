json.array!(@firms) do |firm|
  json.extract! firm, :id, :name, :status, :juristiction, :registration_status, :effective_date
  json.url firm_url(firm, format: :json)
end
