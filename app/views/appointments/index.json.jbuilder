json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :patient, :problem, :doctor_id
  json.url appointment_url(appointment, format: :json)
end
