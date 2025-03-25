defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.GenericServer
  alias UnderstandingGenServer.Fibonacci

  @behaviour UnderstandingGenServer.GenericServer

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
    {:noreply, new_state}
  end

  def handle_call({:status}, parent, state) do
    IO.inspect(parent, label: "PARENT")
    IO.inspect(self(), label: "SELF")
    {:reply, state, state}
  end

  def handle_info(message, state) do
    IO.inspect(binding())
    {:noreply, state}
  end
end
