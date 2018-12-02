defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "calculating the checksum of the example for the first part of the puzzle gives the correct value" do
    assert Day2.checksum(File.read!("test/example1.txt")) == 12
  end

  test "calculating the checksum for the first part puzzle input gives the correct value" do
    assert Day2.checksum(File.read!("test/input_a.txt")) == 8892
  end

  test "calculating the difference between ids of the example for the second part of the puzzle gives the correct value" do
    assert Day2.difference(File.read!("test/example2.txt")) == "fgij"
  end

  test "calculating the difference for the second part puzzle input gives the correct value" do
    assert Day2.difference(File.read!("test/input_a.txt")) == "zihwtxagifpbsnwleydukjmqv"
  end
end
