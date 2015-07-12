class AddUserNamesToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user_name, :string
  end
end
