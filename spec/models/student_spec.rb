require 'spec_helper'

describe Student do
  it 'list available courses' do
    student = Student.create
    assigned_course = Course.create
    available_course = Course.create
    student.assign_course! assigned_course.id

    courses = student.available_courses
    courses.should == [available_course]
    student.courses.should == [assigned_course]
  end
end
