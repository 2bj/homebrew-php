require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Proctitle < AbstractPhp53Extension
  init
  homepage 'http://pecl.php.net/package/proctitle'
  url 'http://pecl.php.net/get/proctitle-0.1.2.tgz'
  sha1 '9fe4e5a807d83fa15bdb59fac16189103b2dd398'
  head 'https://github.com/MagicalTux/proctitle.git'

  def install
    Dir.chdir "proctitle-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install %w(modules/proctitle.so)
    write_config_file unless build.include? "without-config-file"
  end
end
