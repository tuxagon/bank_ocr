defmodule BankOcr.DigitParser do
  alias BankOcr.RawDigit

  def parse(raw_account_number) do
    raw_account_number
    |> String.split("\n")
    |> Enum.take(3)
    |> Enum.map(fn raw_number ->
      raw_number
      |> String.codepoints()
      |> Enum.chunk_every(3)
      |> Enum.map(fn section -> section |> Enum.join() end)
    end)
    |> Enum.zip()
    |> Enum.map(fn {top, middle, bottom} ->
      %RawDigit{top: top, middle: middle, bottom: bottom}
    end)
  end
end
