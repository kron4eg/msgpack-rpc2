require "msgpack/rpc2"

client = Msgpack::Rpc2::Client.new("127.0.0.1:1234")

sum = client.func("sum")

# remote call
sum.call(1, 2) # => 3

arith = client.namespace("Arithmetics")
arith_sum = arith.func("sum") # equivalent to client.func("Arithmetics.sum")

# remote call
arith_sum.call(1, 2) # => 3

arith_mult = arith.func("mult")  # equivalent to client.func("Arithmetics.mult")

# remote call
arith_mult.call(3, 3) # => 9

long_run = client.func("very_long_running_task")
# remote notify, don't wait for response
long_run.notify(1, 2, 3)

multiply_2x = arith.func("mult", 2) # default param

multiply_2x.call(2) # => 4
multiply_2x.call(5) # => 10
