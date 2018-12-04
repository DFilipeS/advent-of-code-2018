defmodule Day3 do
  @doc """
  Creates matrix of claims and count how many places overlap.
  """
  def count_overlapping(input) do
    input
    |> create_matrix()
    |> Map.values()
    |> Enum.filter(&(&1 > 1))
    |> length()
  end

  @doc """
  Find the non overlapping claim in the input given.
  """
  def non_overlapping_claim(input) do
    regex = ~r/#(?<id>[0-9]*) @ (?<x>[0-9]*),(?<y>[0-9]*): (?<width>[0-9]*)x(?<height>[0-9]*)/

    matrix = create_matrix(input)

    input
    |> String.split("\n")
    |> Enum.reduce(nil, fn claim, tainted_claim ->
      %{"id" => id, "height" => height, "width" => width, "x" => x, "y" => y} =
        Regex.named_captures(regex, claim)

      id = String.to_integer(id)
      x = String.to_integer(x)
      y = String.to_integer(y)
      width = String.to_integer(width)
      height = String.to_integer(height)

      positions = for a <- x..(x + width - 1), b <- y..(y + height - 1), do: {a, b}

      is_tainted =
        Enum.reduce(positions, true, fn position, acc ->
          cond do
            Map.get(matrix, position) != 1 -> false
            true -> acc
          end
        end)

      cond do
        is_tainted -> id
        true -> tainted_claim
      end
    end)
  end

  defp create_matrix(input) do
    regex = ~r/#(?<id>[0-9]*) @ (?<x>[0-9]*),(?<y>[0-9]*): (?<width>[0-9]*)x(?<height>[0-9]*)/

    input
    |> String.split("\n")
    |> Enum.reduce(%{}, fn claim, matrix ->
      %{"height" => height, "width" => width, "x" => x, "y" => y} =
        Regex.named_captures(regex, claim)

      x = String.to_integer(x)
      y = String.to_integer(y)
      width = String.to_integer(width)
      height = String.to_integer(height)

      positions = for a <- x..(x + width - 1), b <- y..(y + height - 1), do: {a, b}

      Enum.reduce(positions, matrix, fn position, acc ->
        Map.update(acc, position, 1, &(&1 + 1))
      end)
    end)
  end
end
