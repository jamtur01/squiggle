module Squiggle
  class Node < Squiggle::Puppet
    
    def self.[](name)
      connection.get("/node/#{name}")
    end

    def self.show(options={})
      raise ArgumentError, "Option :name must be present" unless options[:name]
      name = options.delete(:name)
      connection.get("/node/#{name}")
    end

    def self.create(options={})
      connection.post("/node", options)
    end

    def self.update(options={})
      raise ArgumentError, "Option :name must be present" unless options[:name]
      name = options.delete(:name)
      connection.put("/node/#{name}", options)
    end

    def self.delete(options={})
      raise ArgumentError, "Option :name must be present" unless options[:name]
      name = options.delete(:name)
      connection.delete("/node/#{name}", options)
    end
  end
end
