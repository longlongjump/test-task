class StudentObserver < ActiveRecord::Observer
  observe :grade, :student_course

  def notify_grade_assigned
    Rails.logger.info 'grade assigned'
  end

  def notify_course_assigned
    Rails.logger.info 'course assigned'
  end

  def after_create(model)
    case model
    when Grade
      notify_grade_assigned
    when StudentCourse
      notify_course_assigned
    end
  end
end
