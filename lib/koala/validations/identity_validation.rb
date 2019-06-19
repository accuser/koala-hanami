class IdentityValidation
  include Hanami::Validations::Form

  UUID_FORMAT = /\A[\da-f]{8}\-[\da-f]{4}\-[\da-f]{4}\-[\da-f]{4}\-[\da-f]{12}\Z/i.freeze

  validations do
    required(:id) { filled? & int? } #str? & format?(UUID_FORMAT) }
  end
end
