require "minitest/autorun"
require "minitest/pride"

class Queue
  attr_accessor :queue

  def initialize(queue)
    @queue = queue
  end

  def pop(num = nil)
    @queue.shift
  end
end

class TestRubeque < Minitest::Test
  def test_array_item_removal
    array = [:r, :u, :b, :e, :q, :u, :e]
    assert_equal [:b, :q], array & [:b, :q]
  end

  def test_fill_in_range
    assert_equal 4494, (1..100).to_a[11..94].reduce(:+)
  end

  def test_substracting_out_the_sugar
    assert_equal 2 + 2, 2.+(2) 
    assert_equal 42, 40.+(2)
  end

  def test_theres_no_way_this_works_v_2
    str = "Hello" "World"
    assert_equal str, "HelloWorld"
  end

  def test_or_equal
    b = 8
    c = false
    a ||= "rubeque"
    b ||= "rubeque"
    c ||= "rubeque"
    assert_equal "rubeque", a
    assert_equal 8, b
    assert_equal "rubeque", c
  end

  def test_brackets_and_searches
    assert_equal "e", "hello world"["e"]
    assert_equal nil, "what"["e"]
    assert_equal "e", "rubeque"["e"]
    assert_equal nil, "E"["e"]
  end

  def test_ternary_operator
    a = "Miles O'Brien"
    b = "Barack Obama"
    assert_equal "Irish", ((a =~ /[ ]\w'/) != nil ? "Irish" : "Not Irish")
    assert_equal "Not Irish", ((b =~ /[ ]\w'/) != nil ? "Irish" : "Not Irish")
  end
end
