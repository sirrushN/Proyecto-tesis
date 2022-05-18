class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: %i[ show edit update destroy ]
  before_action :set_professors, only: [:new, :edit]
  before_action :set_subjects, only: [:new, :edit ]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Registro creado exitosamente." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Registro actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    if @course.destroy

      respond_to do |format|
        format.html { redirect_to courses_url, notice: "Registro eliminado exitosamente." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to courses_url, notice: @course.errors[:base].to_sentence }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def set_professors
      @professors = Professor.all
    end

    def set_subjects
      @subjects = Subject.all
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:professor_id, :subject_id, :period)
    end
end
