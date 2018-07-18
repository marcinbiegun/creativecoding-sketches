require 'minitest/autorun'
require_relative 'readme'

class TestUtils < MiniTest::Unit::TestCase
  def test_replace_extension
    assert_equal 'image.png', Utils.replace_extension('image.txt', 'png')
  end

  def test_replace_extension
    assert_equal 'image.png', Utils.replace_extension('image', 'png')
  end
end
