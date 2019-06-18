module Authenticated
  def self.included(action)
    action.class_eval do
      expose :anonymous?
      expose :authenticated?
      expose :current_user

      before :authenticate!
    end
  end

  # +true+ if the current user is anonymous
  def anonymous?
    current_user.nil?
  end

  # Authenticate the current user
  def authenticate!
    self.current_user = AuthenticateToken.new.call(token: token).user unless token.nil?
  end

  # +true+ if the current user is authenticated
  def authenticated?
    !anonymous?
  end

  # Get the current user
  def current_user
    @current_user
  end

  # Set the current user
  def current_user=(user)
    self.token, @current_user = [user&.token, user]
  end

  def forbidden!
    halt 403
  end

  def unauthorised!
    halt 401
  end

  private # impl

  TOKEN = 'auth'.freeze
  
  # @api private
  # Get the authentication token from the session cookie store
  def token
    session[TOKEN]
  end

  # @api private
  # Set the authentication token
  def token=(token)
    session[TOKEN], @current_user = [token, nil]
  end
end
