defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "example inputs for the first problem give the correct results" do
    assert Day1.calculate_frequency("+1\n+1\n+1") == 3
    assert Day1.calculate_frequency("+1\n+1\n-2") == 0
    assert Day1.calculate_frequency("-1\n-2\n-3") == -6
  end

  test "given the first problem puzzle input has the correct result" do
    assert Day1.calculate_frequency(File.read!("test/input_a.txt")) == 486
  end

  test "example inputs for the second problem give the correct results" do
    assert Day1.first_repeated_frequency("+1\n-1") == 0
    assert Day1.first_repeated_frequency("+3\n+3\n+4\n-2\n-4") == 10
    assert Day1.first_repeated_frequency("-6\n+3\n+8\n+5\n-6") == 5
    assert Day1.first_repeated_frequency("+7\n+7\n-2\n-7\n-4") == 14
  end

  test "given the second problem puzzle input has the correct result" do
    assert Day1.first_repeated_frequency(File.read!("test/input_a.txt")) == 69285
  end
end
