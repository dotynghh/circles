class Message < ActiveRecord::Base
	belongs_to :sender, class_name: :User
	belongs_to :receiver, class_name: :User

	def is_read_to_s
		self.is_read ? "已读" : "未读"
	end
end
