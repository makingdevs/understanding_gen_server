defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.Fibonacci

  def start() do
    spawn(__MODULE__, :loop, [init(%{})])
  end

  def init(opts) do
    opts
  end

  def loop(state) do
    receive do
      {caller, :status} ->
        send(caller, {:reply, state})
        loop(state)

      {caller, n} when is_pid(caller) ->
        result = Fibonacci.sequence(n)
        state = Map.put(state, n, result)
        send(caller, {:ok, n, result})
        loop(state)

      _ ->
        loop(state)
    end
  end
end
