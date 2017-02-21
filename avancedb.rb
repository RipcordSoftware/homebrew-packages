class Avancedb < Formula
  desc "An in-memory database based on the CouchDB REST API and containing the CouchDB Futon and Fauxton web sites"
  homepage "https://github.com/RipcordSoftware/AvanceDB"
  url "https://github.com/RipcordSoftware/AvanceDB/archive/v0.1.0.tar.gz"  
  sha256 "e99ade1744bf6c0af43d8ae62fff24768c6380359e199e96e251fa7974c4876e"
  head "https://github.com/RipcordSoftware/AvanceDB.git"

  depends_on "boost"
  depends_on "wget" => :build
  depends_on "autoconf@2.13" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "make"
  end
end
