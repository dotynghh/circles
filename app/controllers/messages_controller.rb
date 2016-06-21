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
		@message = current_user.outboxes.new(params.require(:message).permit!)
	
		@message.sender_id = current_user.id
		if @message.save
			flash[:notice] = "发送成功"
			redirect_to messages_path
		else
			flash[:notich] = "发送失败"
			render action: :new
		end
	end
	
  def show
    @message = Message.find(params[:id])
    unless @message.sender == current_user or 
      @message.receiver == current_user
      render text: "403 Forbidden"
      return
    else
      if @message.receiver == current_user
        @message.update_attribute :is_read, true
      end
    end
  end

	private

	def message_attrs
		params.require(:message).permit(:receiver_username, :content)
	end
end
