require 'json'

module Helpers
  def to_json(obj)
    JSON.generate(obj)
  end

  def body_to_json(response)
    JSON.parse(response.body)
  end
end
