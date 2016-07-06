class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    puts "======"
    puts current_user
    puts "======"
    # user_posts_path()
  end

  private 

  def set_user
     puts "======"
     puts current_user
     puts "======"
     # id = current_user.id
     # user = User.find(id)
  end

end
