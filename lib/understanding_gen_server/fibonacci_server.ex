defmodule UnderstandingGenServer.FibonacciServer do
  alias UnderstandingGenServer.GenericServer
  alias UnderstandingGenServer.Fibonacci

  def start() do
    GenericServer.start(__MODULE__, [%{}])
  end

  #  def init(opts) do
  #    opts
  #  end

  # def loop(state) do
  #   receive do
  #     {caller, :status} ->
  #       send(caller, {:reply, state})
  #       loop(state)

  #     {caller, n} when is_pid(caller) ->
  #       result =
  #         case Map.get(state, n) do
  #           nil -> Fibonacci.sequence(n)
  #           r -> r
  #         end

  #       state
  #       |> Map.put(n, result)
  #       |> loop()

  #     _ ->
  #       loop(state)
  #   end
  # end

  def handle_message({:compute, n}, state) do
    result = Fibonacci.sequence(n)
    {:ok, result, state}
  end
end
