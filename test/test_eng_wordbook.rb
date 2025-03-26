# frozen_string_literal: true

require "test_helper"
# main test class
class TestEngWordbook < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::EngWordbook::VERSION
  end

  # it is for input testing
  class InputTester < Minitest::Test
    # посмотри регулярки и сделай
    # link =
    # title =
    def link_correct?
      assert assert_equal true, true
    end

    def title_correct?
      assert true
    end
  end
end
