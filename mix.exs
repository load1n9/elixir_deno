defmodule Deno.Nif.MixProject do
  use Mix.Project

  def project do
    [
      app: :nif,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Deno NIF",
      package: package(),
      description: description(),
      source_url: "https://github.com/load1n9/elixir_deno"
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "deno bindings in the beam vm."
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.25.0"},
      {:ex_doc, "~> 0.14", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package() do
    [
      # These are the default files included in the package
      files: ["lib", "native", "mix.exs", "README.md", "LICENSE"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/load1n9/elixir_deno"}
    ]
  end
end
