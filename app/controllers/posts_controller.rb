class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, except: [:index, :new, :create, :show]

    def index
      @posts = Post.paginate(page: params[:page], per_page: 3)
    end

    def new
      @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
       end
  
    def create
      #Rails.logger.info("Params: #{params.inspect}")
      @post = Post.new(post_params)
      @post.user = current_user

      if @post.save
        flash[:notice] = "post was successfully created"
        redirect_to posts_path
      else
        render 'new'
      end
    end
  
    def edit
        @post = Post.find(params[:id])
      end

      def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
         flash[:notice] = "post was updated"
         redirect_to post_path(@post)
        else
         flash[:notice] = "post was not updated"
         render 'edit'
        end
      end


      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:notice] = "post was deleted"
        redirect_to posts_path
       end

       
    private
  
    def post_params
      params.require(:post).permit(:title, :description, :user_id)
    end

    def set_post
      @post = Post.find(params[:id])
    end
  
    def authorize_user!
      return if current_user.admin? || @post.user == current_user
  
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end    
end
  