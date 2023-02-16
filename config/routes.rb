CspDashboard::Engine.routes.draw do
  resources :violation_reports
  delete :violation_reports, to: 'violation_reports#destroy_all'

  root to: 'violation_reports#index'
end
