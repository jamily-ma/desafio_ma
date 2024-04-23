module Users
  class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
   
    def index
      @posts = Post.all.order('created_at: :desc').paginate(page: params[:page], per_page: 3)
      @tags = ActsAsTaggableOn::Tag.all
    end
  
    def show
      @comment = Comment.new
      @comment.post_id = @post.id
    end
  
    def new
      @post = current_user.posts.build
    end
  
    def edit
    end
  
    def create
      @post = current_user.posts.build(post_params)
  
        if @post.save
          redirect_to @post, notice: 'Post was successfully created.' }
        else
          render :new 
        end
    end
  
    def update

        if @post.update(post_params)
          redirect_to @post, notice: 'Post was successfully updated.' 
        else
          render :edit 
        end
    end
  
  
    def destroy
      @post.destroy
        redirect_to root_path, notice: 'Post was successfully destroyed.' 
      end
    end
  
    private
      def set_post
        @post = Post.find(params[:id])
      end
  
      def post_params
        params.require(:post).permit(:title, :body, :tag_list)
      end
end
