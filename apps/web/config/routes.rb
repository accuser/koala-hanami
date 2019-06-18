root to: 'pages#home'

resource :session, only: [:new, :create, :destroy]
resource :profile
