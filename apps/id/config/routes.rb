get '/new', to: 'session#new', as: 'new_session'
post '/', to: 'session#create', as: 'session'
delete '/', to: 'session#destroy'
get '/', to: 'session#destroy' # moral compromise ;-)
