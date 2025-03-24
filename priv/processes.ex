alias UnderstandingGenServer.FibonacciServer

IO.inspect(self(), label: "SELF")

pid1 = FibonacciServer.start()
send pid1, 10
pid2 = FibonacciServer.start()
send pid2, 15
pid3 = FibonacciServer.start()
send pid3, 20

IO.inspect [r1, r2, r3]
