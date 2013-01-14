class Course < ActiveRecord::Base
  attr_accessible :name

  has_many :students, through: :student_courses
  has_many :grades
end
