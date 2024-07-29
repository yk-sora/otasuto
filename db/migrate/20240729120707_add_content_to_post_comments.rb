class AddContentToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :content, :text
  end
end
