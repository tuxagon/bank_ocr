defmodule BankOcr.DigitMatcherTest do
  use ExUnit.Case
  doctest BankOcr.DigitMatcher

  alias BankOcr.DigitMatcher
  alias BankOcr.RawDigit

  test "does not match any number" do
    zero = %RawDigit{top: "   ", middle: "| |", bottom: "|_ "}

    assert DigitMatcher.plausible_match(zero) == "?"
  end

  test "matches 0" do
    zero = %RawDigit{top: " _ ", middle: "| |", bottom: "|_|"}

    assert DigitMatcher.plausible_match(zero) == "0"
  end

  test "matches 1" do
    zero = %RawDigit{top: "   ", middle: "  |", bottom: "  |"}

    assert DigitMatcher.plausible_match(zero) == "1"
  end

  test "matches 2" do
    zero = %RawDigit{top: " _ ", middle: " _|", bottom: "|_ "}

    assert DigitMatcher.plausible_match(zero) == "2"
  end

  test "matches 3" do
    zero = %RawDigit{top: " _ ", middle: " _|", bottom: " _|"}

    assert DigitMatcher.plausible_match(zero) == "3"
  end

  test "matches 4" do
    zero = %RawDigit{top: "   ", middle: "|_|", bottom: "  |"}

    assert DigitMatcher.plausible_match(zero) == "4"
  end

  test "matches 5" do
    zero = %RawDigit{top: " _ ", middle: "|_ ", bottom: " _|"}

    assert DigitMatcher.plausible_match(zero) == "5"
  end

  test "matches 6" do
    zero = %RawDigit{top: " _ ", middle: "|_ ", bottom: "|_|"}

    assert DigitMatcher.plausible_match(zero) == "6"
  end

  test "matches 7" do
    zero = %RawDigit{top: " _ ", middle: "  |", bottom: "  |"}

    assert DigitMatcher.plausible_match(zero) == "7"
  end

  test "matches 8" do
    zero = %RawDigit{top: " _ ", middle: "|_|", bottom: "|_|"}

    assert DigitMatcher.plausible_match(zero) == "8"
  end

  test "matches 9" do
    zero = %RawDigit{top: " _ ", middle: "|_|", bottom: " _|"}

    assert DigitMatcher.plausible_match(zero) == "9"
  end
end
