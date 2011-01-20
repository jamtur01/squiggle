module Squiggle
  class Facts < Squiggle::Puppet

    def self.[]
      connection.get("/facts/facts")
    end

  end
end
