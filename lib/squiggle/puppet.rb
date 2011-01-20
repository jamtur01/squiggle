module Squiggle
  class Puppet
    attr_accessor :key, :cert, :cacert, :connection

    def self.connection
      @connection ||= Squiggle.connection
    end

    class << self
      def nodes
        Node.all
      end

      def certificates
        Certificates.all
      end

      def status
        Status.status
      end

    end
  end
end

