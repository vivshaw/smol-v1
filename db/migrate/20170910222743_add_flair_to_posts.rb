class AddFlairToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :flair, :string
  end
end
