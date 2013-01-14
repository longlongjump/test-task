class Student < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :courses, through: :student_courses
  has_many :student_courses
  has_many :grades

  def available_courses
    Course.joins("LEFT JOIN student_courses as sc ON sc.course_id == courses.id AND sc.student_id = #{self.id}")
          .where('sc.student_id IS NULL')
  end

  def assign_course! course_id
    StudentCourse.create!({student_id: self.id, course_id: course_id})
  end
end
