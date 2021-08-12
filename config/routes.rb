Rails.application.routes.draw do

    devise_for :admins, controllers: {
      sessions:      'admin/admins/sessions',
      passwords:     'admin/admins/passwords',
      registrations: 'admin/admins/registrations'
    }

    devise_for :users, controllers: {
      sessions:      'public/users/sessions',
      passwords:     'public/users/passwords',
      registrations: 'public/users/registrations'
    }

  namespace :admin do

    get "/", to: "homes#top", as: :root

    resources "posts", only: [:show]

    resources "comments", only: [:show]

    resources "users", only: [:index, :show] do
      member do
        get "block"
        get "follow"
        patch "delete"
        patch "undo"
      end
    end

  end

  scope module: :public do

    root "homes#top", as: :top

    get "/about", to: "homes#about", as: :about

    get "/posts", to: "posts#index", as: :user_root
    resources "posts", only: [:show, :create, :update] do
      member do
        patch "delete"
      end
      resources "comments", only: [:show, :create, :update] do
        member do
          patch "delete"
        end
      end
      resource "post_favorites", only: [:create, :destroy]
      resource "post_reports", only: [:create, :destroy]
    end

    resources "comments", only: [] do
      resources "replies", only: [:create, :update] do
        member do
          patch "delete"
        end
      end
      resource "comment_favorites", only: [:create, :destroy]
      resource "comment_reports", only: [:create, :destroy]
    end

    resources "replies", only: [] do
      resource "reply_favorites", only: [:create, :destroy]
      resource "reply_reports", only: [:create, :destroy]
    end

    resources "users", only: [:show, :update] do
      collection do
        get "block"
        get "follow"
        get "my_page"
        get "ranking"
      end
      resource "follow_relationships", only: [:create, :destroy]
      resource "block_relationships", only: [:create, :destroy]
    end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
