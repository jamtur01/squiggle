module Squiggle
  class CertReq < Squiggle::Puppet

     def self.all(options={})
      connection.get("/certificate_requests/all")
    end

    def self.[](name)
      connection.get("/certificate_request/#{name}")
    end

  end
end
