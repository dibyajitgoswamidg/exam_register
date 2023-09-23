class Exam < ApplicationRecord
  belongs_to :college
  has_many :exam_windows

  scope :get_college_exam, -> (id, college_id) { where(id: id, college_id: college_id) }

  def in_time_window?(start_time)
    exam_windows.where(
      '? between exam_windows.start_time and exam_windows.end_time',
      start_time.to_datetime
    ).first
  end
end
