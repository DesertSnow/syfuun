Syfuun::Application.routes.draw do
  root to: 'todos#index'

  resources :todos, only: [:index, :new, :create] do
    resource :finished, only: :create, controller: :todo_finished
    resource :prioritised, only: :create, controller: :todos_prioritised
    resource :assign, only: [:new, :create], controller: 'todos/assign'
  end
end
