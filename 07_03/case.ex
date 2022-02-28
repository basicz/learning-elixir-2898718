defmodule Flow.Case do
  @moduledoc """
  This module contains functions for learning about control flow in Elixir with
  the Case structures.
  """

  @doc """
  Control Flow with Case expression
  """
  def flow() do
    element = "CARBON"

    case element do
      "CARBON" ->
        IO.puts "case structure tells us #{element} is an upcase carbon string"
      "carbon" ->
        IO.puts "case structure tells us #{element} is an plain 'ol carbon string"
      _ ->
        IO.puts "case structure default caught #{element}"
    end

    element = :carbon

    case :carbon do
      ^element ->
        IO.puts "case structure tells us #{element} is a carbon atom"
      _ ->
        IO.puts "case structure default tells us #{element} is an unrecognized element form"
    end

    element = "carbon"

    case element do
      e when is_binary(e) ->
        IO.puts "case structure tells us #{element} is a binary"
      e ->
        IO.puts "case structure tells us #{e} is an unrecognized element form"
    end

    element = %{name: "Hydrogen", number: 1, weight: 1, group: 1}

    classified = case element do
      %{name: name} = e when name == "Hydrogen" ->
        Map.put(e, :classification, "other nonmetal")
      %{group: group} = e when group === 1 ->
        Map.put(e, :classification, "alkali metal")
      %{group: group} = e when group === 9 ->
        Map.put(e, :classification, "transition metal")
      %{group: group} = e when group === 14 ->
        Map.put(e, :classification, "other nonmetal")
      e ->
        Map.put(e, :classification, "To be determined")
    end

    IO.inspect(classified, label: "The classifier case statment returned}")

    element = %{name: "Iridium", number: 77, weight: 192, group: 9}

    classification = case element do
      %{name: "Hydrogen"} -> "other nonmetal"
      %{group: 1} -> "alkali metal"
      %{group: 9} -> "transition metal"
      %{group: 14} -> "other nonmetal"
      _ -> "To be determined"
    end

    IO.inspect(Map.put(element, :classification, classification), label: "The next classifier returned")

    {:ok, "Control with control flow structures!"}
  end
end