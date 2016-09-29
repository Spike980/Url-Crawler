Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'indexurl' => 'index_contents#index'
  get 'retrieveurl' => 'index_contents#fetch'
end
