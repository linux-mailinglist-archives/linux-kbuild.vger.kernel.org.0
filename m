Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8845C5F6BFE
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Oct 2022 18:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiJFQxW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Oct 2022 12:53:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiJFQxV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Oct 2022 12:53:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CF89E0EB
        for <linux-kbuild@vger.kernel.org>; Thu,  6 Oct 2022 09:53:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DAA4361A28
        for <linux-kbuild@vger.kernel.org>; Thu,  6 Oct 2022 16:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B987C433D6;
        Thu,  6 Oct 2022 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665075198;
        bh=H6ntdFKqBqLmJlryAETBitEeALZve5Pu0hlbJgl8Myo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BOW0EkerfCexTl2dctZ0ctdzNeojZBTyvrcuqQoGnCqgp89BKLtrTOTJ1Pd88RiD7
         5tgH5suUv58tkjtGItqmdfS+Kd2zbfLmux62onXlfq+3IHg06LR4kQK9BzoYbN24wO
         ZsWpvTFu2asW48gILUD9m2Us0GNGU2KhJezSTHWyectsR/cOqwg3yY6duD7mHUPVpo
         70Gy3i0HTg0CIc2Fl9YZTW0FR1fWKWJEuMdQ3ovpMc/vIGFifD18p1y0ZBFTdSnA1T
         l73WuEDtE/xEMJJR27NDk8/dQeeWGKbDFgwKIxPRJkMOWXffCCyCEedGv54RjVqpw/
         kw73DSmuURc9Q==
Date:   Thu, 6 Oct 2022 17:53:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     kernelci-results@groups.io, bot@kernelci.org,
        Russell King <linux@armlinux.org.uk>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Cc:     gtucker@collabora.com, linux-arm-kernel@lists.infradead.org,
        linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
Message-ID: <Yz8H+CIgq9A8WI6J@sirena.org.uk>
References: <633f0406.050a0220.9431e.d406@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mImmu1Ezzqjgfw3b"
Content-Disposition: inline
In-Reply-To: <633f0406.050a0220.9431e.d406@mx.google.com>
X-Cookie: Motorized vehicles only.
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--mImmu1Ezzqjgfw3b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 06, 2022 at 09:36:22AM -0700, KernelCI bot wrote:

The KernelCI bisection bot found a boot regression on qemu in today's
-next for a multi_v7_defconfig with additional debug options running on
virt-gicv3 which it identified as being triggered by 5750121ae738
("kbuild: list sub-directories in ./Kbuild") which does seem surprising
but the bot did test a revert so it seemed worth reporting.

In the failing boot we do see warnings triggered at:

WARNING: CPU: 0 PID: 0 at arch/arm/kernel/insn.c:48 __arm_gen_branch+0x80/0=
x88
WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2120 ftrace_bug+0x320/0x38
WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 smp_call_function_man=
y_cond+0xcec/0xf7c

before the boot hangs at:

<6>[   35.875754][    T1] Using buffer write method
<7>[   35.876786][    T1] erase region 0: offset=3D0x0,size=3D0x40000,block=
s=3D256
<5>[   35.877421][    T1] Concatenating MTD devices:
<5>[   35.877799][    T1] (0): \"0.flash\"
<5>[   35.878103][    T1] (1): \"0.flash\"
<5>[   35.878403][    T1] into device \"0.flash\"

I've left the full report including a tag for the bot and links to
things like full build logs below:

> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> next/master bisection: baseline.login on qemu_arm-virt-gicv3
>=20
> Summary:
>   Start:      4d80748d16c8 Add linux-next specific files for 20221004
>   Plain log:  https://storage.kernelci.org/next/master/next-20221004/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
txt
>   HTML log:   https://storage.kernelci.org/next/master/next-20221004/arm/=
multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.=
html
>   Result:     5750121ae738 kbuild: list sub-directories in ./Kbuild
>=20
> Checks:
>   revert:     FAIL
>   verify:     PASS
>=20
> Parameters:
>   Tree:       next
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git
>   Branch:     master
>   Target:     qemu_arm-virt-gicv3
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-10
>   Config:     multi_v7_defconfig+debug
>   Test case:  baseline.login
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit 5750121ae7382ebac8d47ce6d68012d6cd1d7926
> Author: Masahiro Yamada <masahiroy@kernel.org>
> Date:   Sun Sep 25 03:19:10 2022 +0900
>=20
>     kbuild: list sub-directories in ./Kbuild
>    =20
>     Use the ordinary obj-y syntax to list subdirectories.
>    =20
>     Note1:
>     Previously, the link order of lib-y depended on CONFIG_MODULES; lib-y
>     was linked before drivers-y when CONFIG_MODULES=3Dy, otherwise after
>     drivers-y. This was a bug of commit 7273ad2b08f8 ("kbuild: link lib-y
>     objects to vmlinux forcibly when CONFIG_MODULES=3Dy"), but it was not=
 a
>     big deal after all. Now, all objects listed in lib-y are linked last,
>     irrespective of CONFIG_MODULES.
>    =20
>     Note2:
>     Finally, the single target build in arch/*/lib/ works correctly. Ther=
e was
>     a bug report about this. [1]
>    =20
>       $ make ARCH=3Darm arch/arm/lib/findbit.o
>         CALL    scripts/checksyscalls.sh
>         AS      arch/arm/lib/findbit.o
>    =20
>     [1]: https://lore.kernel.org/linux-kbuild/YvUQOwL6lD4%2F5%2FU6@shell.=
armlinux.org.uk/
>    =20
>     Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>     Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>     Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
>=20
> diff --git a/Kbuild b/Kbuild
> index 0b9e8a16a621..8a37584d1fd6 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -72,3 +72,27 @@ $(atomic-checks): $(obj)/.checked-%: include/linux/ato=
mic/%  FORCE
>  PHONY +=3D prepare
>  prepare: $(offsets-file) missing-syscalls $(atomic-checks)
>  	@:
> +
> +# Ordinary directory descending
> +# ----------------------------------------------------------------------=
-----
> +
> +obj-y			+=3D init/
> +obj-y			+=3D usr/
> +obj-y			+=3D arch/$(SRCARCH)/
> +obj-y			+=3D $(ARCH_CORE)
> +obj-y			+=3D kernel/
> +obj-y			+=3D certs/
> +obj-y			+=3D mm/
> +obj-y			+=3D fs/
> +obj-y			+=3D ipc/
> +obj-y			+=3D security/
> +obj-y			+=3D crypto/
> +obj-$(CONFIG_BLOCK)	+=3D block/
> +obj-$(CONFIG_IO_URING)	+=3D io_uring/
> +obj-y			+=3D $(ARCH_LIB)
> +obj-y			+=3D drivers/
> +obj-y			+=3D sound/
> +obj-$(CONFIG_SAMPLES)	+=3D samples/
> +obj-$(CONFIG_NET)	+=3D net/
> +obj-y			+=3D virt/
> +obj-y			+=3D $(ARCH_DRIVERS)
> diff --git a/Makefile b/Makefile
> index 09c9d9a005bd..317e9f09440c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -676,11 +676,8 @@ endif
> =20
>  ifeq ($(KBUILD_EXTMOD),)
>  # Objects we will link into vmlinux / subdirs we need to visit
> -core-y		:=3D init/ usr/ arch/$(SRCARCH)/
> -drivers-y	:=3D drivers/ sound/
> -drivers-$(CONFIG_SAMPLES) +=3D samples/
> -drivers-$(CONFIG_NET) +=3D net/
> -drivers-y	+=3D virt/
> +core-y		:=3D
> +drivers-y	:=3D
>  libs-y		:=3D lib/
>  endif # KBUILD_EXTMOD
> =20
> @@ -1099,31 +1096,24 @@ export MODORDER :=3D $(extmod_prefix)modules.order
>  export MODULES_NSDEPS :=3D $(extmod_prefix)modules.nsdeps
> =20
>  ifeq ($(KBUILD_EXTMOD),)
> -core-y			+=3D kernel/ certs/ mm/ fs/ ipc/ security/ crypto/
> -core-$(CONFIG_BLOCK)	+=3D block/
> -core-$(CONFIG_IO_URING)	+=3D io_uring/
> =20
> -vmlinux-dirs	:=3D $(patsubst %/,%,$(filter %/, \
> -		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
> -		     $(libs-y) $(libs-m)))
> -
> -build-dirs	:=3D $(vmlinux-dirs)
> -clean-dirs	:=3D $(sort $(vmlinux-dirs) Documentation . \
> +build-dir	:=3D .
> +clean-dirs	:=3D $(sort . Documentation \
>  		     $(patsubst %/,%,$(filter %/, $(core-) \
>  			$(drivers-) $(libs-))))
> =20
> -subdir-modorder :=3D $(addsuffix /modules.order, $(build-dirs))
> -
> +export ARCH_CORE	:=3D $(core-y)
> +export ARCH_LIB		:=3D $(filter %/, $(libs-y))
> +export ARCH_DRIVERS	:=3D $(drivers-y) $(drivers-m)
>  # Externally visible symbols (used by link-vmlinux.sh)
> -KBUILD_VMLINUX_OBJS :=3D $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
> -KBUILD_VMLINUX_OBJS +=3D $(addsuffix built-in.a, $(filter %/, $(libs-y)))
> +
> +KBUILD_VMLINUX_OBJS :=3D $(head-y) ./built-in.a
>  ifdef CONFIG_MODULES
>  KBUILD_VMLINUX_OBJS +=3D $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
>  KBUILD_VMLINUX_LIBS :=3D $(filter-out %/, $(libs-y))
>  else
>  KBUILD_VMLINUX_LIBS :=3D $(patsubst %/,%/lib.a, $(libs-y))
>  endif
> -KBUILD_VMLINUX_OBJS +=3D $(patsubst %/,%/built-in.a, $(drivers-y))
> =20
>  export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
>  export KBUILD_LDS          :=3D arch/$(SRCARCH)/kernel/vmlinux.lds
> @@ -1138,7 +1128,7 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
>  # (this can be evaluated only once include/config/auto.conf has been inc=
luded)
>  KBUILD_MODULES :=3D 1
> =20
> -autoksyms_recursive: descend modules.order
> +autoksyms_recursive: $(build-dir) modules.order
>  	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
>  	  "$(MAKE) -f $(srctree)/Makefile autoksyms_recursive"
>  endif
> @@ -1166,7 +1156,7 @@ targets :=3D vmlinux
> =20
>  # The actual objects are generated when descending,
>  # make sure no implicit rule kicks in
> -$(sort $(vmlinux-deps) $(subdir-modorder)): descend ;
> +$(sort $(vmlinux-deps)): . ;
> =20
>  filechk_kernel.release =3D \
>  	echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalver=
sion $(srctree))"
> @@ -1437,13 +1427,6 @@ endif
> =20
>  modules: $(if $(KBUILD_BUILTIN),vmlinux) modules_prepare
> =20
> -cmd_modules_order =3D cat $(real-prereqs) > $@
> -
> -modules.order: $(subdir-modorder) FORCE
> -	$(call if_changed,modules_order)
> -
> -targets +=3D modules.order
> -
>  # Target to prepare building external modules
>  modules_prepare: prepare
>  	$(Q)$(MAKE) $(build)=3Dscripts scripts/module.lds
> @@ -1714,9 +1697,7 @@ else # KBUILD_EXTMOD
>  KBUILD_BUILTIN :=3D
>  KBUILD_MODULES :=3D 1
> =20
> -build-dirs :=3D $(KBUILD_EXTMOD)
> -$(MODORDER): descend
> -	@:
> +build-dir :=3D $(KBUILD_EXTMOD)
> =20
>  compile_commands.json: $(extmod_prefix)compile_commands.json
>  PHONY +=3D compile_commands.json
> @@ -1754,6 +1735,9 @@ PHONY +=3D modules modules_install modules_prepare
> =20
>  ifdef CONFIG_MODULES
> =20
> +$(MODORDER): $(build-dir)
> +	@:
> +
>  modules: modules_check
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> =20
> @@ -1807,7 +1791,7 @@ single-no-ko :=3D $(filter-out $(single-ko), $(MAKE=
CMDGOALS)) \
> =20
>  $(single-ko): single_modpost
>  	@:
> -$(single-no-ko): descend
> +$(single-no-ko): $(build-dir)
>  	@:
> =20
>  # Remove MODORDER when done because it is not the real one.
> @@ -1817,24 +1801,17 @@ single_modpost: $(single-no-ko) modules_prepare
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>  	$(Q)rm -f $(MODORDER)
> =20
> -single-goals :=3D $(addprefix $(extmod_prefix), $(single-no-ko))
> -
> -# trim unrelated directories
> -build-dirs :=3D $(foreach d, $(build-dirs), \
> -			$(if $(filter $d/%, $(single-goals)), $d))
> +single-goals :=3D $(addprefix $(build-dir)/, $(single-no-ko))
> =20
>  endif
> =20
> -# Handle descending into subdirectories listed in $(build-dirs)
>  # Preset locale variables to speed up the build process. Limit locale
>  # tweaks to this spot to avoid wrong language settings when running
>  # make menuconfig etc.
>  # Error messages still appears in the original language
> -PHONY +=3D descend $(build-dirs)
> -descend: $(build-dirs)
> -$(build-dirs): prepare
> -	$(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1 need-modorder=3D1 \
> -	$(filter $@/%, $(single-goals))
> +PHONY +=3D $(build-dir)
> +$(build-dir): prepare
> +	$(Q)$(MAKE) $(build)=3D$@ need-builtin=3D1 need-modorder=3D1 $(single-g=
oals)
> =20
>  clean-dirs :=3D $(addprefix _clean_, $(clean-dirs))
>  PHONY +=3D $(clean-dirs) clean
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 52811b2783de..b7e650bc70f2 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -89,6 +89,7 @@ always-y			+=3D $(dtb-y)
> =20
>  # Add subdir path
> =20
> +ifneq ($(obj),.)
>  extra-y		:=3D $(addprefix $(obj)/,$(extra-y))
>  always-y	:=3D $(addprefix $(obj)/,$(always-y))
>  targets		:=3D $(addprefix $(obj)/,$(targets))
> @@ -100,6 +101,7 @@ multi-obj-m	:=3D $(addprefix $(obj)/, $(multi-obj-m))
>  multi-dtb-y	:=3D $(addprefix $(obj)/, $(multi-dtb-y))
>  real-dtb-y	:=3D $(addprefix $(obj)/, $(real-dtb-y))
>  subdir-ym	:=3D $(addprefix $(obj)/,$(subdir-ym))
> +endif
> =20
>  # Finds the multi-part object the current object will be linked into.
>  # If the object belongs to two or more multi-part objects, list them all.
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [46a275a5616736cbe70012311bc9003817e96b51] Merge branch 'net-marv=
ell-prestera-add-nexthop-routes-offloading'
> git bisect good 46a275a5616736cbe70012311bc9003817e96b51
> # bad: [4d80748d16c82a9c2c4ea5feea96e476de3cd876] Add linux-next specific=
 files for 20221004
> git bisect bad 4d80748d16c82a9c2c4ea5feea96e476de3cd876
> # bad: [b9e99512aede9973504f01b5c27853be4927bde0] Merge branch 'master' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> git bisect bad b9e99512aede9973504f01b5c27853be4927bde0
> # bad: [89174722727353c961913b70b37bc942ee5c0251] Merge branch 'for-next'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
> git bisect bad 89174722727353c961913b70b37bc942ee5c0251
> # bad: [58b61aabb9a5fafd45d09db1fae511d0304af79e] Merge branch 'for-next'=
 of git://git.armlinux.org.uk/~rmk/linux-arm.git
> git bisect bad 58b61aabb9a5fafd45d09db1fae511d0304af79e
> # good: [86a4d29e75540e20f991e72f17aa51d0e775a397] Merge tag 'asoc-v6.1' =
of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-l=
inus
> git bisect good 86a4d29e75540e20f991e72f17aa51d0e775a397
> # good: [112f485b2e65f8680fcecc660aabd73ab1af946d] Merge branch 'fixes' o=
f https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
> git bisect good 112f485b2e65f8680fcecc660aabd73ab1af946d
> # good: [f9fe5fdbcdba66e96cddaf83877322c7a18caf76] Merge branch 'fixes' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> git bisect good f9fe5fdbcdba66e96cddaf83877322c7a18caf76
> # good: [62e64c9d2fd12839c02f1b3e8b873e7cb34e8720] perf test: Add basic c=
ore_wide expression test
> git bisect good 62e64c9d2fd12839c02f1b3e8b873e7cb34e8720
> # bad: [cff6fdf0b2d45f563e2c25f243c624a2723d5f58] ia64: simplify esi obje=
ct addition in Makefile
> git bisect bad cff6fdf0b2d45f563e2c25f243c624a2723d5f58
> # good: [a8d5692659358eba46d3b2f7d96da7c390f41f71] scripts: remove unused=
 argument 'type'
> git bisect good a8d5692659358eba46d3b2f7d96da7c390f41f71
> # bad: [ce697ccee1a8661da4e23fbe5f3d45d8d6922c20] kbuild: remove head-y s=
yntax
> git bisect bad ce697ccee1a8661da4e23fbe5f3d45d8d6922c20
> # bad: [9c5a0ac3c36917c4258f734bda98be02ca36b992] kbuild: move vmlinux.o =
rule to the top Makefile
> git bisect bad 9c5a0ac3c36917c4258f734bda98be02ca36b992
> # good: [88b61e3bff93f99712718db785b4aa0c1165f35c] Makefile.compiler: rep=
lace cc-ifversion with compiler-specific macros
> git bisect good 88b61e3bff93f99712718db785b4aa0c1165f35c
> # bad: [26ef40de5cbb24728a34a319e8d42cdec99f186c] kbuild: move .vmlinux.o=
bjs rule to Makefile.modpost
> git bisect bad 26ef40de5cbb24728a34a319e8d42cdec99f186c
> # bad: [5750121ae7382ebac8d47ce6d68012d6cd1d7926] kbuild: list sub-direct=
ories in ./Kbuild
> git bisect bad 5750121ae7382ebac8d47ce6d68012d6cd1d7926
> # first bad commit: [5750121ae7382ebac8d47ce6d68012d6cd1d7926] kbuild: li=
st sub-directories in ./Kbuild
> -------------------------------------------------------------------------=
------
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#32406): https://groups.io/g/kernelci-results/message/=
32406
> Mute This Topic: https://groups.io/mt/94161699/1131744
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.o=
rg]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20

--mImmu1Ezzqjgfw3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM/B/cACgkQJNaLcl1U
h9A1/gf9EI9ss9u+f8I2sslkey35zRe4OgcTsF4hvf5N2YjkTlHC2Wv6hGUuLVAd
hoUpFDlI87SnqzzNjPwPKVD//MglL0MaHH685NiPryxEDql+KFtqf5jcrkYfEk3X
m11wT47MW5snc3stCY4Q7lUsnQtLQr6FcxO0FZJVW4ec3on55+cRkbzmpBJHNTlu
mxdTrktplFozCUUC6CpGf/k3171KQdJRkADaQlpJp+wQJ/naHy69i2fswRJ9wPKd
J6LO0Waj01O18lsNgx8e5cgFDC9yfSwOVIAfz5fzaDjpnAFNNmMhKF/NTmHSQCPU
LP2LQBcQBWgpcogZVaQnF4CAwXjM6w==
=oS5m
-----END PGP SIGNATURE-----

--mImmu1Ezzqjgfw3b--
