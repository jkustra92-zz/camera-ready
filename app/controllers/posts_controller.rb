class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new, :create, :show, :destroy
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
     if @post.save
      @user.posts << @post
      redirect_to @user
    else
      flash[:error] = "something went wrong :("                                   #so if there's an issue with the form and it can't submit, this error message will post. 
      render :action => :new
    end
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
