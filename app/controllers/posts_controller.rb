class PostsController < ApplicationController
  before_action :set_user, only: [:new, :create]
  def index
    
  end

  def show
    
  end

  def new
    puts "====="
    p params
    puts "======"
    @post = Post.new
  end

  def create 
    puts "========"
    puts post_params
    puts "========"
    @post = Post.new(post_params)
    @user.posts << @post
    puts "=========="
    p @user
    puts "=========="
    p @user.posts
    puts "=========="
    redirect_to @user
  end

  private 
  def set_user
    @user = User.find(params[:user_id])   
  end

  def post_params  
    params.require(:post).permit(:image, :caption)
  end  
end
