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
    get "/", to: "homes#top", as: "top"
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
    root "homes#top", as: "top"
    get "/about", to: "homes#about", as: "about"
    resources "posts", only: [:index, :show, :create, :update] do
      member do
        patch "delete"
      end
      resources "comments", only: [:show, :create, :update] do
        member do
          patch "delete"
        end
      end
      resources "post_favorites", only: [:create, :destroy]
      resources "post_reports", only: [:create, :destroy]
    end
    resources "comments", only: [] do
      resources "replies", only: [:create, :update] do
        member do
          patch "delete"
        end
      end
      resources "comment_favorites", only: [:create, :destroy]
      resources "comment_reports", only: [:create, :destroy]
    end
    resources "replies", only: [] do
      resources "reply_favorites", only: [:create, :destroy]
      resources "reply_reports", only: [:create, :destroy]
    end
    resources "users", only: [:show, :update] do
      collection do
        get "block"
        get "follow"
        get "my_page"
        get "ranking"
      end
      resources "follow_relationships", only: [:create, :destroy]
      resources "block_relationships", only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
