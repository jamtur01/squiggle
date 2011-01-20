require 'squiggle/puppet'
require 'squiggle/node'
require 'squiggle/connection'
require 'squiggle/status'
require 'squiggle/crl'
require 'squiggle/certificate'
require 'squiggle/run'
require 'squiggle/facts'
require 'squiggle/certreq'
require 'squiggle/report'

module Squiggle
  class << self
    attr_writer :host, :port, :scheme, :key, :cert, :cacert, :environment, :connection

    def default_host
      @default_host || "localhost"
    end

    def default_port
      @default_port || "8140"
    end

    def default_scheme
      @default_scheme || "https"
    end

    def default_environment
      @default_environment || "production"
    end

    def host
      @host || default_host
    end

    def port
      @port || default_port
    end

    def scheme
      @scheme || default_scheme
    end

    def environment
      @enviroment || default_environment
    end

    def key
      @key
    end

    def cert
      @cert
    end

    def cacert
      @cacert
    end

    def connection
      @connection
    end

    def connect!
      @connection = Connection.new(
        :url => "#{scheme}://#{host}:#{port}/#{environment}",
        :key => OpenSSL::PKey::RSA.new(File.read(key)),
        :cert => OpenSSL::X509::Certificate.new(File.read(cert)),
        :cacert => cacert,
        :verify_ssl => OpenSSL::SSL::VERIFY_PEER
      )
    end

    def configure
      @host = Squiggle.host
      @port = Squiggle.port
      @environment = Squiggle.environment
      @key = Squiggle.key
      @cert = Squiggle.cert
      @cacert = Squiggle.cacert
    end

    def reset!
      @host = default_host
      @port = default_port
      @scheme = default_scheme
      @environment = default_environment
      @cert = nil
      @key = nil
      @cacert = nil
      @connection = nil
      puts "Squiggle is reset"
    end

    def setup
      yield self
    end

  end
end
