json.extract! course, :id, :professor_id, :subject_id, :period, :created_at, :updated_at
json.url course_url(course, format: :json)
