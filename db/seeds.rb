# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

College.create(
  [
    { name: 'Benaras Home Universit(BHU)' },
    { name: 'Christ University (Bangalore)' },
    { name: 'National Institute of Fashion Technology (Bangalore)' },
    { name: 'IIIT Bangalore' },
    { name: 'Indian Institute of Hotel Management (Kolkata)' },
    { name: 'National Institute of Technology (Durgapur)' },
    { name: 'Indian Institute of Technology (Kharagpur)' },
    { name: 'AIMS Bangalore' }
  ]
)

exam_types = ['Entrance', 'Semester']
exam_data = []
College.all.pluck(:id).each do |id|
  exam_types.each do |name|
    exam_data << {
      college_id: id,
      name: name
    }
  end
end
Exam.create(exam_data)

exam_window_data = []
exam_windows = [
  {start_time: '2023-10-4 10:00:00', end_time: '2023-10-4 12:00:00'},
  {start_time: '2023-10-8 09:00:00', end_time: '2023-10-4 11:00:00'},
  {start_time: '2023-10-14 14:30:00', end_time: '2023-10-4 16:30:00'}
]
Exam.all.pluck(:id).each do |id|
  exam_windows.each do |window|
    exam_window_data << {
      start_time: window[:start_time],
      end_time: window[:end_time],
      exam_id: id
    }
  end
end

ExamWindow.create(exam_window_data)
