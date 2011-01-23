module Squiggle
  class ResourceType < Squiggle::Puppet

    def self.[](name)
      connection.get("/resource_type/#{name}")
    end

    def self.resource_types(name)
      connections.get("/resource_types/#{name}")
    end
  end
end
