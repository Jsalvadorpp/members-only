class PostsController < ApplicationController
    before_action :logged , only: [:new,:create]

    def index
    end

    def new
        @post = Post.new
    end

    def create
    end



end
