class MessagesController < ApplicationController
	
	before_filter :auth_user
	
	def index
		params[:type] ||= "index"
		@messages = if params[:type] == "index"
			current_user.inboxes
		else
			current_user.outboxes
		end
		@messages = @messages
			.page(params[:page] ||1)
			.per_page(params[:per_page] || 10)
			.order("id desc")
	end
	
	def new
		@message = current_user.outboxes.new
	end

	def create
		
	end
	
	def show
		
	end
end
