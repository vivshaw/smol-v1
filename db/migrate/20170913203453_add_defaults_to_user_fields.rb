class AddDefaultsToUserFields < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :colortheme, "blue")
    change_column_null(:users, :colortheme, false)
    change_column_default(:users, :description, "A smol user.")
    change_column_null(:users, :description, false)
  end
end
