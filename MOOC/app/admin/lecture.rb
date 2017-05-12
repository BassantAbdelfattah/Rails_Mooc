ActiveAdmin.register  Lecture do

  permit_params :title, :course_id, :user_id,:content,:attachement,:image ;
end
