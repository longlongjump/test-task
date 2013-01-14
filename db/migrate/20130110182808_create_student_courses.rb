class CreateStudentCourses < ActiveRecord::Migration
  def change
    create_table :student_courses do |t|
      t.references :course
      t.references :student
      t.timestamps
    end
  end
end
