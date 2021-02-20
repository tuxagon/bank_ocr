defmodule BankOcr.DigitMatcher do
  @n1 """

    |
    |
  """

  @n2 """
   _
   _|
  |_
  """

  @n3 """
   _
   _|
   _|
  """

  @n4 """

  |_|
    |
  """

  @n5 """
   _
  |_
   _|
  """

  @n6 """
   _
  |_
  |_|
  """

  @n7 """
   _
    |
    |
  """

  @n8 """
   _
  |_|
  |_|
  """

  @n9 """
   _
  |_|
   _|
  """

  @n0 """
   _
  | |
  |_|
  """

  alias BankOcr.RawDigit

  def plausible_match(%RawDigit{} = raw_digit) do
    cond do
      matches?(raw_digit, @n0) -> "0"
      matches?(raw_digit, @n1) -> "1"
      matches?(raw_digit, @n2) -> "2"
      matches?(raw_digit, @n3) -> "3"
      matches?(raw_digit, @n4) -> "4"
      matches?(raw_digit, @n5) -> "5"
      matches?(raw_digit, @n6) -> "6"
      matches?(raw_digit, @n7) -> "7"
      matches?(raw_digit, @n8) -> "8"
      matches?(raw_digit, @n9) -> "9"
      true -> "?"
    end
  end

  defp matches?(%RawDigit{top: top, middle: middle, bottom: bottom}, expected_digit) do
    case expected_digit
         |> String.split("\n")
         |> Enum.take(3)
         |> Enum.map(fn section -> String.pad_trailing(section, 3) end) do
      [^top, ^middle, ^bottom] -> true
      _ -> false
    end
  end
end
