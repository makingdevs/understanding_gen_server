defmodule UnderstandingGenServer.GenericServer do
  def start(module, opts) do
    spawn(__MODULE__, :loop, [module, init(opts)])
  end

  def init(opts) do
    opts
  end

  def loop(module, state) do
    receive do
      {pid, message} ->
        {:ok, result, new_state} = module.handle_message(message, state)
        send(pid, {:ok, {module, message, result, new_state}})
        loop(module, new_state)

      _ ->
        loop(module, state)
    end
  end
end
