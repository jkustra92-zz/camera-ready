Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :users do
    resources :posts
  end
end

          #           root GET    /                                        home#index
          #     user_posts GET    /users/:user_id/posts(.:format)          posts#index
          #                POST   /users/:user_id/posts(.:format)          posts#create
          #  new_user_post GET    /users/:user_id/posts/new(.:format)      posts#new
          # edit_user_post GET    /users/:user_id/posts/:id/edit(.:format) posts#edit
          #      user_post GET    /users/:user_id/posts/:id(.:format)      posts#show
          #                PATCH  /users/:user_id/posts/:id(.:format)      posts#update
          #                PUT    /users/:user_id/posts/:id(.:format)      posts#update
          #                DELETE /users/:user_id/posts/:id(.:format)      posts#destroy
