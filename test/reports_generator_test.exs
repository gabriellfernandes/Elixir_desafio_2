defmodule ReportsGeneratorTest do
  use ExUnit.Case

  @file_name "report_test.csv"

  describe "build/1" do
    test "build the report" do
      response =
        @file_name
        |> ReportsGenerator.build()

      expected_response = %{
        "foods" => %{
          "açaí" => 1,
          "churrasco" => 2,
          "esfirra" => 3,
          "hambúrguer" => 2,
          "pizza" => 2
        },
        "users" => %{
          "1" => 48,
          "10" => 36,
          "2" => 45,
          "3" => 31,
          "4" => 42,
          "5" => 49,
          "6" => 18,
          "7" => 27,
          "8" => 25,
          "9" => 24
        }
      }

      assert expected_response == response
    end
  end

  describe "fecth_higher_cost/2" do
    test "test option users" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("users")

      expected_response = {:ok, {"5", 49}}

      assert expected_response == response
    end

    test "test opiton foods" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("foods")

      expected_response = {:ok, {"esfirra", 3}}

      assert expected_response == response
    end

    test "test invalid opition" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("test")

      expected_response = {:error, "Invalid option!"}

      assert expected_response == response
    end
  end
end
