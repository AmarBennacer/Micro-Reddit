class PostsController < ApplicationController
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
    
    end

    private
  
    def post_params
      params.require(:post).permit(:title, :description)
    end
end
  