Rails.application.routes.draw do
  root 'tasks#index'
  get '/tasks' => 'tasks#index'

  get '/tasks/:id', to: 'tasks#show', as: 'task'

  get '/tasks/new' => 'tasks#new'
  post '/tasks' => 'tasks#create'

  get '/tasks/:id/edit', to: 'tasks#edit', as: 'task_edit'
  patch '/tasks/:id' => 'tasks#update'

  get '/tasks/:id/delete', to: 'tasks#delete', as: 'task_delete' #this is the prefix for path
  delete '/tasks/:id' => 'tasks#destroy'

  put '/tasks/:id', to: 'tasks#completed', as: 'task_completed'
end
