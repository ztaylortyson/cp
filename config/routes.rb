Rails.application.routes.draw do
  get 'trials/index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  get 'home/index'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root "home#index"
end
