class Token
  include Hanami::Validations::Form

  TOKEN_FORMAT =   /\A[\da-f]{8}\-[\da-f]{4}\-[\da-f]{4}\-[\da-f]{4}\-[\da-f]{12}\Z/i.freeze

  validations do
    required(:token) { filled? & str? & format?(TOKEN_FORMAT) }
  end
end