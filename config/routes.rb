Rails.application.routes.draw do
  post '/bank_accounts', to: 'bank_accounts#create'

  namespace :bank_accounts do
    get '/:account_number/report', to: 'report#index'
    post '/:account_number/transactions', to: 'transactions#create'
  end
end
