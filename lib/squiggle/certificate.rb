module Squiggle
  class Certificate < Squiggle::Puppet

    def self.[](name)
      connection.get("/certificate/#{name}")
    end

    def self.ca(options={})
      connection.get("/certificate/ca")
  end
end
