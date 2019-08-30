require_relative"./api"


app = Rack::Builder.new do
  map "/" do
    run API
  end
end


run app
