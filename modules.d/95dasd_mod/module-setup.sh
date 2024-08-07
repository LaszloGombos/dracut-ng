#!/bin/bash

# called by dracut
check() {
    local _arch=${DRACUT_ARCH:-$(uname -m)}
    [ "$_arch" = "s390" ] || [ "$_arch" = "s390x" ] || return 1

    return 0
}

# called by dracut
installkernel() {
    instmods dasd_mod dasd_eckd_mod dasd_fba_mod dasd_diag_mod
}

# called by dracut
install() {
    inst_hook cmdline 31 "$moddir/parse-dasd-mod.sh"
    inst_multiple -o dasd_cio_free
}
