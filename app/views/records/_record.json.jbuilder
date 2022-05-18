json.extract! record, :id, :course_id, :student_id, :score, :created_at, :updated_at
json.url record_url(record, format: :json)
