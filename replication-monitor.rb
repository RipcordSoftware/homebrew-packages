class ReplicationMonitor < Formula
  desc "A GTK+ desktop app which can create, monitor and delete AvanceDB, PouchDB, CouchDB or Cloudant replication jobs"
  homepage "https://github.com/RipcordSoftware/replication-monitor"
  url "https://github.com/RipcordSoftware/replication-monitor/archive/0.1.9.tar.gz"
  sha256 "e70317f38e3081db6e93ea69d82468ec54b522f8302c7de364d80249a793d419"
  
  resource "requests" do
    url "https://files.pythonhosted.org/packages/16/09/37b69de7c924d318e51ece1c4ceb679bf93be9d05973bb30c35babd596e2/requests-2.13.0.tar.gz"
    sha256 "5722cd09762faa01276230270ff16af7acf7c5c45d623868d9ba116f15791ce8"
  end
  
  resource "keyring" do
    url "https://files.pythonhosted.org/packages/66/30/288e93e950f5b41bc93046094744814f178e96e9fe36441d7253c8df66e4/keyring-10.2.tar.gz"
    sha256 "bf49be09b31db401791bde1799da30d6926e7de2f0fb836c3dfc85aa5538a572"
  end
  
  resource "keyrings.alt" do
    url "https://files.pythonhosted.org/packages/de/e7/b9ea280aa9a42234c0e08e2faa738542f08aff9e57036d68493460202d09/keyrings.alt-2.0.tar.gz"
    sha256 "12a01731963810ab647f7cc3ea3070c7924f9a28a88d8dc0c53e119ba9a83122"
  end
  
  resource "bunch" do
    url "https://files.pythonhosted.org/packages/ef/bf/a4cf1779a4ffb4f610903fa08e15d1f4a8a2f4e3353a02afbe097c5bf4a8/bunch-1.0.1.tar.gz"
    sha256 "50c77a0fc0cb372dfe48b5e11937d5f70e743adbf42683f3a6d2857645a76aaa"
  end
  
  include Language::Python::Virtualenv

  depends_on "gtk+3"
  depends_on "gnome-themes-standard"
  depends_on "gnome-icon-theme"
  depends_on :python3
  depends_on "py3cairo"
  depends_on "pygobject3" => "with-python3"

  def install
      virtualenv_install_with_resources
  end
end
