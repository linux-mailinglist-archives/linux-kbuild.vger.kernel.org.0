Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4353F14EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 10:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237105AbhHSINT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 04:13:19 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:56679 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbhHSINS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 04:13:18 -0400
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 17J8CQMf027761;
        Thu, 19 Aug 2021 17:12:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17J8CQMf027761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629360746;
        bh=h+LQ3DsMYHHYU9pdZ68ThvQL2XeujHCWqfeKTgc0pFo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D+sDiHEXmigNHpO9mNOG7XZB6jc6je7+W4s91UVL1eoO3SZqQBWI5pgVZLtLeW1C6
         IttdLPn3uw8haX1AxRQROahuf5dzEO7BPNB/3KRUAWd+tEhnuvA64Zgm7k8Z29oHSi
         wKUZS7+aXvpopNZ4brqgW+nKislnzrYcBChzz4s3ACEPWFYPAN9LcEvSsQ2t4gyD4i
         Vezk7XrkDHLTVCMKhWNh4Fk4QJyigNwf+weyhKplkb8CprMkyxMk/uq2jScFV/m4hY
         MwCiqTjPQeQ+gjOd3MrTqKRZZz8EPEPE4g3OeRVBQn6fERvreEaLNmbkR2UmU7mFCA
         4KMNNDS6qriMw==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id s11so5149852pgr.11;
        Thu, 19 Aug 2021 01:12:26 -0700 (PDT)
X-Gm-Message-State: AOAM530Ez4vAOhZowLk4ZlthHfPubciOt7W6b6cLO1/d2cR16Jp5Lm/T
        kAs/e3fxVwrKHiPQxJrYj1pFugwdOCUb9QHy5qs=
X-Google-Smtp-Source: ABdhPJxi2Nx4dXdzgNKdB/Ey+I/fq5GnPoQn0Sct79R/OFM0D3or12EkJivEHe9YrQ2rLY2msRO27C7hTa47q1KCGjw=
X-Received: by 2002:a65:6459:: with SMTP id s25mr13060911pgv.7.1629360745663;
 Thu, 19 Aug 2021 01:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210819005744.644908-1-masahiroy@kernel.org> <20210819005744.644908-11-masahiroy@kernel.org>
 <202108182348.715797A@keescook>
In-Reply-To: <202108182348.715797A@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Aug 2021 17:11:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATXYSdGx2rg=-mHd0_RAiJLUSKob8ybCD6koGDGsXhSZQ@mail.gmail.com>
Message-ID: <CAK7LNATXYSdGx2rg=-mHd0_RAiJLUSKob8ybCD6koGDGsXhSZQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] kbuild: build modules in the same way with/without
 Clang LTO
To:     Kees Cook <keescook@chromium.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 3:59 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Aug 19, 2021 at 09:57:41AM +0900, Masahiro Yamada wrote:
> > When Clang LTO is enabled, additional intermediate files *.lto.o are
> > created because LLVM bitcode must be converted to ELF before modpost.
> >
> > For non-LTO builds:
> >
> >          $(LD)             $(LD)
> >   objects ---> <modname>.o -----> <modname>.ko
> >                              |
> >           <modname>.mod.o ---/
> >
> > For Clang LTO builds:
> >
> >          $(AR)            $(LD)                 $(LD)
> >   objects ---> <modname>.o ---> <modname>.lto.o -----> <modname>.ko
> >                                                   |
> >                                 <modname>.mod.o --/
> >
> > Since the Clang LTO introduction, ugly CONFIG_LTO_CLANG conditionals
> > are sprinkled everywhere in the kbuild code.
> >
> > Another confusion for Clang LTO builds is, <modname>.o is an archive
> > that contains LLVM bitcode files. The suffix should have been .a
> > instead of .o
> >
> > To clean up the code, unify the build process of modules, as follows:
> >
> >          $(AR)            $(LD)                     $(LD)
> >   objects ---> <modname>.a ---> <modname>.prelink.o -----> <modname>.ko
> >                                                       |
> >                                 <modname>.mod.o ------/
> >
> > Here, 'objects' are either ELF or LLVM bitcode. <modname>.a is an archive,
> > <modname>.prelink.o is ELF.
>
> I like this design, but I do see that it has a small but measurable
> impact on build times:
>
> allmodconfig build, GCC:
>
> make -j72 allmodconfig
> make -j72 -s clean && time make -j72
>
>     kbuild/for-next:
>         6m16.140s
>         6m19.742s
>         6m15.848s
>
>     +this-series:
>         6m22.742s
>         6m20.589s
>         6m19.911s
>
> Thought with not so many modules, it's within the noise:
>
> defconfig build, GCC:
>
> make -j72 defconfig
> make -j72 -s clean && time make -j72
>
>     kbuild/for-next:
>         0m41.579s
>         0m41.214s
>         0m41.370s
>
>     +series:
>         0m41.423s
>         0m41.434s
>         0m41.384s
>
>
> However, I do see that even LTO builds are slightly slower now, so
> perhaps the above numbers aren't due to the added $(AR) step:
>
> allmodconfig + Clang ThinLTO:
>
> make -j72 LLVM=1 LLVM_IAS=1 allmodconfig
> ./scripts/config -d GCOV_KERNEL -d KASAN -d LTO_NONE -e LTO_CLANG_THIN
> make -j72 LLVM=1 LLVM_IAS=1 olddefconfig
> make -j72 -s LLVM=1 LLVM_IAS=1 clean && time make -j72 LLVM=1 LLVM_IAS=1
>
>     kbuild/for-next:
>         9m53.927s
>         9m45.874s
>         9m47.722s
>
>     +series:
>         9m58.395s
>         9m53.201s
>         9m56.387s



I have not tested this closely, but
perhaps this might be the cost of $(AR) t $<)

In Sami's implementation, *.symversions are merged
by shell command.
Presumably, it runs faster than llvm-ar.
Instead, it has a risk of Argument list too long
as reported in [1].

[1] https://lore.kernel.org/lkml/20210614094948.30023-1-lecopzer.chen@mediatek.com/


Anyway, when I find a time,
I will look into some bench mark.




>
>
> I haven't been able to isolate where the changes in build times are
> coming from (nor have I done link-phase-only timings -- I realize those
> are really the most important).
>
> I did notice some warnings from this patch, though, in the
> $(modules-single) target:
>
> scripts/Makefile.build:434: target 'drivers/scsi/libiscsi.a' given more than once in the same rule
> scripts/Makefile.build:434: target 'drivers/atm/suni.a' given more than once in the same rule


Ah, right.

I also noticed needless rebuilds of prelink.symversions.

In v2, I will fix as follows:


index 957addea830b..cf6b79dff5f9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -438,6 +438,8 @@ cmd_merge_symver =                                  \
 $(obj)/%.prelink.symversions: $(obj)/%.a FORCE
        $(call if_changed,merge_symver)

+targets += $(patsubst %.a, %.prelink.symversions, $(modules))
+
 $(obj)/%.prelink.o: ld_flags += --script=$(filter %.symversions,$^)
 module-symver = $(obj)/%.prelink.symversions

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index f604d2d01cad..5074922db82d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -107,8 +107,8 @@ real-dtb-y  := $(addprefix $(obj)/, $(real-dtb-y))
 subdir-ym      := $(addprefix $(obj)/,$(subdir-ym))

 modules                := $(patsubst %.o, %.a, $(obj-m))
-modules-multi  := $(patsubst %.o, %.a, $(multi-obj-m))
-modules-single := $(filter-out $(modules-multi), $(filter %.a, $(modules)))
+modules-multi  := $(sort $(patsubst %.o, %.a, $(multi-obj-m)))
+modules-single := $(sort $(filter-out $(modules-multi), $(filter %.a,
$(modules))))

 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.








-- 
Best Regards
Masahiro Yamada
