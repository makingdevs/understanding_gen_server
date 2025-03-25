defmodule UnderstandingGenServer.GenericServer do
  @callback handle_cast(msg :: term, state :: term) :: {:noreply, new_state :: term}
  @callback handle_call(msg :: term, parent :: pid, state :: term) ::
              {:reply, result :: term, new_state :: term}
  @callback handle_info(msg :: term, state :: term) :: {:noreply, new_state :: term}

  def start(module, parent, opts) do
    spawn_link(__MODULE__, :loop, [module, parent, init(opts)])
  end

  def init(opts) do
    opts
  end

  def cast(pid_server, message) do
    send(pid_server, {:cast, message})
  end

  def call(pid_server, message) do
    send(pid_server, {:call, self(), message})

    receive do
      msg -> msg
    end
  end

  def loop(module, parent, state) do
    receive do
      {:cast, message} ->
        {:noreply, new_state} = module.handle_cast(message, state)
        loop(module, parent, new_state)

      {:call, responds_to, message} ->
        {:reply, result, new_state} = module.handle_call(message, parent, state)
        send(responds_to, result)
        loop(module, parent, new_state)

      message ->
        {:noreply, new_state} = module.handle_info(message, state)
        send(parent, {:noreply, {module, message, new_state}})
        loop(module, parent, new_state)
    end
  end
end
