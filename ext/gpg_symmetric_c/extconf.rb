require 'mkmf'

extension_name = 'gpg_symmetric_c'

dir_config(extension_name)

have_library("gpgme") or raise RuntimeError, <<-MSG
Could not find gpgme C library. Are you sure you have it installed?
MSG

create_makefile(extension_name)
