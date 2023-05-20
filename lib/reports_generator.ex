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

  def build_many(file_names) when not is_list(file_names) do
    {:error, "please send a list of strings"}
  end

  def build_many(fileNames) do
    result =
      fileNames
      |> Task.async_stream(&build/1)
      |> Enum.reduce(report_map(%{}, %{}), fn {:ok, result}, report ->
        sum_reports(result, report)
      end)

    {:ok, result}
  end

  def fecth_higher_cost(report, option) when option in @options do
    {:ok, Enum.max_by(report[option], fn {_key, value} -> value end)}
  end

  def fecth_higher_cost(_report, _option), do: {:error, "Invalid option!"}

  defp sum_reports(%{"users" => users1, "foods" => foods1}, %{
         "users" => users2,
         "foods" => foods2
       }) do
    users = marge_maps(users1, users2)
    foods = marge_maps(foods1, foods2)

    report_map(users, foods)
  end

  defp marge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp sum_values([id, food_name, price], %{"users" => users, "foods" => foods}) do
    users = Map.put(users, id, users[id] + price)
    foods = Map.put(foods, food_name, foods[food_name] + 1)

    report_map(users, foods)
  end

  defp report_map(users, foods), do: %{"users" => users, "foods" => foods}
end
