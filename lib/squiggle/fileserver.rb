module Squiggle
  class Fileserver < Squiggle::Puppet

    def self.[](file, type)
      connection.get("/file/#{type}/#{file}")
    end

  end
end
