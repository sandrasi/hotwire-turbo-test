Rails.application.routes.draw do
  resource :hash, only: %i[create new show]
end
