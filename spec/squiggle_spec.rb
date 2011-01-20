require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Squiggle" do
  describe ".default_host" do
    it "should default to 'localhost'" do
      Squiggle.default_host.should == "localhost"
    end
    it "should not be settable" do
      lambda { Squiggle.default_host = "puppet.example.com" }.should raise_error
    end
    # @default_host || "localhost"
  end

  describe ".default_port" do
    it "should default to '8140'" do
      Squiggle.default_port.should == "8140"
    end
    it "should not be settable" do
      lambda { Squiggle.default_port = "9000" }.should raise_error
    end
  end

  describe ".default_scheme" do
    it "should default to 'https'" do
      Squiggle.default_scheme.should == "https"
    end
    it "should not be settable" do
      lambda { Squiggle.default_scheme = "ftp" }.should raise_error
    end
  end

  describe ".host" do
    it "should default to 'localhost' if not set" do
      Squiggle.host.should == "localhost"
    end
    it "should be settable" do
      Squiggle.host = "puppet.example.com"
      Squiggle.host.should == "puppet.example.com"
    end
  end

  describe ".port" do
    it "should default to '8140' if not set" do
      Squiggle.port.should == "8140"
    end
    it "should be settable" do
      Squiggle.port = "8141"
      Squiggle.port.should == "8141"
    end
  end

  describe ".scheme" do
    it "should default to 'http' if not set" do
      Squiggle.scheme.should == "https"
    end
    it "should be settable" do
      Squiggle.scheme = 'http'
      Squiggle.scheme.should == 'http'
    end
  end

  describe ".key" do
    it "should not have a default" do
      Squiggle.key.should be_nil
    end
    it "should be settable" do
      Squiggle.key = "/tmp/key.pem"
      Squiggle.key.should == File.read("/tmp/key.pem")
    end
    it "should raise exception if it does not exist" do
      lambda { Squiggle.key = "/tmp/badkey.pem" }.should raise_error(Errno::ENOENT)
    end
  end

  describe ".cert" do
    it "should not have a default" do
      Squiggle.cert.should be_nil
    end
    it "should be settable" do
      Squiggle.cert = "/tmp/cert.pem"
      Squiggle.cert.should == File.read("/tmp/cert.pem")
    end
    it "should raise exception if it does not exist" do
      lambda { Squiggle.cert = "/tmp/badcert.pem" }.should raise_error(Errno::ENOENT)
    end
  end

  describe ".cacert" do
    it "should not have a default" do
      Squiggle.cacert.should be_nil
    end
    it "should be settable" do
      Squiggle.cacert = "/tmp/ca_crt.pem"
      Squiggle.cacert.should == File.read("/tmp/cr_crt.pem")
    end
    it "should raise exception if it does not exist" do
      lambda { Squiggle.cacert = "/tmp/badca_crt.pem" }.should raise_error(Errno::ENOENT)
    end
  end

  describe ".connection" do
    it "should not have a default" do
      Squiggle.connection.should be_nil
    end
  end

  describe ".reset!" do
    before do
      Squiggle.host = "puppet.example.com"
      Squiggle.port = "8141"
      Squiggle.scheme = "https"
      Squiggle.key = "/tmp/key.pem"
      Squiggle.cert = "/tmp/cert.pem"
      Squiggle.cacert = "/tmp/ca_crt.pem"
    end
    it "should reset Squiggle.host" do
      Squiggle.reset!
      Squiggle.host.should == "localhost"
    end
    it "should reset Squiggle.port" do
      Squiggle.reset!
      Squiggle.port.should == "8140"
    end
    it "should reset Squiggle.scheme" do
      Squiggle.reset!
      Squiggle.scheme.should == "https"
    end
    it "should unset Squiggle.key" do
      Squiggle.reset!
      Squiggle.key.should be_nil
    end
    it "should unset Squiggle.cert" do
      Squiggle.reset!
      Squiggle.cert.should be_nil
    end
    it "should unset Squiggle.cacert" do
      Squiggle.reset!
      Squiggle.cacert.should be_nil
    end
    it "should unset Squiggle.connection" do
      Squiggle.reset!
      Squiggle.connection.should be_nil
    end
  end
  describe ".connect!" do
    it "should create a connection object" do
      Squiggle.connect!
      Squiggle.connection.should be_a_kind_of(Squiggle::Connection)
    end
    it "connection should contain a host" do
      Squiggle.connection.host.should == "localhost"
    end
  end
end
