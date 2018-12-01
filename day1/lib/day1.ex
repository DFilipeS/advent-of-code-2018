defmodule Day1 do
  @doc """
  Calculates the final frequency after all changes are applied.
  """
  def calculate_frequency(input) do
    input
    |> String.split("\n")
    |> Enum.reduce(0, fn e, acc -> String.to_integer(e) + acc end)
  end

  @doc """
  Find the first repeated frequency result looping through the input list.
  """
  def first_repeated_frequency(input) do
    input
    |> String.split("\n")
    |> Enum.map(&String.to_integer/1)
    |> find_repeated_frequency(MapSet.new([0]), 0, 0)
  end

  defp find_repeated_frequency(input_list, frequency_set, current_frequency, index) do
    current_frequency = current_frequency + Enum.at(input_list, index)

    case MapSet.member?(frequency_set, current_frequency) do
      false ->
        frequency_set = MapSet.put(frequency_set, current_frequency)
        index = rem(index + 1, length(input_list))
        find_repeated_frequency(input_list, frequency_set, current_frequency, index)

      true ->
        current_frequency
    end
  end
end
