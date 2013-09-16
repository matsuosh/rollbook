class RollsController < ApplicationController
  #before_action :set_roll, only: [:show, :edit, :update, :destroy]
  before_action :set_lesson, only: [:edit, :update, :absence, :substitute]

  # GET /lessons/:lesson_id/rolls
  # GET /lessons/:lesson_id/rolls.json
  def index
    if params[:lesson_id].present?
      @lesson = Lesson.find(params[:lesson_id])
      @rolls = index_by_lesson(@lesson)
      return
    end
    if params[:status].present?
      @rolls = Roll.joins(:lesson).where("rolls.status = ?", params[:status]).order("lessons.date")
      respond_to do |format|
        format.html { render action: "index_of_absence" }
      end
    end
  end

  def index_of_members_course
    @member = Member.find(params[:member_id])
    @members_course = MembersCourse.find(params[:id])
    @course = @members_course.course
    @rolls = Roll.joins(:lesson)
    @rolls.where!("lessons.course_id = ?", @members_course.course_id)
    @rolls.where!("rolls.member_id = ?", @members_course.member_id)
    @rolls.order!("lessons.date")
  end

  # GET /rolls/1
  # GET /rolls/1.json
  def show
  end

  # GET /rolls/new
  def new
    @roll = Roll.new
  end

  # GET /lessons/:lesson_id/rolls/edit
  def edit
    @rolls = @lesson.rolls
  end

  # POST /rolls
  # POST /rolls.json
  def create
    @roll = Roll.new(roll_params)

    respond_to do |format|
      if @roll.save
        format.html { redirect_to @roll, notice: 'Roll was successfully created.' }
        format.json { render action: 'show', status: :created, location: @roll }
      else
        format.html { render action: 'new' }
        format.json { render json: @roll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rolls/1
  # PATCH/PUT /rolls/1.json
  def update
    @lesson.update_attributes(status: "1")
    params[:rolls].each do |roll_params|
      roll = Roll.find(roll_params[:id])
      roll.update_attributes(status: roll_params[:status])
    end
    respond_to do |format|
      format.html { redirect_to lesson_rolls_url(@lesson) }
    end
  end

  # DELETE /rolls/1
  # DELETE /rolls/1.json
  def destroy
    @roll.destroy
    respond_to do |format|
      format.html { redirect_to rolls_url }
      format.json { head :no_content }
    end
  end

  def absence
    @rolls = Roll.joins(lesson: [course: [:instructor, :dance_style]])
    @rolls.where!("rolls.status = ?", "2")
    @rolls.where!("courses.id <> ?", @lesson.course.id)
    @rolls.order!("lessons.date")
    respond_to do |format|
      format.html { render action: "index_of_absence" }
    end
  end

  def substitute
    params[:rolls].each do |roll_params|
      absence_roll = Roll.find(roll_params[:id])
      absence_roll.update_attributes(status: "3")
      substitute_roll = @lesson.rolls.build(member_id: absence_roll.member_id, status: "4", substitute_roll_id: absence_roll.id)
      substitute_roll.save
    end
    respond_to do |format|
      format.html { redirect_to lesson_rolls_url(@lesson) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:lesson_id])
    end

    def set_roll
      @roll = Roll.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roll_params
      params.require(:roll).permit(:lesson_id, :member_id, :status, :substitute_roll_id)
    end

    def index_by_lesson(lesson)
      #@lesson = Lesson.find(params[:lesson_id])
      rolls = []
      MembersCourse.where(course_id: @lesson.course_id).date_is(@lesson.date).each do |members_course|
        attributes = { lesson_id: @lesson.id, member_id: members_course.member_id }
        if lesson.date <= Date.today
          rolls << Roll.find_or_create_by(attributes) do |roll|
            roll.status = "0"
          end
        else
          rolls << Roll.find_or_initialize_by(attributes) do |roll|
            roll.status = "0"
          end
        end
      end
      Roll.where(lesson_id: @lesson.id, status: "4").each do |roll|
        rolls << roll
      end
      rolls
    end
end
