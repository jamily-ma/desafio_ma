class CommentsController < ApplicationController
    before_action :set_comment, only: [:edit, :update]
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
      @comments = Comment.all.order('created_at DESC')
    end
  
  
    def create    
      @comment = @post.comments.new(comment_params)
      @comment.anonymous_name_or_ip = request.remote_ip 
        if @comment.anonymous_name_or_ip.blank?
      @comment.user_id = current_user.id
      end

     if @comment.save
      redirect_to @post, notice: 'SUCESSO'
      else
        render :new
      end
    end
   
  
    private

      def set_post
        @post = Post.find(params[:post_id])
      end
      
      def comment_params
        params.require(:comment).permit(:content)
      end
  end