class BlogContent < ActiveRecord::Base

	validates :blog_id, presence: { message: "博客不能为空"}
	validates :user_id, presence: { message: "用户不能为空"}
	validates :content, presence: { message: "内容不能为空"}
	
	belongs_to :user
	belongs_to :blog

end
