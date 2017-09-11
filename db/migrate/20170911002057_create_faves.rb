class CreateFaves < ActiveRecord::Migration[5.1]
  def change
    create_table :faves do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
