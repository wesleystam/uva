Rails.application.routes.draw do
  resources :pia_questionnaires do
    resources :pia_answers
  end
  root to: 'pia_questionnaires#index'
end
