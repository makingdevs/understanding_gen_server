alias UnderstandingGenServer.FibonacciServer
alias UnderstandingGenServer.GenericServer

caller = self()
IO.inspect(self(), label: "SELF")

pid = FibonacciServer.start()

GenericServer.cast(pid, {:compute, 10})
GenericServer.cast(pid, {:compute, 20})
GenericServer.cast(pid, {:compute, 30})

GenericServer.call(pid, {:status})

send pid, {:any, :noop}

Process.flag(:trap_exit, true)
Process.exit pid, :kill
Process.monitor(pid)
Process.exit(pid, :kill)
