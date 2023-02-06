Rails.application.routes.draw do
  resources :ncfs
  get "/ncfs_add", to: "ncfs#index"

  resources :trials
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "home#index"
end
