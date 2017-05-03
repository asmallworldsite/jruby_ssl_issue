require 'openssl'

data = 'foo bar baz'

p12 = OpenSSL::PKCS12.new File.read('./test.p12'), ''

wwdc = OpenSSL::X509::Certificate.new File.read('./wwdc_cert.pem')

pk7 = OpenSSL::PKCS7.sign p12.certificate, p12.key, data.to_s, [wwdc], OpenSSL::PKCS7::BINARY | OpenSSL::PKCS7::DETACHED

smime = OpenSSL::PKCS7.write_smime pk7

puts smime

