class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.date :open_date
      t.date :close_date

      t.timestamps
    end
  end
end
