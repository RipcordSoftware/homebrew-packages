class Avancedb < Formula
  desc "An in-memory database based on the CouchDB REST API and containing the CouchDB Futon and Fauxton web sites"
  homepage "https://github.com/RipcordSoftware/AvanceDB"
  url "https://github.com/RipcordSoftware/AvanceDB.git", :using => :git, :tag => "0.1.1"
  sha256 "5900cba31fba8051f8eb741b3cef04647e2019f5c60e4c5ea09bd45f1b1a264f"
  head "https://github.com/RipcordSoftware/AvanceDB.git"

  depends_on "boost"
  depends_on "wget" => :build
  depends_on "autoconf@2.13" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "make", "CONF=Release"
    bin.install Dir["src/avancedb/dist/Release/GNU-Linux-x86/*"]
    #(prefix/"Library/LaunchDaemons/com.ripcordsoftware.avancedb.plist").delete
  end

  plist_options :manual => "avancedb"
  
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
