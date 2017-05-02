Rails.application.routes.draw do

  root to: "pages#index"

  get "measures", to: "pages#measures"
  get "packages", to: "pages#packages"
  get "search", to: "code_lists#search"
  get "reports", to: "pages#reports"
  get "jobs", to: "pages#jobs"

  post "gather_codes", to: "code_lists#gather_codes"
  delete "remove_codes", to: "code_lists#remove_codes"

  resources :code_lists do
    collection do
      get :autocomplete
    end
  end
end
