Notebook::Application.routes.draw do

  root "notes#index"

  get '/notes', controller: 'notes', action: 'index', as: 'notes'

  post '/notes', controller: 'notes', action: 'create'

  get '/notes/:id/edit', controller: 'notes', action: 'edit', as: 'edit_note'
  patch '/notes/:id', controller: 'notes', action: 'update'

  delete '/notes/:id', controller: 'notes', action: 'destroy', as: 'note'

end
