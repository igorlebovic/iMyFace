Face::Application.routes.draw do
  resources :members

  root to: 'members#index'
  match 'import_data' => 'members#import_data'
  match 'inmyface' => 'members#inmyface'
  match 'outtamyface' => 'members#outtamyface'
  match 'facedup' => 'members#facedup'
end
