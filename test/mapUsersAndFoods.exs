defmodule ReportsGenerator.MapUsersAndFoodsTest do
  use ExUnit.Case
  alias ReportsGenerator.MapUsersAndFoods
  alias ReportsGenerator.Parser

  describe "report_acc/1" do
    test "init report map" do
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

      assert response == expected_response
    end
  end
end

    gcl="git clone"
    ga="git add ." #adds all files to repo
    gc="git commit -m" #commmits files to stage area
    gac="git add . && git commit -m"
    gp="git push" #pushes files to repo
    gpo="git push origin " #pushes files to repo
    gs="git status" #gives status repport
    gch="git checkout" #moves between existing branches
    gchb="git checkout -b" #creates new branch
    gb="git branch" #shows list of all branches
    gbd="git branch -d" #deletes bramches from::ocal repo
    gm="git merge" #merge branches
    gft="git push --follow-tags origin main"

# vercel

    vb="vercel --build-env CI=false" #create vercel app
    vp="vercel --prod"
font-size: ${props => console.log(props.fontS) !== undefined  ? props.fontS : "2rem"}  ;

# yarn

    ys="yarn start"
    yc="yarn create react-app ./"
    yard="yarn add react-router-dom"
    yasc="yarn add styled-components"
    yaa="yarn add axios"
    yart="yarn add react-toastify"
    yahf="yarn add react-hook-form"
    yay="yarn add yup"
    yahr="yarn add @hookform/resolvers"
    yasv="yarn add standard-version"
    yarpsb="yarn add react-password-strength-bar"
    yafm="yarn add framer-motion"
    yar="yarn add react-redux redux redux-thunk @reduxjs/toolkit"
    yasv="yarn add standard-version"
    ysv="yarn standard-version"
    ysvr="yarn standard-version -- --release-as"
    yari="yarn add react-icons"
    yajs="yarn add json-server"
    yajsa="yarn add json-server-auth"
