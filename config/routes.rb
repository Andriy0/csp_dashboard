CspDashboard::Engine.routes.draw do
  resources :violation_reports

  root to: 'violation_reports#index'
end
