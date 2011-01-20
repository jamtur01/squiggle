module Squiggle
  class Catalog < Squiggle::Puppet

    def self.[](name)
      connection.get("/catalog/#{name}")
    end

  end
end
