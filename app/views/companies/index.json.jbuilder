json.array!(@companies) do |company|
  json.extract! company, :id, :string
  json.url company_url(company, format: :json)
end
