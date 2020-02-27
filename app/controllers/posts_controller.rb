class PostsController < ApplicationController
    before_action :logged , only: [:new,:create]

    def index
    end

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)

        if @post.save
            flash[:success] = 'Post created!'
            redirect_to home_path
        else
            render 'new'
        end
    end

    private def post_params
        params.require('post').permit(:title,:bodyText)
    end


end
