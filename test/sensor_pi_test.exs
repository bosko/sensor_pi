defmodule SensorPiTest do
  use ExUnit.Case
  doctest SensorPi

  test "greets the world" do
    assert SensorPi.hello() == :world
  end
end
