json.array!(@forms) do |form|
  json.extract! form, :id, :name, :google_form_url, :frequency, :department_id
  json.url form_url(form, format: :json)
end
