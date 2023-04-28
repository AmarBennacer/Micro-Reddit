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
        @article = Article.find(params[:id])
      end

      def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
         flash[:notice] = "Article was updated"
         redirect_to article_path(@article)
        else
         flash[:notice] = "Article was not updated"
         render 'edit'
        end
      end

    private
  
    def post_params
      params.require(:post).permit(:title, :description)
    end
end
  