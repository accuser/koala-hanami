require 'hanami/interactor'

class AuthenticateCredentials
  include Hanami::Interactor

  attr_reader :user_repository

  def initialize(deps = {})
    @user_repository = deps[:user_repository] || UserRepository.new
  end

  expose :user

  def call(params)
    email = params.fetch(:email)
    password = params.fetch(:password)

    user = user_repository.user_with_email(email)

    if user.nil?
      error :email => ['not found']
    elsif user.password == password
      @user = user
    else
      error :password => ['incorrect']
    end
  end

  def valid?(params)
    result = CredentialsValidation.new(params).validate

    if result.failure?
      error result.errors
    end

    result.success?
  end
end
