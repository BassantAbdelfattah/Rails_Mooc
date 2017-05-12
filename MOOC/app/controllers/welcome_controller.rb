class WelcomeController < ApplicationController
  def index
      @lectures=Lecture.all.order('created_at desc').limit(4)
  end
end
