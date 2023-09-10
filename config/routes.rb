Rails.application.routes.draw do
  # HTTPメソッド 'URL' => 'コントローラ#アクション'
  
  get "/top" => "homes#top"
  
  resources :lists
  
  end
