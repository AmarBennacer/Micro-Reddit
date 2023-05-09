class PostsController < ApplicationController

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
end
  