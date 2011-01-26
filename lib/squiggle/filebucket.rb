module Squiggle
  class Filebucket < Squiggle::Puppet

    def self.get(checksum)
      connection.get("/file_bucket_file/md5/#{checksum}")
    end

    def self.put(checksum)
      connection.put("/file_bucket_file/md5/#{checksum}")
    end

    def self.check(checksum)
      connection.head("/file_bucket_file/md5/#{checksum}")
    end

    def self.diff(checksum1,checksum2)
      connection.get("/file_bucket_file/md5/#{checksum1}?diff_with=#{checksum2}")
    end

  end
end
