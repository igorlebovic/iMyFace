Face::Application.routes.draw do
  resources :members

  root to: 'members#index'
  match 'import_data_small' => 'members#import_data_small'
  match 'import_data_large' => 'members#import_data_large'
  match 'import_data_large_cycles' => 'members#import_data_large_cycles'
  match 'inmyface' => 'members#inmyface'
  match 'outtamyface' => 'members#outtamyface'
  match 'facedup' => 'members#facedup'
  match 'remove' => 'members#remove'
end
