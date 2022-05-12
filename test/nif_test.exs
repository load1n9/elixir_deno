defmodule Deno.NifTest do
  use ExUnit.Case
  doctest Deno.Nif

  test "greets the world" do
    IO.puts(Deno.Nif.run("'hello world!'"))
  end
end
