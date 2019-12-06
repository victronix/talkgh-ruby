require 'net/http'
require 'json'

module Talkgh
    class Namespace
        def initialize(client)
            @client = client
            @host = self.class.host
            @logger = client.logger
            @api_token = client.api_token
        end

        def self.host
            @host ||= 'api.talkgh.com/api/'
        end

        def self.host=(host)
            @host = host
        end


        private

        Get = Net::HTTP::Get
        Put = Net::HTTP::Put
        Post = Net::HTTP::Post
        Delete = Net::HTTP::Delete

        def request(params: nil, type: Get)
            uri = URI('https://' + @host + @api_token)

            params ||= {}

            unless type::REQUEST_HAS_BODY || params.empty?
                uri.query = Params.encode(params)
            end
      
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true

            message = type.new(uri)

            @logger.log_request_info(message)
      
            response = http.request(message)

            @logger.log_response_info(response, @host)

            @logger.debug(response.body) if response.body
      
            parse(response)
        end

        def parse(response)
            case response
            when Net::HTTPNoContent
              :no_content
            when Net::HTTPSuccess
              if response['Content-Type'].split(';').first == 'application/json'
                ::JSON.parse(response.body, object_class: Talkgh::Entity)
              else
                response
              end
            else
              raise Error.parse(response)
            end
        end


    end
end