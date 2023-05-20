defmodule ReportsGeneratorTest do
  use ExUnit.Case

  @file_name "report_test.csv"

  describe "build/1" do
    test "Vericando se build retonou o relatorio buildado" do
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
    test "Testando o usuario que mais gastou" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("users")

      expected_response = {:ok, {"5", 49}}

      assert expected_response == response
    end

    test "Testando a comida mais pedida" do
      response =
        @file_name
        |> ReportsGenerator.build()
        |> ReportsGenerator.fecth_higher_cost("foods")

      expected_response = {:ok, {"esfirra", 3}}

      assert expected_response == response
    end
  end
end
