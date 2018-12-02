defmodule Day2 do
  @doc """
  Calculates the checksum for the given input.
  """
  def checksum(input) do
    checksum_parts =
      input
      |> String.split("\n")
      |> Enum.reduce(%{two: 0, three: 0}, fn word, acc ->
        counter =
          word
          |> String.graphemes()
          |> Enum.reduce(%{}, fn char, counter ->
            Map.update(counter, char, 1, &(&1 + 1))
          end)

        occurrences = Map.values(counter)

        acc
        |> Map.update!(:two, fn e ->
          case Enum.member?(occurrences, 2) do
            false -> e
            true -> e + 1
          end
        end)
        |> Map.update!(:three, fn e ->
          case Enum.member?(occurrences, 3) do
            false -> e
            true -> e + 1
          end
        end)
      end)

    Map.get(checksum_parts, :two) * Map.get(checksum_parts, :three)
  end

  def difference(input) do
    words_list = String.split(input, "\n")

    Enum.reduce(words_list, nil, fn word, target ->
      new_target =
        Enum.reduce(words_list, nil, fn e, acc ->
          m_difference = String.myers_difference(word, e)
          diff_chars = Keyword.get_values(m_difference, :del)
          match_chars = Keyword.get_values(m_difference, :eq)

          cond do
            length(diff_chars) == 1 and String.length(Enum.at(diff_chars, 0)) == 1 ->
              Enum.join(match_chars)

            true ->
              acc
          end
        end)

      case new_target do
        nil -> target
        _ -> new_target
      end
    end)
  end
end
