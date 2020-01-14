Rails.application.routes.draw do
  resources :posts
  root 'welcome#index'

  post "/upload_image" => "upload#upload_image", :as => :upload_image
  get "/upload_image" =>  "upload#index"
  get "/download_file/:name" => "upload#access_file", :as => :upload_access_file, :name => /.*/
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
