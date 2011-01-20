module Squiggle
  class Status < Squiggle::Puppet
    def self.status(options={})
      connection.get("/status/status")
    end

  end
end
