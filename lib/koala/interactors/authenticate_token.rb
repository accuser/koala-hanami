require 'hanami/interactor'

class AuthenticateToken
  include Hanami::Interactor

  attr_reader :user_repository

  def initialize(user_repository: UserRepository.new)
    @user_repository = user_repository
  end

  expose :user

  def call(params)
    token = params.fetch(:token)

    user = user_repository.user_with_token(token)

    if user.nil?
      error token: ['not found']
    else
      @user = user
    end
  end

  def valid?(params)
    result = TokenValidation.new(params).validate

    if result.failure?
      error result.errors
    end

    result.success?
  end
end
