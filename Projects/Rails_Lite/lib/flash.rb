require 'json'

class Flash
  def initialize(req)
    cookie = req.cookies['_rails_lite_app_flash']
    @now = cookie ? JSON.parse(cookie) : {}
    @flash = {}
  end

  def [](key)
    @now[key.to_s] || @flash[key.to_s]
  end

  def []=(key,value)
    @flash[key.to_s] = value
  end

  def store_flash(res)
    cookie = {path: '/', value: @data.to_json}
    res.set_cookie("_rails_lite_app", cookie)
  end
end
