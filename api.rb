require "syro"

API = Syro.new do
  get do
    res.write "GET /"
  end
end
