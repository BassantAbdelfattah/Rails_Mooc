class LecturesController < ApplicationController
  before_action :set_lecture, only: [:show, :edit, :update, :destroy, :spam, :unspam]
  before_action :authenticate_user!
  before_action :load_courses, only: [:new, :create, :update, :edit]

  # GET /lectures
  # GET /lectures.json
  def index
    @lectures = Lecture.all
  end

  # GET /lectures/1
  # GET /lectures/1.json
  def show
      @comments=Comment.where(lecture_id: @lecture).order("created_at DESC")
  end


  # GET /lectures/new
  def new
      if !current_user.is_instructor
          redirect_to lectures_path
      else

          @lecture = Lecture.new
      end
  end

  # GET /lectures/1/edit
  def edit
  end

  def download_file
    @lecture = Lecture.find(params[:id])
    send_file(@lecture.attachement.path,
        :disposition => 'attachment',
        :url_based_filename => false)
  end

  # POST /lectures
  # POST /lectures.json
  def create
      if !current_user.is_instructor
          redirect_to lectures_path
      end
    @lecture = Lecture.new(lecture_params)
    @lecture.user_id=current_user.id

    respond_to do |format|
      if @lecture.save
        format.html { redirect_to @lecture, notice: 'Lecture was successfully created.' }
        format.json { render :show, status: :created, location: @lecture }
      else
        format.html { render :new }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lectures/1
  # PATCH/PUT /lectures/1.json

  def update
      if !current_user.is_instructor
          redirect_to lectures_path
      end
    @lecture.user_id=current_user.id
    respond_to do |format|
      if @lecture.update(lecture_params)
        format.html { redirect_to @lecture, notice: 'Lecture was successfully updated.' }
        format.json { render :show, status: :ok, location: @lecture }
      else
        format.html { render :edit }
        format.json { render json: @lecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lectures/1
  # DELETE /lectures/1.json
  def destroy
    @lecture.destroy
    respond_to do |format|
      format.html { redirect_to lectures_url, notice: 'Lecture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def upvote
  @lecture = Lecture.find(params[:id])
  @lecture.upvote_by current_user
    redirect_to @lecture
  end

def downvote
  @lecture = Lecture.find(params[:id])
  @lecture.downvote_by current_user
  redirect_to @lecture
end

def spam
   current_user.lectures << @lecture
   current_user.save
   redirect_to lectures_path

end

 def unspam
   current_user.lectures.delete(@lecture)
   current_user.save
   redirect_to lectures_path
 end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_lecture
      @lecture = Lecture.find(params[:id])
    end
    
    def load_courses
      @courses=Course.where(user_id: current_user);
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lecture_params
      params.require(:lecture).permit(:title, :image, :content, :attachement, :course_id)
    end
end
