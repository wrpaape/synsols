json.array!(@participants) do |participant|
  json.extract! participant, :id, :employee_id, :course_id
  json.url participant_url(participant, format: :json)
end
