require 'formula'

class Aubio < Formula
  url 'http://aubio.org/pub/aubio-0.3.2.tar.gz'
  homepage 'http://aubio.org/'
  sha1 '8ef7ccbf18a4fa6db712a9192acafc9c8d080978'

  depends_on 'automake' => :build
  depends_on 'cmake'
  depends_on 'autoconf'
  depends_on 'libtool'
  depends_on 'pkg-config'
  depends_on 'python' => :build
  depends_on 'swig'
  depends_on 'libsndfile'
  depends_on 'libsamplerate'
  depends_on 'fftw'

  def install
    system "glibtoolize --force --ltdl --copy"
    system "autoreconf -f -i"
    system "autoheader"
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    #system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
