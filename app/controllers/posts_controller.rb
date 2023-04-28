class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
      @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
       end
  
    def create
      @post = Post.new(post_params)
  
      if @post.save
        flash[:notice] = "post was successfully created"
        redirect_to post_path(@post)
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

    private
  
    def post_params
      params.require(:post).permit(:title, :description)
    end
end
  