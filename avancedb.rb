class Avancedb < Formula
  desc "An in-memory database based on the CouchDB REST API and containing the CouchDB Futon and Fauxton web sites"
  homepage "https://github.com/RipcordSoftware/AvanceDB"
  url "https://github.com/RipcordSoftware/AvanceDB.git", :using => :git, :tag => "0.1.1"
  head "https://github.com/RipcordSoftware/AvanceDB.git"

  depends_on "boost"
  depends_on "wget" => :build
  depends_on "autoconf@2.13" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  
  bottle do
    root_url "https://ftp.ripcordsoftware.com/pub/brew"
    cellar :any
    rebuild 1
    sha256 "ac0a2e1492db7e3c8f0b4b09a1ecc88a26d95311aa05513469b90400cb16d810" => :sierra
    sha256 "7d581fe325dd32b44bef21057b8ddabb8d1e35ef9d1c0df6163ef9db036a29bd" => :el_capitan
    sha256 "c218fcd576400046698b88f3b1ce8f2ea68ba88db82aba532e0efb5030cbaf81" => :yosemite
  end

  def install
    system "make", "CONF=Release"
    bin.install Dir["src/avancedb/dist/Release/GNU-Linux-x86/*"]
    #(prefix/"Library/LaunchDaemons/com.ripcordsoftware.avancedb.plist").delete
  end

  plist_options :startup => true
  
  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/avancedb</string>
        <string>--dir</string>
        <string>#{opt_bin}</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
    EOS
  end

  def caveats
    str = <<-EOS.undent
    To test AvanceDB run:
        curl http://127.0.0.1:5994/
    The reply should look like:
        {"couchdb":"Welcome","avancedb":"Welcome","uuid":"....",...}}
    EOS
    str
  end
end
