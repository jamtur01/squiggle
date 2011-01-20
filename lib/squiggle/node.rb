module Squiggle
  class Node < Squiggle::Puppet

    def self.[](name)
      connection.get("/node/#{name}")
    end

  end
end
