defmodule UnderstandingGenServer.FibonacciGenServer do
  alias UnderstandingGenServer.Fibonacci
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, %{}, opts)
  end

  def init(init_arg), do: {:ok, init_arg}

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
