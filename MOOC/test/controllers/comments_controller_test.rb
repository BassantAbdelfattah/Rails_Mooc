require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

      test "should create comment" do
          @comment=comments(:comments)
          assert_difference('Comment.count') do
          post :create, comment: { user_id: @comment.user_id ,content: @comment.content,lecture_id: @comment.lecture_id}
          end
          assert_response :redirect
      end
      test "should find lecture" do
          get :find_lecture, lecture_id: 5
          assert_response :success
       end
end
