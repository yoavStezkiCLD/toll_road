Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :accounts
      resources :events
      resources :tokens
      controller :reports do
        get 'reports/monthly_report', action: :monthly_report
      end
      controller :transactions do
        post 'transactions/charge', action: :charge
      end
    end
  end
end
