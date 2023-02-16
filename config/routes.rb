CspDashboard::Engine.routes.draw do
  resources :violation_reports
  delete :violation_reports, to: 'violation_reports#destroy_all'

  resources :charts, only: [] do
    collection do
      get :violation_reports_in_last_month
    end
  end

  root to: 'violation_reports#index'
end
