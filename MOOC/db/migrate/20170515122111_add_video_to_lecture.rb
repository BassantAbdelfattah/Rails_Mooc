class AddVideoToLecture < ActiveRecord::Migration
  def change
      add_column :lectures , :video , :string

  end
end
