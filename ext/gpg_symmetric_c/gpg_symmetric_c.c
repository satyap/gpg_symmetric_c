#include <gpgme.h>

#include "ruby.h"

void gpg_to_rb(gpgme_data_t gpg_data, VALUE rb_data) {
// http://pyme.sourceforge.net/doc/gpgme/Data-Buffer-I_002fO-Operations.html#Data-Buffer-I_002fO-Operations
    rb_data = rb_str_new_cstr(gpg_data); // probably shouldn't assign
}

void rb_to_gpg(VALUE rb_data, gpgme_data_t gpg_data) {
// http://pyme.sourceforge.net/doc/gpgme/Data-Buffer-I_002fO-Operations.html#Data-Buffer-I_002fO-Operations
    rb_data = rb_str_new_cstr(gpg_data); // probably shouldn't assign
}

void handle_gpgme_errors(gpgme_error_t err) {
    if(err) {
        fprintf (stderr, "GpgME failed: %s: %s\n",
                gpgme_strsource(err), gpgme_strerror(err));
    }
}

VALUE gsc_encrypt(int argc, VALUE *argv, VALUE klass) {
    gpgme_data_t gpg_cipher;
    gpgme_data_t gpg_plain;
    VALUE plain, key, options, cipher;
    gpgme_ctx_t *ctx; 
    gpgme_error_t err;
    int yes=0;

    // validate the arguments given: 2 required, 1 optional
    rb_scan_args(argc, argv, "21", &plain, &key, &options);
    Check_Type(plain, T_STRING);
    Check_Type(key, T_STRING);

    rb_to_gpg(plain, gpg_plain);

    // http://pyme.sourceforge.net/doc/gpgme/Encrypting-a-Plaintext.html
    // get context
    err = gpgme_new(ctx);
    handle_gpgme_errors(err);

    // set context to ascii armor if options is setting armor: true
    // TODO
    // ASCII armored output is disabled if yes is zero, and enabled otherwise. 
    gpgme_set_armor(*ctx, yes);

    err = gpgme_op_encrypt(*ctx, NULL, 0, gpg_plain, gpg_cipher);
    handle_gpgme_errors(err);

    gpg_to_rb(gpg_cipher, cipher);

    gpgme_release(*ctx);
    return cipher;
}

void Init_gpg_symmetric_c(void) {
    VALUE klass = rb_define_module("GpgSymmetricC");

    // def encrypt(plain, key, options={})
    // options: { armor: true }
    rb_define_module_function(klass, "encrypt", gsc_encrypt, -1);
}

