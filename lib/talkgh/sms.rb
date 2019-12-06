# frozen_string_literal: true

module Talkgh
  class SMS < Namespace
    include Keys
  
    self.host = 'api.talkgh.com/api/'
  
    def send(params)
      request(params: hyphenate(params), type: Get)
    end
  end
end
  