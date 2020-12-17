Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08ED82DCE33
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 10:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgLQJYu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Dec 2020 04:24:50 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30277 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgLQJYt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Dec 2020 04:24:49 -0500
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0BH9NqxP030716
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Dec 2020 18:23:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0BH9NqxP030716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608197033;
        bh=lyxy4N+QmOZIbc6zKUBg3yTh+qgTGZx7JrxlFrkCOdo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G6FEAPUWa00QkWUr6VseVLSC2Q9hrWtuaeS6R1dTpscaCdP98CRDvu9MCiZNYlnUh
         n2847xycx1NGcXVwlFQsy4g/r8KrW8J5Zbx8BQ7q98532j1iUMtQ+aW1/kKn+8mFVN
         s5XH7yNXrwrzQBwmNZz/Cds+jMu38/F3M6fH6pUBCsTP3wNhS2L8ZWBvSS2zw6kqzw
         ltvI5hfzPq2fIoxZOa0HAEFO62a0usfddyyS3rKsi71mhh3/J3rKaEZCLRzhbovcsv
         T6wqua7CEVtu28+Q7vz0joQV13XAFSpAIRkwG2m6stuOiuzrW3KOavSL5/V4ipBVXv
         JyyqhtEsVBRuQ==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id 11so18643568pfu.4
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Dec 2020 01:23:52 -0800 (PST)
X-Gm-Message-State: AOAM533ZV2QoRpk6ZWIHBhMAOq90CeztJkPf0BHURUTRwfMOxKhoKiQW
        5Z6pp2ifk2EYRefphXjex5pZppjIVLqL6ou791k=
X-Google-Smtp-Source: ABdhPJwc9MNYAmTGPUg7dh12WG/08zOBKgv8lIvTBlaBqx9kjxJRueD6dgY/prkqvXrzn6IGsyI2O05m9D2gEikLus8=
X-Received: by 2002:a65:6a16:: with SMTP id m22mr37274788pgu.175.1608197031781;
 Thu, 17 Dec 2020 01:23:51 -0800 (PST)
MIME-Version: 1.0
References: <87tuslxhry.fsf@mpe.ellerman.id.au>
In-Reply-To: <87tuslxhry.fsf@mpe.ellerman.id.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 17 Dec 2020 18:23:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTXyxhLzH7kRyAKCixe6ksJaKPiuPxWnsYZ6NJVCWDhQ@mail.gmail.com>
Message-ID: <CAK7LNASTXyxhLzH7kRyAKCixe6ksJaKPiuPxWnsYZ6NJVCWDhQ@mail.gmail.com>
Subject: Re: powerpc VDSO files being unnecessarily rebuilt
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 17, 2020 at 11:56 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Hi all,
>
> Since the merge of the C VDSO I see we are repeatedly rebuilding some
> files in the VDSO, eg:
>
>   $ make V=2
>   make[1]: Entering directory '/home/michael/linux/build~'
>     GEN     Makefile
>     CALL    /home/michael/linux/scripts/checksyscalls.sh - due to target missing
>     CALL    /home/michael/linux/scripts/atomic/check-atomics.sh - due to target missing
>     CHK     include/generated/compile.h
>     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to vgettimeofday.o not in $(targets)
>
> This then causes multiple other files to be rebuilt.
>
> So the obvious fix is to add it to targets:
>
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index d365810a689a..5386532866ce 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -5,6 +5,7 @@ ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_
>  include $(srctree)/lib/vdso/Makefile
>
>  obj-vdso64 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
> +targets := $(obj-vdso64) vdso64.so.dbg
>
>  ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> @@ -13,11 +14,11 @@ ifneq ($(c-gettimeofday-y),)
>    CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
>    CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
>    CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
> +  targets += vgettimeofday.o
>  endif
>
>  # Build rules
>
> -targets := $(obj-vdso64) vdso64.so.dbg
>  obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
>
>  GCOV_PROFILE := n
>
>
> But then I see it still rebuilt:
>
>   CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
>
>
> I'm not changing the command line, and AFAICS the .cmd file is not
> changing either:
>
>   $ make V=2
>   ...
>     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
>
>   $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>   7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>
>   $ make V=2
>   ...
>     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
>
>   $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>   7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o
>
>
> So any hints on what I'm missing here?
>
> cheers


This is because PPC builds the vdso twice
with different command arguments.


First time:

vdso_prepare: prepare0
         $(if $(CONFIG_VDSO32),$(Q)$(MAKE) \
                 $(build)=arch/powerpc/kernel/vdso32
include/generated/vdso32-offsets.h)
         $(if $(CONFIG_PPC64),$(Q)$(MAKE) \
                 $(build)=arch/powerpc/kernel/vdso64
include/generated/vdso64-offsets.h)


Second time:
   from  arch/powerpc/kernel/Makefile





For the first build, -Werror is missing because
Kbuild directly descends into arch/powerpc/kernel/vdso[32,64]/.


For the second build,

arch/powerpc/Kbuild appends the following:

subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror





-- 
Best Regards
Masahiro Yamada
