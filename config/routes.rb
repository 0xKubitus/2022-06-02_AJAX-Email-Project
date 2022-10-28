Rails.application.routes.draw do
   
  root to: "emails#index"

  resources :emails
  get '/email/:id/unread_toggle', to: 'emails#email_unread_toggle', as: "email_unread_toggle"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
