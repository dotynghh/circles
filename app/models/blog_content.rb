class BlogContent < ActiveRecord::Base

	validates :blog_id, presence: { message: "博客不能为空"}
	validates :user_id, presence: { message: "用户不能为空"}
	validates :content, presence: { message: "内容不能为空"}
	
	belongs_to :user
	belongs_to :blog
	
	after_create :add_counts
	after_destroy :delete_counts

	private

	def add_counts
		self.blog.content_counts = self.blog.content_counts.to_i + 1
		self.blog.save
		
	end

	def delete_counts
		if self.blog.content_counts == 0
			return
		end
		self.blog.content_counts = self.blog.content_counts.to_i - 1
		self.blog.save
	end

end
