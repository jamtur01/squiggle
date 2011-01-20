module Squiggle
  class Report < Squiggle::Puppet

    def self.create(options={})
      raise ArgumentError, "Option :name must be present" unless options[:name]
      name = options.delete(:name)
      connection.put("/report/#{name}", options)
    end

  end
end
