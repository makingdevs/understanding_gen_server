defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.GenericServer
  alias UnderstandingGenServer.Fibonacci

  def start() do
    GenericServer.start(__MODULE__, self(), %{})
  end

  def handle_cast({:compute, n}, state) do
    result =
      case Map.get(state, n) do
        nil -> Fibonacci.sequence(n)
        r -> r
      end

    new_state = Map.put_new(state, n, result)
    {:ok, new_state}
  end

  def handle_cast({:status}, state) do
    IO.inspect(self(), label: "SELF")
    {:ok, state}
  end
end
