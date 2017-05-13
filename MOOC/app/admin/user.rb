ActiveAdmin.register  User do
    index do
      selectable_column
      id_column
      column :email
      column :name
      column :gender
      column :image
      column :is_instructor
      column :date_of_birth
      column :password
      actions
    end

    form do |f|
      f.inputs "User Details" do
        f.input :email
        f.input :password
        f.input :password_confirmation
        f.input :name
        f.input :gender
        f.input :image
        f.input :is_instructor
        f.input :date_of_birth
      end
      f.actions
    end

permit_params :email, :name, :gender,:image,:is_instructor,:date_of_birth,:password
end
