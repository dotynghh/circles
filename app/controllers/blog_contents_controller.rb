class BlogContentsController < ApplicationController
	before_filter :auth_user

	def index
		@blog_content = BlogContent.new
	end

	def create
		@blog_content = current_user.blog_contents.new(content_attrs)

    if @blog_content.save
      flash[:notice] = "回复成功"
      redirect_to :back
    else
 
    flash[:notice] = "回复失败"
      redirect_to :back
    end
	end
	
	def destroy
		@blog_content = BlogContent.find params[:id]
		if @blog_content.user == current_user
			@blog_content.destroy
			flash[:notice] = "删除回复成功"
			redirect_to :back	
		else
			flash[:notice] = "删除回复失败"
			redirect_to :back
		end
	end

	private
	
	def content_attrs
    params.require(:blog_content).permit(:blog_id, :content)
  end

end
