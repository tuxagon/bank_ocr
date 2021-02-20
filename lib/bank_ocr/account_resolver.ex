defmodule BankOcr.AccountResolver do
  use GenServer

  alias BankOcr.DigitMatcher
  alias BankOcr.RawDigit
  alias BankOcr.AccountNumber

  # Defining GenServer Client API

  def start_link(opts) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def find_match(server, %RawDigit{} = raw_digit) do
    GenServer.call(server, {:find_match, raw_digit})
  end

  def verify_checksum(server, digits) do
    GenServer.call(server, {:verify_checksum, digits})
  end

  ## Defining GenServer Callbacks

  @impl true
  def init(:ok) do
    {:ok, %{}}
  end

  @impl true
  def handle_call({:find_match, %RawDigit{} = raw_digit}, _from, state) do
    {:reply, DigitMatcher.plausible_match(raw_digit), state}
  end

  @impl true
  def handle_call({:verify_checksum, digits}, _from, state) do
    {:reply, AccountNumber.verify(digits), state}
  end
end
