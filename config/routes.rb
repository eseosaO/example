 Rails.application.routes.draw do

   root 'main#index'
   get 'main/index'



   match 'about', to: "main#about", via: :get #route about page to main page
   match 'a  pps', to: "main#apps", via: :get


   #Using Resourceful routes
   resources :categories do
     member do
       get :delete
     end
   end

   resources :tasks do
     member do
       get :delete
     end
   end

   # or alternatively use commented code below:

   # get 'categories/index'
   # get 'categories/show'
   # get 'categories/new'
   # get 'categories/edit'
   # get 'categories/delete'

   # get 'tasks/index'
  # get 'tasks/new'
  # get 'tasks/edit'
  #  get 'tasks/show'
  #  get 'tasks/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
