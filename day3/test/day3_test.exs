defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "number of overlapping claims (first part) of the example given is correct" do
    assert Day3.count_overlapping(File.read!("test/example_a.txt")) == 4
  end

  test "number of overlapping claims (first part) of the input given is correct" do
    assert Day3.count_overlapping(File.read!("test/input_a.txt")) == 116_140
  end

  test "number of overlapping claims (second part) of the example given is correct" do
    assert Day3.non_overlapping_claim(File.read!("test/example_a.txt")) == 3
  end

  test "number of overlapping claims (second part) of the input given is correct" do
    assert Day3.non_overlapping_claim(File.read!("test/input_a.txt")) == 574
  end
end
