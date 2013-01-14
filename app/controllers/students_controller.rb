class StudentsController < ApplicationController
  def index
    @students = Student.all

    respond_to do |format|
      format.html
      format.json { render json: @students }
    end
  end

  def show
    @student = Student.find(params[:id])
    @available_courses = @student.available_courses
    @grades = @student.grades.group_by(&:course_id)

    respond_to do |format|
      format.html
      format.json { render json: @student }
    end
  end

  def new
    @student = Student.new

    respond_to do |format|
      format.html
      format.json { render json: @student }
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_course
    @student = Student.find(params[:id])
    @course = Course.find(params[:course_id])
    student_course = @student.student_courses.find_or_create_by_course_id(params[:course_id])
    unless student_course.errors.any?
      flash[:notice] = 'Successfully assgned'
    end
    redirect_to :back
  end


  def assign_grade
    @student = Student.find(params[:id])
    @course = Course.find(params[:course_id])
    @grade = @student.grades.find_or_create_by_course_id(params[:course_id])
    @grade.value = params[:value]
    if @grade.save
      flash[:notice] = 'Successfully assgned'
    end
    redirect_to :back
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end
end
