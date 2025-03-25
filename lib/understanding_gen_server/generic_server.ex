defmodule UnderstandingGenServer.GenericServer do
  def start(module, opts) do
    spawn(__MODULE__, :loop, [module, init(opts)])
  end

  def init(opts) do
    opts
  end

  def loop(module, state) do
    receive do
      {message, pid} ->
        {:ok, result, state} = module.handle_message(message, state)
        send(pid, {:ok, {module, message, result, state}})
        loop(module, state)

      _ ->
        loop(module, state)
    end
  end
end
