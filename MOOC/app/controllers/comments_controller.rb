class CommentsController < ApplicationController
    before_action :find_lecture

    def create
        @comment=@lecture.comments.create(params[:comment].permit(:content))
        @comment.user_id=current_user.id
        @comment.save
        if  @comment.save
            redirect_to @lecture
        else
            redirect_to @lecture
        end
    end

    private
    def find_lecture
        @lecture=Lecture.find(params[:lecture_id])
    end

end
