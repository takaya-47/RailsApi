Rails.application.routes.draw do
  resources :todo_lists, only: [:index, :show, :create, :destroy, :update]
end
