# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  #ユーザー用ルーティング
  resources :users, only: [:show, :update, :edit, :destroy]
  # 退会確認ページ用
  get '/users/withdraw' => 'users#withdraw'

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  # アバウト,トップページ用
  get '/homes/about' => 'homes#about'
  get '/homes/top' => 'homes#top'
  root to: 'homes#top'

  # 出品ページ用
  get '/items/exhibition' => 'items#exhibition'

  put '/items/finish/:id' => 'items#finish', as: 'item_finish'

  # 商品用ルーティング（コメント、お気に入り）
  put '/items/buy/:id' => 'items#buy', as: 'item_buy'

  put '/items/boost/:id' => 'items#boost', as: 'item_boost'

  resources :items, only: [:index, :show, :create, :edit, :destroy] do
    resource :item_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  # 注文用ルーティング
  resources :orders, only: [:new, :create, :index, :show]
  # 購入確認ページ用
  get '/orders/confirm' => 'orders#confirm'
end
