module Squiggle
  class Run < Squiggle::Puppet

    def self.[](name)
      connection.put("/run/#{name}")
    end

  end
end
