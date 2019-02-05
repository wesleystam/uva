Rails.application.routes.draw do
  resources :pia_questionnaires
  root to: 'pia_questionnaires#index'
end
