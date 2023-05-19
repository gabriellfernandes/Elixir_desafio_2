defmodule ReportsGenerator.MapUsersAndFoods do
  alias ReportsGenerator.Parser

  def report_acc(file) do
    file
    |> Enum.reduce(%{"users" => %{}, "foods" => %{}}, fn line, report ->
      create_report_acc(line, report)
    end)
  end

  defp create_report_acc_users([id, _food_name, _price], report), do: Map.put(report, id, 0)

  defp create_report_acc_foods([_id, food_name, _price], report),
    do: Map.put(report, food_name, 0)

  defp create_report_acc(line, report) do
    report_users = create_report_acc_users(line, report["users"])
    report_foods = create_report_acc_foods(line, report["foods"])

    %{"users" => report_users, "foods" => report_foods}
  end
end
