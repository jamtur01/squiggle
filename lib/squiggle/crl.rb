module Squiggle
  class CRL < Squiggle::Puppet

    def self.ca(option={})
      connection.get("/certificate_revocation_list/ca")
    end

  end
end
