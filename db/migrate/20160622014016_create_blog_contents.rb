class CreateBlogContents < ActiveRecord::Migration
  def change
    create_table :blog_contents do |t|
    	t.integer :blog_id
    	t.integer :user_id
    	t.text :content
      t.timestamps null: false
    end
  end
end
