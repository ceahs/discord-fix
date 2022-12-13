Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'polls/results' => 'polls#results'
  
  get 'polls/results' => 'polls#results'
  resources :polls, :only => [:index] do
    collection do
      post :create
      get :submit1
      get :submit2
      get :submit3
      get :submit4
    end
  end
  get 'polls/:id' => 'polls#show'
  
  scope '/api' do 
    post '/message', to: 'users#message'
    get '/btc', to: 'bot_methods#crypto'
    scope '/auth' do 
      post '/authenticate', to: 'users#create'
    end
    
  end 
end
