module Talkgh
    class Client
        attr_writer :api_token

        def initialize(options = {})
            @api_token = options[:api_token] || ENV['TALKGH_API_TOKEN']

            self.logger = options[:logger] || (defined?(Rails.logger) && Rails.logger)
        end

        def api_token
            unless @api_token
              raise AuthenticationError.new('No API token provided. ' \
                'See https://talkgh.com for details.')
            end
      
            @api_token
        end
        
        def sms
            @sms ||= SMS.new(self)
        end

        def logger
            @logger
        end
      
        def logger=(logger)
           @logger = Logger.new(logger)
        end

    end
end
  