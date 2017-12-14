Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# 新增一個check的路徑，來供check的方法使用
# member是用來產生路徑的方法，這是block的寫法，有另外的寫法
#使用put方法使用來更新用
  resources :tasks do
      member do
          post :check
      end
  end
  root "tasks#index"
end
