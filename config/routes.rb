Rails.application.routes.draw do
  root "home#index"
  get "stage", to: "home#stage"
end
