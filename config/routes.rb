Rails.application.routes.draw do
  # HTTPメソッド 'URL' => 'コントローラ#アクション'
  get 'lists/new' #get:データを取得するためのHTTPメソッド
    post "lists" => "lists#create" #post:データを新規保存するためのHTTPメソッド
    
  get "lists" => "lists#index"
  
  get "lists/:id" => 'lists#show', as: "list"
  # 「:id」はアクション内に「params[:id]」と記述することで、ユーザーからリクエストとしてURLに入れられた数字が[:id]に代入されて取り出しが可能となる仕組み
  # asオプションを追加して名前付きルート化(asは英語で「～として」)
  
  get 'lists/edit'
  get "/top" => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
