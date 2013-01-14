class StudentCourse < ActiveRecord::Base
  attr_accessible :student_id, :course_id
  belongs_to :course
  belongs_to :student
end
