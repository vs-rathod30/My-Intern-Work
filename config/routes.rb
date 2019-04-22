Rails.application.routes.draw do

  root 'welcome#index'

  get 'articles/download_pdf'
 
#  get 'articles/edit'
  resources :articles do
    resources :comments
  end
  

  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
