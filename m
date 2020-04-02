Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE96A19C7B7
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 19:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388560AbgDBRO3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 13:14:29 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:31125 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388136AbgDBRO2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:14:28 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 032HENKg001465;
        Fri, 3 Apr 2020 02:14:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 032HENKg001465
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585847664;
        bh=VV9RCquaBUqKTgTNvl6x45RtGx68PHxnzewnWe363KQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qlZuXzUgOjt1YRjdpZ8jvTTkU+olMBIPWMLjJF7eyl4j44uPVN0gmhq65eBGH9bjA
         LXjM+OLJRXE8RWpSyzLmM/23PtvEcj8PZS7FP818EzEWqUo5GkoGtyq8kXDGeq/eqO
         aZ0LixI45onrSVpqQOIaVMkVSJgUXvtz8AVf3jt92XKuwPKuvnTRPpyAFvX85HjK0/
         3A3/RSbbnDetEZ2N/exMsyuo67Z8iwyo9kOE3zEMrdBm6bfhIDm4hmjFpUcmkd4AYd
         i8X0/o+6Ic0nn0d+aa6rZEsySURy7iAZU+ejsA0nvvWhqeYI1BFmlYFIEvlKSelg1Q
         Svl5563/ePFzw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id w14so2886598vsf.7;
        Thu, 02 Apr 2020 10:14:24 -0700 (PDT)
X-Gm-Message-State: AGi0PuZqoeyGscCOFKrtlA0Iy7j7xnu9jLwYm3CLvbS8DZLrZ7AJwS+y
        UryrQToOQpnLCqLw0urKql2hgJa/3qP0tjnP3PI=
X-Google-Smtp-Source: APiQypLi6VNdR0LJcxnztEKTu9mm4aCOQVyBOR7HhoPha0nrOLv/Bys5d+dBX54lAC1p0IfDAxTTHz8EmuqD0HPmlks=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr3230237vsz.155.1585847663196;
 Thu, 02 Apr 2020 10:14:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200311223725.27662-1-masahiroy@kernel.org> <20200311223725.27662-2-masahiroy@kernel.org>
In-Reply-To: <20200311223725.27662-2-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Apr 2020 02:13:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT3SR3rc5F1BYA0=Wxp3PRbd+ueDZ-h_UzCj=9m8CLWLQ@mail.gmail.com>
Message-ID: <CAK7LNAT3SR3rc5F1BYA0=Wxp3PRbd+ueDZ-h_UzCj=9m8CLWLQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: link lib-y objects to vmlinux forcibly
 when CONFIG_MODULES=y
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     sparclinux <sparclinux@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 12, 2020 at 7:38 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Kbuild supports not only obj-y but also lib-y to list objects linked to
> vmlinux.
>
> The difference between them is that all the objects from obj-y are
> forcibly linked to vmlinux by using --whole-archive, whereas the objects
> from lib-y are linked as needed; if there is no user of a lib-y object,
> it is not linked.
>
> lib-y is intended to list utility functions that may be called from all
> over the place (and may be unused at all), but it is a problem for
> EXPORT_SYMBOL(). Even if there is no call-site in the vmlinux, we need
> to keep exported symbols for the use from loadable modules.
>
> Commit 7f2084fa55e6 ("[kbuild] handle exports in lib-y objects reliably")
> worked around it by linking a dummy object, lib-ksyms.o, which contains
> references to all the symbols exported from lib.a in that directory.
> It uses the linker script command, EXTERN. Unfortunately, the meaning of
> EXTERN of ld.lld is different from that of ld.bfd. Therefore, this does
> not work with LD=ld.lld (CBL issue #515).
>
> Anyway, the build rule of lib-ksyms.o is somewhat tricky. So, I want to
> get rid of it.
>
> At first, I was thinking of accumulating lib-y objects into obj-y
> (or even replacing lib-y with obj-y entirely), but the lib-y syntax
> is used beyond the ordinary use in lib/ and arch/*/lib/.
>
> Examples:
>
>  - drivers/firmware/efi/libstub/Makefile builds lib.a, which is linked
>    into vmlinux in the own way (arm64), or linked to the decompressor
>    (arm, x86).
>
>  - arch/alpha/lib/Makefile builds lib.a which is linked not only to
>    vmlinux, but also to bootloaders in arch/alpha/boot/Makefile.
>
>  - arch/xtensa/boot/lib/Makefile builds lib.a for use from
>    arch/xtensa/boot/boot-redboot/Makefile.
>
> One more thing, adding everything to obj-y would increase the vmlinux
> size of allnoconfig (or tinyconfig).
>
> For less impact, I tweaked the destination of lib.a at the top Makefile;
> when CONFIG_MODULES=y, lib.a goes to KBUILD_VMLINUX_OBJS, which is
> forcibly linked to vmlinux, otherwise lib.a goes to KBUILD_VMLINUX_LIBS
> as before.
>
> The size impact for normal usecases is quite small since at lease one
> symbol in every lib-y object is eventually called by someone. In case
> you are intrested, here are the figures.
>
> x86_64_defconfig:
>
>    text    data     bss     dec     hex filename
> 19566602 5422072 1589328 26578002 1958c52 vmlinux.before
> 19566932 5422104 1589328 26578364 1958dbc vmlinux.after
>
> The case with the biggest impact is allnoconfig + CONFIG_MODULES=y.
>
> ARCH=x86 allnoconfig + CONFIG_MODULES=y:
>
>    text    data     bss     dec     hex filename
> 1175162  254740 1220608 2650510  28718e vmlinux.before
> 1177974  254836 1220608 2653418  287cea vmlinux.after
>
> Hopefully this is still not a big deal. The per-file trimming with the
> static library is not so effective after all.
>
> If fine-grained optimization is desired, some architectures support
> CONFIG_LD_DEAD_CODE_DATA_ELIMINATION, which trims dead code per-symbol
> basis. When LTO is supported in mainline, even better optimization will
> be possible.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/515
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---

Applied to linux-kbuild.

I will rebase my branch during this MW,
so the commit ID will be unstable.
Please do not record it until it lands in Linus' tree.





-- 
Best Regards
Masahiro Yamada
