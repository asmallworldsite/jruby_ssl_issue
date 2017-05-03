# jruby_ssl_issue
Example of an issue encountered with SMIME under JRuby

```
bundle install
assuming .ruby-version is respected, otherwise ensure `ruby` invokes JRuby 9.1.8.0
ruby test.rb
```

Expected Behaviour:

SMIME data output.  This can be seen by switching to MRI:

```rory@Eddie:jruby_ssl_issue(master) $ ruby test.rb 
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----257841A81F4951E175338EE2A626F7A6"

This is an S/MIME signed message

------257841A81F4951E175338EE2A626F7A6
foo bar baz
------257841A81F4951E175338EE2A626F7A6
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIII+QYJKoZIhvcNAQcCoIII6jCCCOYCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggafMIICdTCCAd4CCQCAryMFKtC2qjANBgkqhkiG9w0BAQUFADB/
MQswCQYDVQQGEwJHQjENMAsGA1UECBMERmlmZTERMA8GA1UEBxMITWFya2luY2gx
ETAPBgNVBAoTCFRlc3RDb3JwMRYwFAYDVQQDEw1Sb3J5IFNpbmNsYWlyMSMwIQYJ... etc
```

Actual Behaviour:

```rory@Eddie:jruby_ssl_issue(master) $ ruby test.rb 
TypeError: nil is not a string
  write_smime at org/jruby/ext/openssl/PKCS7.java:197
       <main> at test.rb:11
rory@Eddie:jruby_ssl_issue(master) $ ```
