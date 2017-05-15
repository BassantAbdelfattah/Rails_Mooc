require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save course without title" do
  course = Course.new
  assert_not course.save
  end
  
  test "should not save lecture with title greater than 20" do
  course = Course.new
  course.title="ruby on rails validation"
  assert_not course.save
  end

end
