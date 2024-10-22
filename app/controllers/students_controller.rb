class StudentsController < ApplicationController
# GET /students or /students.json
def index
  # Initialize @students to none by default
  @students = Student.none

  if params[:commit] == "Show All"
    @students = Student.all
  elsif params[:commit] == "Search"
    @students = Student.all # Initialize to all students

    if params[:major].present?
      @students = @students.where(major: params[:major])
    end

    if params[:graduation_date].present?
      begin
        parsed_date = Date.parse(params[:graduation_date])
        @students = @students.where(graduation_date: parsed_date)
      rescue ArgumentError
        flash.now[:alert] = "Invalid graduation date format."
      end
    end

    if params[:query].present?
      @students = @students.where("name ILIKE ?", "%#{params[:query]}%")
    end
  else
    @students = []
  end
end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)
  
    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy!

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :school_email, :major, :minor, :graduation_date, :profile_picture)
    end
    
end
