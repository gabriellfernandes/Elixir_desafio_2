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

      assert response == expected_response
    end
  end

  describe "build_many/1" do
    test "build the report whith Task" do
      file_names = ["report_test.csv", "report_test.csv"]

      response =
        file_names
        |> ReportsGenerator.build_many()

      expected_response =
        {:ok,
         %{
           "foods" => %{
             "açaí" => 2,
             "churrasco" => 4,
             "esfirra" => 6,
             "hambúrguer" => 4,
             "pizza" => 4
           },
           "users" => %{
             "1" => 96,
             "10" => 72,
             "2" => 90,
             "3" => 62,
             "4" => 84,
             "5" => 98,
             "6" => 36,
             "7" => 54,
             "8" => 50,
             "9" => 48
           }
         }}

      assert response == expected_response
    end

    test "invalid type list" do
      file_names = "banana"

      response =
        file_names
        |> ReportsGenerator.build_many()

      expected_response = {:error, "please send a list of strings"}

      assert response == expected_response
    end
  end

  describe "fecth_higher_cost/2" do
    test "test option users" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("users")

      expected_response = {:ok, {"5", 49}}

      assert response == expected_response
    end

    test "test option foods" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("foods")

      expected_response = {:ok, {"esfirra", 3}}

      assert response == expected_response
    end

    test "test invalid option" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("test")

      expected_response = {:error, "Invalid option!"}

      assert response == expected_response
    end
  end
end
