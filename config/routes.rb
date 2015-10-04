Rails.application.routes.draw do
  root 'photo#show'

  post :process, to: 'photo#upload'
end
