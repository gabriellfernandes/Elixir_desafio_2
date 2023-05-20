defmodule ReportsGenerator do
  alias ReportsGenerator.MapUsersAndFoods
  alias ReportsGenerator.Parser

  @options ["foods", "users"]

  def build(fileName) do
    file =
      fileName
      |> Parser.parse_file()

    file
    |> Enum.reduce(MapUsersAndFoods.report_acc(file), fn line, report ->
      sum_values(line, report)
    end)
  end

  def fecth_higher_cost(report, option) when option in @options,
    do: {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}

  def fecth_higher_cost(_report, _option), do: {:error, "Invalid option!"}

  defp sum_values([id, food_name, price], %{"users" => users, "foods" => foods} = report) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    %{report | "users" => users, "foods" => foods}
  end
end
