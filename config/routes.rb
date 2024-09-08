Rails.application.routes.draw do
  root "home#index"
  get "stage", to: "home#stage"
  post "answers", to: "home#answer"
  get "result", to: "home#result"
end
