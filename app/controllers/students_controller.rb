class StudentsController < ApplicationController

  layout :set_layout

  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  # def index
  #   @students = Student.order(:last_name)
  # end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  # def new
  #   @student = Student.new
  #   @courses = Course.all.collect{|c| [c.title, c.id]}
  # end

  # GET /students/1/edit
  # def edit
  #   @courses = Course.all.collect{|c| [c.title, c.id]}
  # end

  # POST /students
  # POST /students.json
  # def create
  #   @student = Student.new(student_params)
  #
  #   respond_to do |format|
  #     if @student.save
  #       format.html { redirect_to @student, notice: 'Student was successfully created.' }
  #       format.json { render action: 'show', status: :created, location: @student }
  #     else
  #       format.html { render action: 'new' }
  #       format.json { render json: @student.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  # def update
  #   respond_to do |format|
  #     if @student.update(student_params)
  #       format.html { redirect_to @student, notice: 'Student was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @student.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:profile_picture,:course_id,:email, :password, :first_name, :last_name, :student_number, :level, :date_of_birth, :telephone_number)
    end

    def set_layout
      if student_signed_in?
        "test"
      else
        "application"
      end
    end
end
