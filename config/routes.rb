Rails.application.routes.draw do

  root to: "pages#index"

  get "measures", to: "pages#measures"
  get "packages", to: "pages#packages"
  get "code_list", to: "pages#code_list"
  get "reports", to: "pages#reports"
  get "jobs", to: "pages#jobs"
end
