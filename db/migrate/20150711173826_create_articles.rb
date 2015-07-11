class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :text
      t.boolean :is_beginner
      t.string :github_url

      t.timestamps null: false
    end
  end
end
