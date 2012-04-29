Face::Application.routes.draw do
  resources :members

  root to: 'members#index'
  match 'faces' => 'import#faces'
  match 'connections' => 'import#connections'
  match 'posts' => 'import#posts'
  match 'drop' => 'members#drop'
  
end
