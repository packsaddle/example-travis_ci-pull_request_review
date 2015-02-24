require_relative 'helper'

module Example
  module TravisCi
    class TestExample  < Test::Unit::TestCase
      test 'version' do
        assert do
          !::Example::TravisCi::VERSION.nil?
        end
      end
    end
  end
end
