alias UnderstandingGenServer.FibonacciGenServer

{:ok, pid} = FibonacciGenServer.start_link()

GenServer.cast(pid, {:compute, 10})
GenServer.cast(pid, {:compute, 20})
GenServer.cast(pid, {:compute, 30})

GenServer.call(pid, {:status})

send pid, {:any, :noop}

# Process.flag(:trap_exit, true)
# Process.exit pid, :kill
# Process.monitor(pid)
# Process.exit(pid, :kill)
