class AddFieldsToLecture < ActiveRecord::Migration
  def change
      add_column :lectures , :title , :string
      add_column :lectures , :image , :string

  end
end
