class ChangePostColumnsNullability < ActiveRecord::Migration[5.1]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :description, false
  end
end
