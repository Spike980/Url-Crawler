Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'indexurl' => 'index_contents#index', defaults: { format: 'json' } 	#using get request instead of post as currently not handling 'cors' from rails api
  get 'retrieveurl' => 'index_contents#fetch', defaults: { format: 'json' }
end
