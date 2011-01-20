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
      response = RestClient::Request.execute(
        :method => :GET,
        :url => "#{@url}#{path}",
        :headers => build_headers(:GET, path, headers)
      )
    end

    def put(path, payload, headers={})
      response = RestClient::Request.execute(
        :method => :PUT,
        :url => "#{@url}#{path}",
        :headers => build_headers(:PUT, path, headers, YAML.generate(payload)),
        :payload => YAML.generate(payload)
      )
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
