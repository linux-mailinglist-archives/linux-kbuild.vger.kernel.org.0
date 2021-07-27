Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6173D72A7
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 12:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236177AbhG0KLA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 06:11:00 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39099 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236166AbhG0KK7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 06:10:59 -0400
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 16RAAdWk005555;
        Tue, 27 Jul 2021 19:10:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 16RAAdWk005555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627380640;
        bh=OSYQZk+3tJqowrXAIcMUHdaXitgKhgWMyw4+pumNADI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JwccvrN6791bsuLm6IT819O8m1Ja5hqrf/NCUfgareLYhTHEC3JZnjKwKuorYoOk4
         hKSFoicTPL87UEZwnI49uxEdGXU5zsrE8ZShohSlYhq4zYy1mCFgvTlPc5saZxJwY4
         byMgKdIDBljQjrb7eAILPrcfZU+IUdy964CjhXCc1P+rYhvM8bQ/cmwkJAls1NSaya
         VS47/vj3mgpkMr3w7MN3X2Lw2benCLiv/29IwNFlMI347wzJShV2LtjbYk8mkWnHy9
         tVk5Q8c7ad7V2FwKDVmtpW57uUpPiNQXjjdrLIUi8ryiFSJd+tYHF3R1VJGq4gB05Q
         aVNGA40ZTRhkg==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so4156543pjh.3;
        Tue, 27 Jul 2021 03:10:40 -0700 (PDT)
X-Gm-Message-State: AOAM533/QxQwvdISLpiAZ1Vb+wURMcGZxngV46ChsYwEqSS17PtfNSnl
        utyD9gc3ur+g+GVy0nmObn6ajl8JmgSHAUVLBZs=
X-Google-Smtp-Source: ABdhPJyHNRA+cYqyNT0oWQ3CghIulkbYxWpq8AIslBPSsi5NIFwTGI8c4cTLztvG8uC6lLBVJw4ejKo3f25MVDhrxAQ=
X-Received: by 2002:a65:498a:: with SMTP id r10mr22949005pgs.7.1627380639465;
 Tue, 27 Jul 2021 03:10:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
 <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com> <87r1fkizxl.fsf@disp2133>
In-Reply-To: <87r1fkizxl.fsf@disp2133>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 27 Jul 2021 19:10:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS8Fz_kcwqzJD834QrSuWkkorHm4OZoGUhYsbKvJV=fJQ@mail.gmail.com>
Message-ID: <CAK7LNAS8Fz_kcwqzJD834QrSuWkkorHm4OZoGUhYsbKvJV=fJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 27, 2021 at 5:27 AM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >>
> >> On Tue, Jul 20, 2021 at 7:43 PM Linus Torvalds
> >> <torvalds@linux-foundation.org> wrote:
> >> > On Tue, Jul 20, 2021 at 1:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >> >
> >> > We do most of the other heavy lifting in this area in Kconfig anyway,
> >> > why not add that compiler choice?
> >> >
> >> > Obviously it would be gated by the tests to see which compilers are
> >> > _installed_ (and that they are valid versions), so that it doesn't ask
> >> > stupid things ("do you want gcc or clang" when only one of them is
> >> > installed and/or viable).
> >>
> >> I don't see a good way of making Kconfig options both select the
> >> compiler and defining variables based on the compiler, since that
> >> would mean teaching Kconfig about re-evaluating all compiler
> >> dependent settings whenever the first option changes.
> >>
> >> I do have another idea that I think would work though.
> >>
> >> > Hmm? So then any "LLVM=1" thing would be about the "make config"
> >> > stage, not the actual build stage.
> >> >
> >> > (It has annoyed me for years that if you want to cross-compile, you
> >> > first have to do "make ARCH=xyz config" and then remember to do "make
> >> > ARCH=xyz" for the build too, but I cross-compile so seldom that I've
> >> > never really cared).
> >>
> >> The best thing that I have come up with is a pre-configure step, where
> >> an object tree gets seeded with a makefile fragment that gets included
> >> for any 'make' invocation. This would set 'ARCH=', 'CROSS_COMPILE',
> >> 'CC=' and possibly any other option that gets passed to 'make' as
> >> a variable and has to exist before calling 'make *config'.
> >
> >
> > There is no need to add a hook to include such makefile fragment(s).
> >
> > Quite opposite, you can put your Makefile (in a different filename)
> > that includes the top Makefile.
> >
> >
> > I think this is what people are already doing:
> >
> >
> > GNU Make looks for 'GNUmakefile', 'makefile', and 'Makefile'
> > in this order.
> >
> >
> > So, you can put 'GNUmakefile' with your favorite setups.
> >
> >
> > $ cat GNUmakefile
> > ARCH=arm64
> > CROSS_COMPILE=aarch64-linux-gnu-
> > CC=clang
> > include Makefile
>
> Very weird.
>
> I just tested this and it does not work.
> I did this:
>
> $ cat GNUmakefile
> ARCH = alpha
> CROSS_COMPILE = $(arch-prefix alpha)
> include Makefile
>
> In one of my build directories and the main makefile simply does not see
> the value of ARCH or CROSS_COMPILE I set.  I have confirmed that my
> GNUmakefile is being read, because everything breaks if I remove the
> include line.
>
> Does anyone have any ideas?
>
> Something so we don't have to specify all of these variables on the make
> command line would be nice.
>
> Eric


Worked for me.

Could you tell me the exact steps you did?


This is my case:

My kernel source tree is located at $HOME/ref/linux
alpha tool chains are located at $HOME/tools/alpha-10.1.0/bin



I tried a simple GNUmakefile with 3 lines.

You can see 'make' is building the alpha kernel


Please see below:




masahiro@grover:~/ref/linux$ cat GNUmakefile
ARCH = alpha
CROSS_COMPILE = $(HOME)/tools/alpha-10.1.0/bin/alpha-linux-
include Makefile
masahiro@grover:~/ref/linux$ make mrproper
  CLEAN   arch/alpha/kernel
  CLEAN   certs
  CLEAN   drivers/tty/vt
  CLEAN   drivers/video/logo
  CLEAN   kernel
  CLEAN   lib
  CLEAN   security/selinux
  CLEAN   usr/include
  CLEAN   usr
  CLEAN   vmlinux.symvers modules-only.symvers modules.builtin
modules.builtin.modinfo
  CLEAN   scripts/basic
  CLEAN   scripts/dtc
  CLEAN   scripts/genksyms
  CLEAN   scripts/kconfig
  CLEAN   scripts/mod
  CLEAN   scripts/selinux/genheaders
  CLEAN   scripts/selinux/mdp
  CLEAN   scripts
  CLEAN   include/config include/generated
arch/alpha/include/generated .config .config.old .version
Module.symvers
masahiro@grover:~/ref/linux$ make defconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
*** Default configuration is based on 'defconfig'
#
# configuration written to .config
#
masahiro@grover:~/ref/linux$ make
  SYSHDR  arch/alpha/include/generated/uapi/asm/unistd_32.h
  SYSTBL  arch/alpha/include/generated/asm/syscall_table.h
  HOSTCC  scripts/kallsyms
  WRAP    arch/alpha/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/alpha/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/alpha/include/generated/uapi/asm/msgbuf.h
  WRAP    arch/alpha/include/generated/uapi/asm/poll.h
  WRAP    arch/alpha/include/generated/uapi/asm/sembuf.h
  WRAP    arch/alpha/include/generated/uapi/asm/shmbuf.h
  WRAP    arch/alpha/include/generated/asm/export.h
  WRAP    arch/alpha/include/generated/asm/kvm_para.h
  WRAP    arch/alpha/include/generated/asm/mcs_spinlock.h
  WRAP    arch/alpha/include/generated/asm/compat.h
  WRAP    arch/alpha/include/generated/asm/current.h
  WRAP    arch/alpha/include/generated/asm/exec.h
  WRAP    arch/alpha/include/generated/asm/fb.h
  WRAP    arch/alpha/include/generated/asm/irq_work.h
  WRAP    arch/alpha/include/generated/asm/kmap_size.h
  WRAP    arch/alpha/include/generated/asm/kprobes.h
  WRAP    arch/alpha/include/generated/asm/local64.h
  WRAP    arch/alpha/include/generated/asm/mmiowb.h
  WRAP    arch/alpha/include/generated/asm/module.lds.h
  WRAP    arch/alpha/include/generated/asm/msi.h
  WRAP    arch/alpha/include/generated/asm/preempt.h
  WRAP    arch/alpha/include/generated/asm/sections.h
  WRAP    arch/alpha/include/generated/asm/simd.h
  WRAP    arch/alpha/include/generated/asm/softirq_stack.h
  WRAP    arch/alpha/include/generated/asm/trace_clock.h
  WRAP    arch/alpha/include/generated/asm/unaligned.h
  WRAP    arch/alpha/include/generated/asm/vermagic.h
  UPD     include/config/kernel.release
  UPD     include/generated/uapi/linux/version.h
  UPD     include/generated/utsrelease.h
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  UPD     include/generated/bounds.h
  UPD     include/generated/timeconst.h
  CC      arch/alpha/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
<stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
  CALL    scripts/atomic/check-atomics.sh
  CC      init/main.o
  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  CC      init/version.o
  CC      init/do_mounts.o
  CC      init/noinitramfs.o
  CC      init/calibrate.o
  CC      init/init_task.o
  AR      init/built-in.a
  AR      usr/built-in.a
  AS      arch/alpha/kernel/head.o
  LDS     arch/alpha/kernel/vmlinux.lds
  AS      arch/alpha/kernel/entry.o
  CC      arch/alpha/kernel/traps.o
  CC      arch/alpha/kernel/process.o
  CC      arch/alpha/kernel/osf_sys.o
  CC      arch/alpha/kernel/irq.o
  CC      arch/alpha/kernel/irq_alpha.o
  CC      arch/alpha/kernel/signal.o
  CC      arch/alpha/kernel/setup.o
  CC      arch/alpha/kernel/ptrace.o
  CC      arch/alpha/kernel/time.o
  AS      arch/alpha/kernel/systbls.o
  CC      arch/alpha/kernel/err_common.o
  CC      arch/alpha/kernel/io.o
  CC      arch/alpha/kernel/bugs.o
  CC      arch/alpha/kernel/console.o
  CC      arch/alpha/kernel/pci.o
  CC      arch/alpha/kernel/pci_iommu.o
  CC      arch/alpha/kernel/pci-sysfs.o
  CC      arch/alpha/kernel/module.o
  CC      arch/alpha/kernel/rtc.o
  CC      arch/alpha/kernel/core_apecs.o
  CC      arch/alpha/kernel/core_cia.o
  CC      arch/alpha/kernel/core_irongate.o
  CC      arch/alpha/kernel/core_lca.o
  CC      arch/alpha/kernel/core_mcpcia.o
  CC      arch/alpha/kernel/core_polaris.o
  CC      arch/alpha/kernel/core_t2.o
  CC      arch/alpha/kernel/core_tsunami.o
  CC      arch/alpha/kernel/sys_alcor.o
  CC      arch/alpha/kernel/sys_cabriolet.o
  CC      arch/alpha/kernel/sys_dp264.o
  CC      arch/alpha/kernel/sys_eb64p.o
  CC      arch/alpha/kernel/sys_eiger.o
  CC      arch/alpha/kernel/sys_jensen.o
  CC      arch/alpha/kernel/sys_miata.o
  CC      arch/alpha/kernel/sys_mikasa.o
  CC      arch/alpha/kernel/sys_nautilus.o
  CC      arch/alpha/kernel/sys_noritake.o
  CC      arch/alpha/kernel/sys_rawhide.o
  CC      arch/alpha/kernel/sys_ruffian.o
  CC      arch/alpha/kernel/sys_rx164.o
  CC      arch/alpha/kernel/sys_sable.o
  CC      arch/alpha/kernel/sys_sio.o
  CC      arch/alpha/kernel/sys_sx164.o
  CC      arch/alpha/kernel/sys_takara.o
  CC      arch/alpha/kernel/irq_pyxis.o
  CC      arch/alpha/kernel/irq_i8259.o
  CC      arch/alpha/kernel/irq_srm.o
  CC      arch/alpha/kernel/err_ev6.o
  CC      arch/alpha/kernel/es1888.o
  CC      arch/alpha/kernel/smc37c669.o
  CC      arch/alpha/kernel/smc37c93x.o
  CC      arch/alpha/kernel/pc873xx.o
  CC      arch/alpha/kernel/gct.o
  CC      arch/alpha/kernel/srmcons.o
  AR      arch/alpha/kernel/built-in.a
  CC [M]  arch/alpha/kernel/srm_env.o
  CC      arch/alpha/mm/init.o
  CC      arch/alpha/mm/fault.o
  AR      arch/alpha/mm/built-in.a
  CC      arch/alpha/math-emu/math.o
^Cmake[2]: *** Deleting file 'arch/alpha/math-emu/math.o'
make[2]: *** [scripts/Makefile.build:271: arch/alpha/math-emu/math.o] Interrupt
make[1]: *** [scripts/Makefile.build:514: arch/alpha/math-emu] Interrupt
make: *** [Makefile:1842: arch/alpha] Interrupt





-- 
Best Regards
Masahiro Yamada
