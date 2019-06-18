class Credentials
  include Hanami::Validations::Form

  EMAIL_FORMAT = /@/.freeze

  validations do
    required(:email)    { filled? & str? & format?(EMAIL_FORMAT) }
    required(:password) { filled? & str? }
  end
end