class PostsController < ApplicationController
  before_action :set_user, only: [:new, :create, :show, :destroy]
  before_action :set_post, only: [:show, :destroy]

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

  def destroy
    puts "========="
    puts "i'm here!"
    puts "========="
    @post.destroy
    redirect_to @user
  end

  private 
  def set_user
    @user = User.find(params[:user_id])   
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params  
    params.require(:post).permit(:image, :caption)
  end  
end
