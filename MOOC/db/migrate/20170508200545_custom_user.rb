class CustomUser < ActiveRecord::Migration
  def change
      add_column :users , :name , :string
      add_column :users , :date_of_birth , :date
      add_column :users , :gender , :string
      add_column :users , :image , :string
  end
end
