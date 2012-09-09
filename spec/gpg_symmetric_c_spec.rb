require 'spec_helper'

describe GpgSymmetricC do
    enctext = <<-ENCTEXT
-----BEGIN PGP MESSAGE-----
Version: GnuPG v1.4.11 (GNU/Linux)

jA0EAwMC5WVbVkn4p/JgyRtaF21Qv8bX4V6bApVnTA//IbXQMl6422oRiNM=
=FrFr
-----END PGP MESSAGE-----
    ENCTEXT

    it "should encrypt the plaintext with the key" do
        GpgSymmetricC.encrypt("plain", "key", armor: true).should == enctext
    end

    it "should decrypt the encrypted text with the key" do
        GpgSymmetricC.decrypt(enctext, "key").should == "plain"
    end

    it "should encrypt the plaintext with the key without armoring" do
        GpgSymmetricC.encrypt("plain", "key").should == File.read("plain_key.enc")
    end
end

