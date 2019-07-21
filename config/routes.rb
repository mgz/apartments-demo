Rails.application.routes.draw do
  root 'feed#index'
  get 'feed' => 'feed#index'
end
