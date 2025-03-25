defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.GenericServer
  alias UnderstandingGenServer.Fibonacci

  def start() do
    GenericServer.start(__MODULE__, self(), %{})
  end

  def handle_message({:compute, n}, _parent, state) do
    result =
      case Map.get(state, n) do
        nil -> Fibonacci.sequence(n)
        r -> r
      end

    new_state = Map.put_new(state, n, result)
    {:ok, result, new_state}
  end

  def handle_message({:status}, parent, state) do
    IO.inspect(parent, label: "PARENT")
    IO.inspect(self(), label: "SELF")
    {:ok, state, state}
  end
end
