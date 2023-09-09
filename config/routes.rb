Rails.application.routes.draw do
  # HTTPメソッド 'URL' => 'コントローラ#アクション'
  get 'lists/new' #データを取得するためのHTTPメソッド
    post "lists" => "lists#create" #データを新規保存するためのHTTPメソッド
    
  get 'lists/index'
  get 'lists/show'
  get 'lists/edit'
  get "/top" => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
