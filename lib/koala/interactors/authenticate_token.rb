require 'hanami/interactor'

class AuthenticateToken
  include Hanami::Interactor

  expose :user

  def call(params)
    token = params.fetch(:token)

    authenticate_token(token)
  end

  private

  def authenticate_token(token)
    user = user_repository.user_with_token(token)

    if user.nil?
      error token: ['not found']
    else
      @user = user
    end
  end

  private # impl

  attr_reader :user_repository

  def initialize(user_repository: UserRepository.new)
    @user_repository = user_repository
  end

  def valid?(params)
    result = TokenValidation.new(params).validate

    if result.failure?
      error result.errors
    end

    result.success?
  end
end
