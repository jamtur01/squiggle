require 'rest-client'
require 'yaml'
require 'openssl'

module Squiggle
  class Connection
    attr_accessor :key, :cert, :cacert, :port, :scheme, :host

    def initialize(options={})
      endpoint          = URI.parse(options[:url])
      @url              = options[:url]
      @host             = endpoint.host
      @scheme           = endpoint.scheme
      @port             = endpoint.port
    end

    def get(path, headers={})
      begin
        RestClient.get(
          "#{@url}#{path}", 
          build_headers(:GET, path, headers)
        )
      rescue => e
        e.response
      end
    end

    def put(path, payload, headers={})
      begin
        RestClient.put(
          "#{@url}#{path}",
          YAML.generate(payload),
          build_headers(:PUT, path, headers, YAML.generate(payload))
        )
      rescue => e
        e.response
      end
    end

    def head(path, payload, headers={})
      begin
        RestClient.head(
          "#{@url}#{path}",
          YAML.generate(payload),
          build_headers(:HEAD, path, headers, YAML.generate(payload))
        )   
      rescue => e
        e.response
      end 
    end 

    private

    def build_headers(method, path, headers={}, yaml_body=false)
      headers['Accept']       = "s"
      headers["Content-Type"] = "yaml" if yaml_body
      headers['Content-Length'] = yaml_body.bytesize.to_s if yaml_body
      headers
    end
  end
end
