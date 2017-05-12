ActiveAdmin.register  User do

permit_params :email, :name, :gender,:image,:is_instructor,:date_of_birth,:password
end
