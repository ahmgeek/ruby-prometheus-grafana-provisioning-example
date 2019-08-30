require_relative"./api/api"

require 'rack'
require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

app = Rack::Builder.new do

  # Prometheus collectors
  use Rack::Deflater
  use Prometheus::Middleware::Collector
  use Prometheus::Middleware::Exporter

  map "/" do
    run API
  end
end

run app
