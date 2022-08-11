Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B975E58FE2D
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Aug 2022 16:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234432AbiHKOUu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Aug 2022 10:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234675AbiHKOUt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Aug 2022 10:20:49 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF4A30558
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2022 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RHTIjJ2DND3QiyBjvb7y/Xm5CZJwO94Ae3tNWHpJ9Hs=; b=fCDBH1Zcej/qyLut1R7CLaAWdl
        Eu87THyxmaNzwIZGd84njwkvaxRlD0M6Iap8rI1jVLf4yJkHwBLkHKG9C6fyw36QBAyYSnrkxMBpG
        h9rFpAkq/oN2q4iKddnQpA5IhzPsW+iNDGThhpcMQos4TSq2BmTY8knwHWKXtlIrA6hoDrPoVzWy7
        QmeXzDpmvxZsCHMv4CL81ZhJ1zIlek3FS4i5xlIjeGqCHPQexRGwapIyrwbYQFfqXgvt2BvNkyuGL
        XsijQfVVfmgbsyGSKSbIaBqwKD4BuBYc2bMFP9lZYP1SmGlCiLqIPogGHm5wz7cUFdEeH/9g4CNse
        H9q8aSJA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33748)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1oM93E-0007qw-E6; Thu, 11 Aug 2022 15:20:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1oM93D-0008TF-OE; Thu, 11 Aug 2022 15:20:43 +0100
Date:   Thu, 11 Aug 2022 15:20:43 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Odd kbuild behaviour
Message-ID: <YvUQOwL6lD4/5/U6@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

Please can someone try to explain what is going on when I ask for a .S
file to be built to an object with 5.19 and GNU make 4.3 from Debian
Bullseye (although I don't think this is a make version issue):

$ rm ../build/multi/arch/arm/lib/findbit.o
$ make -j2 CROSS_COMPILE=3D"arm-linux-gnueabihf-" ARCH=3D"arm" O=3D../build=
/multi arch/arm/lib/findbit.o
make[1]: Entering directory '/home/rmk/git/build/multi'
  GEN     Makefile
  CALL    /home/rmk/git/linux-rmk/scripts/atomic/check-atomics.sh
  CALL    /home/rmk/git/linux-rmk/scripts/checksyscalls.sh
make[3]: *** No rule to make target 'arch/arm/lib/findbit.o'.  Stop.
make[2]: *** [/home/rmk/git/linux-rmk/scripts/Makefile.build:441: __build] =
Error 2
make[1]: *** [/home/rmk/git/linux-rmk/Makefile:1843: arch/arm] Error 2
make[1]: *** Waiting for unfinished jobs....
  AS      arch/arm/lib/findbit.o
make[1]: Leaving directory '/home/rmk/git/build/multi'
make: *** [Makefile:219: __sub-make] Error 2

If I re-run it without removing the generated object, I get:

make[1]: Entering directory '/home/rmk/git/build/multi'
  GEN     Makefile
  CALL    /home/rmk/git/linux-rmk/scripts/atomic/check-atomics.sh
  CALL    /home/rmk/git/linux-rmk/scripts/checksyscalls.sh
make[3]: Nothing to be done for 'arch/arm/lib/findbit.o'.
make[1]: Leaving directory '/home/rmk/git/build/multi'

Note the "make[3]:" line, which ought not be there.

If I run make with V=3D1 in addition:

$ rm ../build/multi/arch/arm/lib/findbit.o
$ make -j2 CROSS_COMPILE=3D"arm-linux-gnueabihf-" ARCH=3D"arm"  O=3D../buil=
d/multi arch/arm/lib/findbit.o V=3D1
make -C /home/rmk/git/build/multi -f /home/rmk/git/linux-rmk/Makefile arch/=
arm/lib/findbit.o
make[1]: Entering directory '/home/rmk/git/build/multi'
if [ -f /home/rmk/git/linux-rmk/.config -o \
         -d /home/rmk/git/linux-rmk/include/config -o \
         -d /home/rmk/git/linux-rmk/arch/arm/include/generated ]; then \
        echo >&2 "***"; \
        echo >&2 "*** The source tree is not clean, please run 'make ARCH=
=3Darm mrproper'"; \
        echo >&2 "*** in /home/rmk/git/linux-rmk";\
        echo >&2 "***"; \
        false; \
fi
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Darch/arm/tools=
 uapi
ln -fsn /home/rmk/git/linux-rmk source
  { echo "# Automatically generated by /home/rmk/git/linux-rmk/Makefile: do=
n't edit"; echo "include /home/rmk/git/linux-rmk/Makefile"; } > Makefile
test -e .gitignore || \
{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Dscripts/basic
set -e; mkdir -p include/config/; trap "rm -f include/config/.kernel.releas=
e.tmp" EXIT; { echo "5.19.0$(sh /home/rmk/git/linux-rmk/scripts/setlocalver=
sion /home/rmk/git/linux-rmk)"; } > include/config/.kernel.release.tmp; if =
[ ! -r include/config/kernel.release ] || ! cmp -s include/config/kernel.re=
lease include/config/.kernel.release.tmp; then : '  UPD     include/config/=
kernel.release'; mv -f include/config/.kernel.release.tmp include/config/ke=
rnel.release; fi
make -f /home/rmk/git/linux-rmk/scripts/Makefile.asm-generic obj=3Darch/arm=
/include/generated/uapi/asm \
generic=3Dinclude/uapi/asm-generic
set -e; mkdir -p include/generated/uapi/linux/; trap "rm -f include/generat=
ed/uapi/linux/.version.h.tmp" EXIT; {        if [ 0 -gt 255 ]; then echo \#=
define LINUX_VERSION_CODE 332799; else echo \#define LINUX_VERSION_CODE 332=
544; fi; echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + ((=
c) > 255 ? 255 : (c)))'; echo \#define LINUX_VERSION_MAJOR 5; echo \#define=
 LINUX_VERSION_PATCHLEVEL 19; echo \#define LINUX_VERSION_SUBLEVEL 0; } > i=
nclude/generated/uapi/linux/.version.h.tmp; if [ ! -r include/generated/uap=
i/linux/version.h ] || ! cmp -s include/generated/uapi/linux/version.h incl=
ude/generated/uapi/linux/.version.h.tmp; then : '  UPD     include/generate=
d/uapi/linux/version.h'; mv -f include/generated/uapi/linux/.version.h.tmp =
include/generated/uapi/linux/version.h; fi
/home/rmk/git/linux-rmk/scripts/remove-stale-files
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Dscripts/dtc
make -f /home/rmk/git/linux-rmk/scripts/Makefile.asm-generic obj=3Darch/arm=
/include/generated/asm \
generic=3Dinclude/asm-generic
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Dscripts
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.utsrele=
ase.h.tmp" EXIT; {   if [ `echo -n "5.19.0+" | wc -c ` -gt 64 ]; then echo =
'"5.19.0+" exceeds 64 characters' >&2; exit 1; fi; echo \#define UTS_RELEAS=
E \"5.19.0+\"; } > include/generated/.utsrelease.h.tmp; if [ ! -r include/g=
enerated/utsrelease.h ] || ! cmp -s include/generated/utsrelease.h include/=
generated/.utsrelease.h.tmp; then : '  UPD     include/generated/utsrelease=
=2Eh'; mv -f include/generated/.utsrelease.h.tmp include/generated/utsrelea=
se.h; fi
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Darch/arm/tools=
 kapi
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Dscripts/mod
set -e; mkdir -p scripts/mod/; trap "rm -f scripts/mod/.devicetable-offsets=
=2Eh.tmp" EXIT; {       echo "#ifndef __DEVICETABLE_OFFSETS_H__"; echo "#de=
fine __DEVICETABLE_OFFSETS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo =
" *"; echo " * This file was generated by Kbuild"; echo " */"; echo ""; sed=
 -ne  's:^[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; /^->/{s:->#\(.*\):=
/* \1 */:; s:^->\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s=
:->::; p;}' < scripts/mod/devicetable-offsets.s; echo ""; echo "#endif"; } =
> scripts/mod/.devicetable-offsets.h.tmp; if [ ! -r scripts/mod/devicetable=
-offsets.h ] || ! cmp -s scripts/mod/devicetable-offsets.h scripts/mod/.dev=
icetable-offsets.h.tmp; then : '  UPD     scripts/mod/devicetable-offsets.h=
'; mv -f scripts/mod/.devicetable-offsets.h.tmp scripts/mod/devicetable-off=
sets.h; fi
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3D.
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.bounds.=
h.tmp" EXIT; {        echo "#ifndef __LINUX_BOUNDS_H__"; echo "#define __LI=
NUX_BOUNDS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo " *"; echo " * T=
his file was generated by Kbuild"; echo " */"; echo ""; sed -ne        's:^=
[[:space:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; /^->/{s:->#\(.*\):/* \1 */:;=
 s:^->\([^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}=
' < kernel/bounds.s; echo ""; echo "#endif"; } > include/generated/.bounds.=
h.tmp; if [ ! -r include/generated/bounds.h ] || ! cmp -s include/generated=
/bounds.h include/generated/.bounds.h.tmp; then : '  UPD     include/genera=
ted/bounds.h'; mv -f include/generated/.bounds.h.tmp include/generated/boun=
ds.h; fi
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.timecon=
st.h.tmp" EXIT; { echo 250 | bc -q /home/rmk/git/linux-rmk/kernel/time/time=
const.bc; } > include/generated/.timeconst.h.tmp; if [ ! -r include/generat=
ed/timeconst.h ] || ! cmp -s include/generated/timeconst.h include/generate=
d/.timeconst.h.tmp; then : '  UPD     include/generated/timeconst.h'; mv -f=
 include/generated/.timeconst.h.tmp include/generated/timeconst.h; fi
  sh /home/rmk/git/linux-rmk/scripts/atomic/check-atomics.sh
set -e; mkdir -p include/generated/; trap "rm -f include/generated/.asm-off=
sets.h.tmp" EXIT; {   echo "#ifndef __ASM_OFFSETS_H__"; echo "#define __ASM=
_OFFSETS_H__"; echo "/*"; echo " * DO NOT MODIFY."; echo " *"; echo " * Thi=
s file was generated by Kbuild"; echo " */"; echo ""; sed -ne  's:^[[:space=
:]]*\.ascii[[:space:]]*"\(.*\)".*:\1:; /^->/{s:->#\(.*\):/* \1 */:; s:^->\(=
[^ ]*\) [\$#]*\([^ ]*\) \(.*\):#define \1 \2 /* \3 */:; s:->::; p;}' < arch=
/arm/kernel/asm-offsets.s; echo ""; echo "#endif"; } > include/generated/.a=
sm-offsets.h.tmp; if [ ! -r include/generated/asm-offsets.h ] || ! cmp -s i=
nclude/generated/asm-offsets.h include/generated/.asm-offsets.h.tmp; then :=
 '  UPD     include/generated/asm-offsets.h'; mv -f include/generated/.asm-=
offsets.h.tmp include/generated/asm-offsets.h; fi
  sh /home/rmk/git/linux-rmk/scripts/checksyscalls.sh arm-linux-gnueabihf-g=
cc -Wp,-MMD,./.missing-syscalls.d -nostdinc -I/home/rmk/git/linux-rmk/arch/=
arm/include -I./arch/arm/include/generated -I/home/rmk/git/linux-rmk/includ=
e -I./include -I/home/rmk/git/linux-rmk/arch/arm/include/uapi -I./arch/arm/=
include/generated/uapi -I/home/rmk/git/linux-rmk/include/uapi -I./include/g=
enerated/uapi -include /home/rmk/git/linux-rmk/include/linux/compiler-versi=
on.h -include /home/rmk/git/linux-rmk/include/linux/kconfig.h -include /hom=
e/rmk/git/linux-rmk/include/linux/compiler_types.h -D__KERNEL__ -mlittle-en=
dian -fmacro-prefix-map=3D/home/rmk/git/linux-rmk/=3D -Wall -Wundef -Werror=
=3Dstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshor=
t-wchar -fno-PIE -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit=
-int -Werror=3Dreturn-type -Wno-format-security -std=3Dgnu11 -fno-dwarf2-cf=
i-asm -fno-ipa-sra -mabi=3Daapcs-linux -mfpu=3Dvfp -funwind-tables -mtp=3Dc=
p15 -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH__=3D7 -march=3Darmv7-=
a -msoft-float -Uarm -fno-delete-null-pointer-checks -Wno-frame-address -Wn=
o-format-truncation -Wno-format-overflow -Wno-address-of-packed-member -O2 =
-fno-allow-store-data-races -Wframe-larger-than=3D1024 -fno-stack-protector=
 -Wimplicit-fallthrough=3D5 -Wno-main -Wno-unused-but-set-variable -Wno-unu=
sed-const-variable -fomit-frame-pointer -fno-stack-clash-protection -Wdecla=
ration-after-statement -Wvla -Wno-pointer-sign -Wcast-function-type -Wno-st=
ringop-truncation -Wno-stringop-overflow -Wno-restrict -Wno-maybe-uninitial=
ized -Wno-alloc-size-larger-than -fno-strict-overflow -fno-stack-check -fco=
nserve-stack -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werr=
or=3Ddesignated-init -Wno-packed-not-aligned -I /home/rmk/git/linux-rmk/. -=
I ./.    -DKBUILD_MODFILE=3D'"./missing-syscalls"' -DKBUILD_BASENAME=3D'"mi=
ssing_syscalls"' -DKBUILD_MODNAME=3D'"missing_syscalls"' -D__KBUILD_MODNAME=
=3Dkmod_missing_syscalls
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Darch/arm \
single-build=3D1 \
need-builtin=3D1 need-modorder=3D1
make -f /home/rmk/git/linux-rmk/scripts/Makefile.build obj=3Darch/arm/lib \
single-build=3D1 \
need-builtin=3D1 need-modorder=3D1
make -f /dev/null arch/arm/lib/findbit.o
make[3]: *** No rule to make target 'arch/arm/lib/findbit.o'.  Stop.
make[2]: *** [/home/rmk/git/linux-rmk/scripts/Makefile.build:441: __build] =
Error 2
make[1]: *** [/home/rmk/git/linux-rmk/Makefile:1843: arch/arm] Error 2
make[1]: *** Waiting for unfinished jobs....
  arm-linux-gnueabihf-gcc -Wp,-MMD,arch/arm/lib/.findbit.o.d -nostdinc -I/h=
ome/rmk/git/linux-rmk/arch/arm/include -I./arch/arm/include/generated -I/ho=
me/rmk/git/linux-rmk/include -I./include -I/home/rmk/git/linux-rmk/arch/arm=
/include/uapi -I./arch/arm/include/generated/uapi -I/home/rmk/git/linux-rmk=
/include/uapi -I./include/generated/uapi -include /home/rmk/git/linux-rmk/i=
nclude/linux/compiler-version.h -include /home/rmk/git/linux-rmk/include/li=
nux/kconfig.h -D__KERNEL__ -mlittle-endian -fmacro-prefix-map=3D/home/rmk/g=
it/linux-rmk/=3D -D__ASSEMBLY__ -fno-PIE -mabi=3Daapcs-linux -mfpu=3Dvfp -f=
unwind-tables -mtp=3Dcp15 -marm -Wa,-mno-warn-deprecated -D__LINUX_ARM_ARCH=
__=3D7 -march=3Darmv7-a -include asm/unified.h -msoft-float -I /home/rmk/gi=
t/linux-rmk/arch/arm/lib -I ./arch/arm/lib    -c -o arch/arm/lib/findbit.o =
/home/rmk/git/linux-rmk/arch/arm/lib/findbit.S
  /home/rmk/git/linux-rmk/scripts/check-local-export arch/arm/lib/findbit.o
make[1]: Leaving directory '/home/rmk/git/build/multi'
make: *** [Makefile:219: __sub-make] Error 2

Clearly, kbuild knows how to do this, because it issued the appropriate
command to create the object file!

If I don't use -j2, then make fails at the error without building
findbit.o.

Mike Rapport reports similar issues to me, so it seems it's not just me
encountering this problem.

Any ideas why the kbuild infrastructure thinks it can't build a .o from
a .S file?

Thanks.

--=20
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
