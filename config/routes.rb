Rails.application.routes.draw do
  root 'photo#show'

  post :g, to: 'photo#gauss'
  post :m, to: 'photo#median'
  post :r, to: 'photo#roberts'
  # post :process, to: 'photo#upload'
end
