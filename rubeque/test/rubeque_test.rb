require "minitest/autorun"
require "minitest/pride"

class TestRubeque < Minitest::Test
  def test_array_item_removal
    array = [:r, :u, :b, :e, :q, :u, :e]
    assert_equal [:b, :q], array & [:b, :q]
  end

  def test_fill_in_range
    assert_equal 4494, (1..100).to_a[11..94].reduce(:+)
  end

  def test_substracting_out_the_sugar
    assert_equal 2 + 2, 2.add(2)
  end
end
