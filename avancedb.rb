class Avancedb < Formula
  desc "An in-memory database based on the CouchDB REST API and containing the CouchDB Futon and Fauxton web sites"
  homepage "https://github.com/RipcordSoftware/AvanceDB"
  url "ftp://ftp.ripcordsoftware.com/pub/avancedb/avancedb-0.1.1.tar.gz"  
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
  end
end
