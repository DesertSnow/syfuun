Syfuun::Application.routes.draw do
  root to: 'todos#index'

  resources :todos, only: [:index, :new, :create] do
    member do
      resource :finished, only: [], controller: :todo_finished, as: :todo do
        collection do
          post :create, as: :finished#for discussion: how to define/name these kind of routes?
        end
      end
    end
    resource :prioritised, only: :create, controller: :todos_prioritised
  end
end
