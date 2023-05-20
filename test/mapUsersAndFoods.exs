defmodule ReportsGenerator.MapUsersAndFoodsTest do
  use ExUnit.Case
  alias ReportsGenerator.MapUsersAndFoods
  alias ReportsGenerator.Parser

  describe "report_acc/1" do
    test "report the file" do
      file_name = "report_test.csv"

      response =
        file_name
        |> Parser.parse_file()
        |> MapUsersAndFoods.report_acc()

      expected_response = %{
        "foods" => %{
          "açaí" => 0,
          "churrasco" => 0,
          "esfirra" => 0,
          "hambúrguer" => 0,
          "pizza" => 0
        },
        "users" => %{
          "1" => 0,
          "10" => 0,
          "2" => 0,
          "3" => 0,
          "4" => 0,
          "5" => 0,
          "6" => 0,
          "7" => 0,
          "8" => 0,
          "9" => 0
        }
      }

      assert expected_response == response
    end
  end
end
