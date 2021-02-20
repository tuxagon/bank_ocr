defmodule BankOcr do
  alias BankOcr.DigitParser
  alias BankOcr.AccountResolver

  def run(raw_account_numbers) do
    raw_account_numbers
    |> Enum.map(fn raw_account_digits ->
      {:ok, pid} = AccountResolver.start_link([])

      resolved_digits =
        raw_account_digits
        |> DigitParser.parse()
        |> Enum.map(fn raw_digit -> AccountResolver.find_match(pid, raw_digit) end)

      _verified = AccountResolver.verify_checksum(pid, resolved_digits)

      resolved_digits
      |> Enum.join()
      |> IO.puts()
    end)
  end
end
