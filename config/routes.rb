# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  devise_for :users
  #ユーザー用ルーティング
  resource :users, only: [:show, :update]
  # 退会確認ページ用
  get '/users/withdraw' => 'users#withdraw'

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  # アバウトページ用
  get '/homes/about' => 'homes#about'
  get '/homes/top' => 'homes#top'
  # トップページ用
  root to: 'homes#top'
  # 商品用ルーティング
  resources :items, only: [:index, :show]
  # 注文用ルーティング
  resources :orders, only: [:new, :create, :index, :show]
  # 購入確認ページ用
  get '/orders/confirm' => 'orders#confirm'
  # 購入完了ページ用
  get '/orders/thanks' => 'orders#thanks'
end
