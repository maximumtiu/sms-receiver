json.extract! phone_number, :id, :e164_number, :twilio_sid, :created_at, :updated_at
json.url phone_number_url(phone_number, format: :json)
