defmodule Deno.Nif do
  use Rustler, otp_app: :nif, crate: "deno_nif"

  # When your NIF is loaded, it will override this function.
  def run(_code), do: :erlang.nif_error(:nif_not_loaded)
end
