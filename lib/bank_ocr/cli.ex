defmodule BankOcr.CLI do
  def main(args \\ []) do
    args
    |> parse_file_name()
    |> read_file()
    |> BankOcr.run()
  end

  defp parse_file_name(args) do
    {[source_path: file_name], _, _} = args |> OptionParser.parse(strict: [source_path: :string])

    file_name
  end

  defp read_file(file_name) do
    case File.read(file_name) do
      {:ok, binary} ->
        binary
        |> String.split("\n")
        |> Enum.chunk_every(4)
        |> Enum.map(fn line -> line |> Enum.join("\n") end)

      {:error, reason} ->
        IO.puts(reason)

        []
    end
  end
end
