module Squiggle
  class Resource < Squiggle::Puppet

    def self.[](name)
      connection.get("/resource/#{name}")
    end

    def self.resources(name)
      connections.get("/resources/#{name}")
    end
  end
end
