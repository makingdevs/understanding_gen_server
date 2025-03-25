defmodule UnderstandingGenServer.GenericServer do
  def start(module, parent, opts) do
    spawn(__MODULE__, :loop, [module, parent, init(opts)])
  end

  def init(opts) do
    opts
  end

  def loop(module, parent, state) do
    receive do
      {pid, message} ->
        {:ok, result, new_state} = module.handle_message(message, parent, state)
        send(pid, {:ok, {module, message, result, new_state}})
        loop(module, parent, new_state)

      _ ->
        loop(module, parent, state)
    end
  end
end
