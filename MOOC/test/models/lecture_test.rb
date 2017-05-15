require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save lecture with title greater than 20" do
  lecture = Lecture.new
  lecture.title="ruby on rails validation"
  assert_not lecture.save
end
end
