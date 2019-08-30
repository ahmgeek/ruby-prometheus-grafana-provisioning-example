require_relative"./api/api"

require 'prometheus/middleware/exporter'
app = Rack::Builder.new do
  use Prometheus::Middleware::Exporter

  map "/" do
    run API
  end
end

run app
