require File.join(File.dirname(__FILE__), 'abstract-php-extension')

class Php53Mongo < AbstractPhp53Extension
  init
  homepage 'http://pecl.php.net/package/mongo'
  url 'http://pecl.php.net/get/mongo-1.4.4.tgz'
  sha1 'c60f457b740ed876d0adc9cec252df1f04ddfccc'
  head 'https://github.com/mongodb/mongo-php-driver.git'

  def install
    Dir.chdir "mongo-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                          phpconfig
    system "make"
    prefix.install "modules/mongo.so"
    write_config_file unless build.include? "without-config-file"
  end
end
