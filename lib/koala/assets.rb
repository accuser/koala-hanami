require 'hanami/assets'

module Koala
  module Assets
  end
end

Hanami::Assets.sources << __dir__ + '/assets'