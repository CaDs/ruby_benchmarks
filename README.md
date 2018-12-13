## Frameworks tested:
- Agoo: https://github.com/ohler55/agoo
- Hanami: https://github.com/hanami/hanami
- Padrino: https://github.com/padrino/padrino-framework
- Rails: https://github.com/rails/rails
- Roda: https://github.com/jeremyevans/roda
- Sinatra: https://github.com/sinatra/sinatra

## How to
For Agoo version I'm running the server with
`RACK_ENV=production ruby app.rb`
... because I don't know how else run it.

For Hanami version
`HANAMI_ENV=production rackup -q`

For Rails versions
`RAILS_ENV=production rackup -q`

For ruby versions not supporting JIT

`RACK_ENV=production rackup -q`

For ruby versions supporting JIT

`RUBYOPT="--jit" RACK_ENV=production rackup -q`

For Jruby version JIT sore is calculated with `-Xcompile.invokedynamic` flag

`RUBYOPT="-Xcompile.invokedynamic" RACK_ENV=production rackup -q`

The score is calculated by running 4 times
`wrk -t4 -c100 -d30s http://localhost:9292/`

The first time is for warming up and then I'm getting the average score of the 3 next rounds

### Note
For JRuby version I did run the benchmarker 5 times since it takes about 2 rounds to warm up and give stable results.

For JRuby version with `-Xcompile.invokedynamic` it took about 3 rounds to warm up so I had to run the benchmarker 6 times to get stable results.

Results are as above:

Running in a `MacBook Pro 3.5 GHz Intel Core i7 16 GB 2133 MHz LPDDR3`

Score is the number of requests per second.

---------------------------------------------------
| ruby version | framework | score   | JIT score  |
|--------------|-----------|---------|------------|
| 2.5.3p105    | agoo      | 1182809 |     -      |
|              | hanami    | 276210  |     -      |
|              | padrino   | 204299  |     -      |
|              | rails_api | 3902    |     -      |
|              | rails     | 3175    |     -      |
|              | roda      | 513080  |     -      |
|              | sinatra   | 338932  |     -      |
| 2.6.0-rc1    | agoo      | 1056793 |     -      |
|              | hanami    | 303779  |  271650    |
|              | padrino   | 194111  |  180731    |
|              | rails_api | 3865    |  2503      |
|              | rails     | 3007    |  1877      |
|              | roda      | 513691  |  462229    |
|              | sinatra   | 350493  |  334544    |
| jruby-9.2.5.0| agoo      |    -    |     -      |
|              | hanami    |    -    |     -      |
|              | padrino   | 213970  |  315107    |
|              | rails_api |    -    |     -      |
|              | rails     |    -    |     -      |
|              | roda      | 714487  |  846178    |
|              | sinatra   | 463915  |  643856    |

