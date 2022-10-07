Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EE675F73D4
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Oct 2022 07:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbiJGFM0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Oct 2022 01:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiJGFMZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Oct 2022 01:12:25 -0400
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 669A5C459A
        for <linux-kbuild@vger.kernel.org>; Thu,  6 Oct 2022 22:12:23 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 2975C56J005674
        for <linux-kbuild@vger.kernel.org>; Fri, 7 Oct 2022 14:12:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2975C56J005674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665119526;
        bh=T67+4p+6LHEbXh6nwFk/IDXU7RO70q4hH9+EjsQC1bU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rfbfujd3ewmbdrroxgKvemfYfxAE+jljqmSya0se/ePdzgYJ6CEg+HbvN+G5Y8XTi
         6Ad565D0FA8QYAsXpbtOKsDRa0zfN2tkWwOkeg7k95LJZFg6NisaDnQv8/sKUWA3gZ
         86II7KSpsU0jI5S+Ft3WQWZa8JWynL/sP2nqe5WAckLT/VX2YwspU5TfHNYV5sQNCu
         I1A8ZUw020bH7veEo2x1QtzWS72WSNlVWr8arsknXSNhr6jhL1LNvmyLCqS4GAK+t6
         tAYbopC2NVzvJONGn3L0oI2T9EPGS3mi/jBNszfVAMmcLRCD+g32IbdVijYDbIBfui
         anOPDD3Pq+YtQ==
X-Nifty-SrcIP: [209.85.160.44]
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1322d768ba7so4520395fac.5
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Oct 2022 22:12:06 -0700 (PDT)
X-Gm-Message-State: ACrzQf06tYHgVD8Rq9J5opNcBgnl5WhS+hIkK6yFVC19vyO27RrrzOqS
        mSbUOuuIV8wjmEG6BCDodVnY5nnDgMWxMmCmrxg=
X-Google-Smtp-Source: AMsMyM6x/sBhUG0q5s713nf0I1PGqEPe6GwPFX+INuLsrZnhdADgn8LLTRcbQcIq+rlXWL4Tg/NFYWaaLuyo3qICb4U=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr1622523oab.287.1665119524882; Thu, 06
 Oct 2022 22:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <633f0406.050a0220.9431e.d406@mx.google.com> <Yz8H+CIgq9A8WI6J@sirena.org.uk>
In-Reply-To: <Yz8H+CIgq9A8WI6J@sirena.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 7 Oct 2022 14:11:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
Message-ID: <CAK7LNART_52inEq0-wXiR=70D7-9TGaCa_f6bpA+ud3Mra3FOQ@mail.gmail.com>
Subject: Re: next/master bisection: baseline.login on qemu_arm-virt-gicv3
To:     Mark Brown <broonie@kernel.org>
Cc:     kernelci-results@groups.io, bot@kernelci.org,
        Russell King <linux@armlinux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>, gtucker@collabora.com,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 7, 2022 at 1:53 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 06, 2022 at 09:36:22AM -0700, KernelCI bot wrote:
>
> The KernelCI bisection bot found a boot regression on qemu in today's
> -next for a multi_v7_defconfig with additional debug options running on
> virt-gicv3 which it identified as being triggered by 5750121ae738
> ("kbuild: list sub-directories in ./Kbuild") which does seem surprising
> but the bot did test a revert so it seemed worth reporting



Please tell me the command line arguments to qemu-system-arm.
Especially, how to turn on gicv3.


Thanks.
Masahiro Yamada










.
>
> In the failing boot we do see warnings triggered at:
>
> WARNING: CPU: 0 PID: 0 at arch/arm/kernel/insn.c:48 __arm_gen_branch+0x80/0x88
> WARNING: CPU: 0 PID: 0 at kernel/trace/ftrace.c:2120 ftrace_bug+0x320/0x38
> WARNING: CPU: 0 PID: 1 at include/linux/cpumask.h:110 smp_call_function_many_cond+0xcec/0xf7c
>
> before the boot hangs at:
>
> <6>[   35.875754][    T1] Using buffer write method
> <7>[   35.876786][    T1] erase region 0: offset=0x0,size=0x40000,blocks=256
> <5>[   35.877421][    T1] Concatenating MTD devices:
> <5>[   35.877799][    T1] (0): \"0.flash\"
> <5>[   35.878103][    T1] (1): \"0.flash\"
> <5>[   35.878403][    T1] into device \"0.flash\"
>
> I've left the full report including a tag for the bot and links to
> things like full build logs below:
>
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> > * This automated bisection report was sent to you on the basis  *
> > * that you may be involved with the breaking commit it has      *
> > * found.  No manual investigation has been done to verify it,   *
> > * and the root cause of the problem may be somewhere else.      *
> > *                                                               *
> > * If you do send a fix, please include this trailer:            *
> > *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> > *                                                               *
> > * Hope this helps!                                              *
> > * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> >
> > next/master bisection: baseline.login on qemu_arm-virt-gicv3
> >
> > Summary:
> >   Start:      4d80748d16c8 Add linux-next specific files for 20221004
> >   Plain log:  https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.txt
> >   HTML log:   https://storage.kernelci.org/next/master/next-20221004/arm/multi_v7_defconfig+debug/gcc-10/lab-collabora/baseline-qemu_arm-virt-gicv3.html
> >   Result:     5750121ae738 kbuild: list sub-directories in ./Kbuild
> >
> > Checks:
> >   revert:     FAIL
> >   verify:     PASS
> >
> > Parameters:
> >   Tree:       next
> >   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >   Branch:     master
> >   Target:     qemu_arm-virt-gicv3
> >   CPU arch:   arm
> >   Lab:        lab-collabora
> >   Compiler:   gcc-10
> >   Config:     multi_v7_defconfig+debug
> >   Test case:  baseline.login
> >
> > Breaking commit found:
> >
> > -------------------------------------------------------------------------------
> > commit 5750121ae7382ebac8d47ce6d68012d6cd1d7926
> > Author: Masahiro Yamada <masahiroy@kernel.org>
> > Date:   Sun Sep 25 03:19:10 2022 +0900
> >
> >     kbuild: list sub-directories in ./Kbuild
> >
> >     Use the ordinary obj-y syntax to list subdirectories.
> >
> >     Note1:
> >     Previously, the link order of lib-y depended on CONFIG_MODULES; lib-y
> >     was linked before drivers-y when CONFIG_MODULES=y, otherwise after
> >     drivers-y. This was a bug of commit 7273ad2b08f8 ("kbuild: link lib-y
> >     objects to vmlinux forcibly when CONFIG_MODULES=y"), but it was not a
> >     big deal after all. Now, all objects listed in lib-y are linked last,
> >     irrespective of CONFIG_MODULES.
> >
> >     Note2:
> >     Finally, the single target build in arch/*/lib/ works correctly. There was
> >     a bug report about this. [1]
> >
> >       $ make ARCH=arm arch/arm/lib/findbit.o
> >         CALL    scripts/checksyscalls.sh
> >         AS      arch/arm/lib/findbit.o
> >
> >     [1]: https://lore.kernel.org/linux-kbuild/YvUQOwL6lD4%2F5%2FU6@shell.armlinux.org.uk/
> >
> >     Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >     Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> >     Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
> >
> > diff --git a/Kbuild b/Kbuild
> > index 0b9e8a16a621..8a37584d1fd6 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -72,3 +72,27 @@ $(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
> >  PHONY += prepare
> >  prepare: $(offsets-file) missing-syscalls $(atomic-checks)
> >       @:
> > +
> > +# Ordinary directory descending
> > +# ---------------------------------------------------------------------------
> > +
> > +obj-y                        += init/
> > +obj-y                        += usr/
> > +obj-y                        += arch/$(SRCARCH)/
> > +obj-y                        += $(ARCH_CORE)
> > +obj-y                        += kernel/
> > +obj-y                        += certs/
> > +obj-y                        += mm/
> > +obj-y                        += fs/
> > +obj-y                        += ipc/
> > +obj-y                        += security/
> > +obj-y                        += crypto/
> > +obj-$(CONFIG_BLOCK)  += block/
> > +obj-$(CONFIG_IO_URING)       += io_uring/
> > +obj-y                        += $(ARCH_LIB)
> > +obj-y                        += drivers/
> > +obj-y                        += sound/
> > +obj-$(CONFIG_SAMPLES)        += samples/
> > +obj-$(CONFIG_NET)    += net/
> > +obj-y                        += virt/
> > +obj-y                        += $(ARCH_DRIVERS)
> > diff --git a/Makefile b/Makefile
> > index 09c9d9a005bd..317e9f09440c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -676,11 +676,8 @@ endif
> >
> >  ifeq ($(KBUILD_EXTMOD),)
> >  # Objects we will link into vmlinux / subdirs we need to visit
> > -core-y               := init/ usr/ arch/$(SRCARCH)/
> > -drivers-y    := drivers/ sound/
> > -drivers-$(CONFIG_SAMPLES) += samples/
> > -drivers-$(CONFIG_NET) += net/
> > -drivers-y    += virt/
> > +core-y               :=
> > +drivers-y    :=
> >  libs-y               := lib/
> >  endif # KBUILD_EXTMOD
> >
> > @@ -1099,31 +1096,24 @@ export MODORDER := $(extmod_prefix)modules.order
> >  export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
> >
> >  ifeq ($(KBUILD_EXTMOD),)
> > -core-y                       += kernel/ certs/ mm/ fs/ ipc/ security/ crypto/
> > -core-$(CONFIG_BLOCK) += block/
> > -core-$(CONFIG_IO_URING)      += io_uring/
> >
> > -vmlinux-dirs := $(patsubst %/,%,$(filter %/, \
> > -                  $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
> > -                  $(libs-y) $(libs-m)))
> > -
> > -build-dirs   := $(vmlinux-dirs)
> > -clean-dirs   := $(sort $(vmlinux-dirs) Documentation . \
> > +build-dir    := .
> > +clean-dirs   := $(sort . Documentation \
> >                    $(patsubst %/,%,$(filter %/, $(core-) \
> >                       $(drivers-) $(libs-))))
> >
> > -subdir-modorder := $(addsuffix /modules.order, $(build-dirs))
> > -
> > +export ARCH_CORE     := $(core-y)
> > +export ARCH_LIB              := $(filter %/, $(libs-y))
> > +export ARCH_DRIVERS  := $(drivers-y) $(drivers-m)
> >  # Externally visible symbols (used by link-vmlinux.sh)
> > -KBUILD_VMLINUX_OBJS := $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
> > -KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
> > +
> > +KBUILD_VMLINUX_OBJS := $(head-y) ./built-in.a
> >  ifdef CONFIG_MODULES
> >  KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
> >  KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
> >  else
> >  KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
> >  endif
> > -KBUILD_VMLINUX_OBJS += $(patsubst %/,%/built-in.a, $(drivers-y))
> >
> >  export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
> >  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
> > @@ -1138,7 +1128,7 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
> >  # (this can be evaluated only once include/config/auto.conf has been included)
> >  KBUILD_MODULES := 1
> >
> > -autoksyms_recursive: descend modules.order
> > +autoksyms_recursive: $(build-dir) modules.order
> >       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
> >         "$(MAKE) -f $(srctree)/Makefile autoksyms_recursive"
> >  endif
> > @@ -1166,7 +1156,7 @@ targets := vmlinux
> >
> >  # The actual objects are generated when descending,
> >  # make sure no implicit rule kicks in
> > -$(sort $(vmlinux-deps) $(subdir-modorder)): descend ;
> > +$(sort $(vmlinux-deps)): . ;
> >
> >  filechk_kernel.release = \
> >       echo "$(KERNELVERSION)$$($(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree))"
> > @@ -1437,13 +1427,6 @@ endif
> >
> >  modules: $(if $(KBUILD_BUILTIN),vmlinux) modules_prepare
> >
> > -cmd_modules_order = cat $(real-prereqs) > $@
> > -
> > -modules.order: $(subdir-modorder) FORCE
> > -     $(call if_changed,modules_order)
> > -
> > -targets += modules.order
> > -
> >  # Target to prepare building external modules
> >  modules_prepare: prepare
> >       $(Q)$(MAKE) $(build)=scripts scripts/module.lds
> > @@ -1714,9 +1697,7 @@ else # KBUILD_EXTMOD
> >  KBUILD_BUILTIN :=
> >  KBUILD_MODULES := 1
> >
> > -build-dirs := $(KBUILD_EXTMOD)
> > -$(MODORDER): descend
> > -     @:
> > +build-dir := $(KBUILD_EXTMOD)
> >
> >  compile_commands.json: $(extmod_prefix)compile_commands.json
> >  PHONY += compile_commands.json
> > @@ -1754,6 +1735,9 @@ PHONY += modules modules_install modules_prepare
> >
> >  ifdef CONFIG_MODULES
> >
> > +$(MODORDER): $(build-dir)
> > +     @:
> > +
> >  modules: modules_check
> >       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> >
> > @@ -1807,7 +1791,7 @@ single-no-ko := $(filter-out $(single-ko), $(MAKECMDGOALS)) \
> >
> >  $(single-ko): single_modpost
> >       @:
> > -$(single-no-ko): descend
> > +$(single-no-ko): $(build-dir)
> >       @:
> >
> >  # Remove MODORDER when done because it is not the real one.
> > @@ -1817,24 +1801,17 @@ single_modpost: $(single-no-ko) modules_prepare
> >       $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
> >       $(Q)rm -f $(MODORDER)
> >
> > -single-goals := $(addprefix $(extmod_prefix), $(single-no-ko))
> > -
> > -# trim unrelated directories
> > -build-dirs := $(foreach d, $(build-dirs), \
> > -                     $(if $(filter $d/%, $(single-goals)), $d))
> > +single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
> >
> >  endif
> >
> > -# Handle descending into subdirectories listed in $(build-dirs)
> >  # Preset locale variables to speed up the build process. Limit locale
> >  # tweaks to this spot to avoid wrong language settings when running
> >  # make menuconfig etc.
> >  # Error messages still appears in the original language
> > -PHONY += descend $(build-dirs)
> > -descend: $(build-dirs)
> > -$(build-dirs): prepare
> > -     $(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 \
> > -     $(filter $@/%, $(single-goals))
> > +PHONY += $(build-dir)
> > +$(build-dir): prepare
> > +     $(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1 $(single-goals)
> >
> >  clean-dirs := $(addprefix _clean_, $(clean-dirs))
> >  PHONY += $(clean-dirs) clean
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 52811b2783de..b7e650bc70f2 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -89,6 +89,7 @@ always-y                    += $(dtb-y)
> >
> >  # Add subdir path
> >
> > +ifneq ($(obj),.)
> >  extra-y              := $(addprefix $(obj)/,$(extra-y))
> >  always-y     := $(addprefix $(obj)/,$(always-y))
> >  targets              := $(addprefix $(obj)/,$(targets))
> > @@ -100,6 +101,7 @@ multi-obj-m       := $(addprefix $(obj)/, $(multi-obj-m))
> >  multi-dtb-y  := $(addprefix $(obj)/, $(multi-dtb-y))
> >  real-dtb-y   := $(addprefix $(obj)/, $(real-dtb-y))
> >  subdir-ym    := $(addprefix $(obj)/,$(subdir-ym))
> > +endif
> >
> >  # Finds the multi-part object the current object will be linked into.
> >  # If the object belongs to two or more multi-part objects, list them all.
> > -------------------------------------------------------------------------------
> >
> >
> > Git bisection log:
> >
> > -------------------------------------------------------------------------------
> > git bisect start
> > # good: [46a275a5616736cbe70012311bc9003817e96b51] Merge branch 'net-marvell-prestera-add-nexthop-routes-offloading'
> > git bisect good 46a275a5616736cbe70012311bc9003817e96b51
> > # bad: [4d80748d16c82a9c2c4ea5feea96e476de3cd876] Add linux-next specific files for 20221004
> > git bisect bad 4d80748d16c82a9c2c4ea5feea96e476de3cd876
> > # bad: [b9e99512aede9973504f01b5c27853be4927bde0] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> > git bisect bad b9e99512aede9973504f01b5c27853be4927bde0
> > # bad: [89174722727353c961913b70b37bc942ee5c0251] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
> > git bisect bad 89174722727353c961913b70b37bc942ee5c0251
> > # bad: [58b61aabb9a5fafd45d09db1fae511d0304af79e] Merge branch 'for-next' of git://git.armlinux.org.uk/~rmk/linux-arm.git
> > git bisect bad 58b61aabb9a5fafd45d09db1fae511d0304af79e
> > # good: [86a4d29e75540e20f991e72f17aa51d0e775a397] Merge tag 'asoc-v6.1' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-linus
> > git bisect good 86a4d29e75540e20f991e72f17aa51d0e775a397
> > # good: [112f485b2e65f8680fcecc660aabd73ab1af946d] Merge branch 'fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git
> > git bisect good 112f485b2e65f8680fcecc660aabd73ab1af946d
> > # good: [f9fe5fdbcdba66e96cddaf83877322c7a18caf76] Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> > git bisect good f9fe5fdbcdba66e96cddaf83877322c7a18caf76
> > # good: [62e64c9d2fd12839c02f1b3e8b873e7cb34e8720] perf test: Add basic core_wide expression test
> > git bisect good 62e64c9d2fd12839c02f1b3e8b873e7cb34e8720
> > # bad: [cff6fdf0b2d45f563e2c25f243c624a2723d5f58] ia64: simplify esi object addition in Makefile
> > git bisect bad cff6fdf0b2d45f563e2c25f243c624a2723d5f58
> > # good: [a8d5692659358eba46d3b2f7d96da7c390f41f71] scripts: remove unused argument 'type'
> > git bisect good a8d5692659358eba46d3b2f7d96da7c390f41f71
> > # bad: [ce697ccee1a8661da4e23fbe5f3d45d8d6922c20] kbuild: remove head-y syntax
> > git bisect bad ce697ccee1a8661da4e23fbe5f3d45d8d6922c20
> > # bad: [9c5a0ac3c36917c4258f734bda98be02ca36b992] kbuild: move vmlinux.o rule to the top Makefile
> > git bisect bad 9c5a0ac3c36917c4258f734bda98be02ca36b992
> > # good: [88b61e3bff93f99712718db785b4aa0c1165f35c] Makefile.compiler: replace cc-ifversion with compiler-specific macros
> > git bisect good 88b61e3bff93f99712718db785b4aa0c1165f35c
> > # bad: [26ef40de5cbb24728a34a319e8d42cdec99f186c] kbuild: move .vmlinux.objs rule to Makefile.modpost
> > git bisect bad 26ef40de5cbb24728a34a319e8d42cdec99f186c
> > # bad: [5750121ae7382ebac8d47ce6d68012d6cd1d7926] kbuild: list sub-directories in ./Kbuild
> > git bisect bad 5750121ae7382ebac8d47ce6d68012d6cd1d7926
> > # first bad commit: [5750121ae7382ebac8d47ce6d68012d6cd1d7926] kbuild: list sub-directories in ./Kbuild
> > -------------------------------------------------------------------------------
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Groups.io Links: You receive all messages sent to this group.
> > View/Reply Online (#32406): https://groups.io/g/kernelci-results/message/32406
> > Mute This Topic: https://groups.io/mt/94161699/1131744
> > Group Owner: kernelci-results+owner@groups.io
> > Unsubscribe: https://groups.io/g/kernelci-results/unsub [broonie@kernel.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >



-- 
Best Regards
Masahiro Yamada
