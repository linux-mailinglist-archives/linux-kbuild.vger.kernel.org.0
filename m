Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59A34AC6B4
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2019 15:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405980AbfIGNHJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Sat, 7 Sep 2019 09:07:09 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45287 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405979AbfIGNHJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Sep 2019 09:07:09 -0400
Received: by mail-qt1-f194.google.com with SMTP id r15so10510263qtn.12;
        Sat, 07 Sep 2019 06:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D8xpnUonO9ittQ1fvcy5psrt/hDZYfyPpChwIepSzR4=;
        b=JZKiPTIEw/FrcEZr9N+XpxWVITNNl2/ZtEnI343Sy1YKi7GhaQN0/bQfeYJ6fMQRi/
         i2iNexINfOgWmsBeGxsA9oEmQxFnk1Btwnkn5FgyazU3s2VUaab4BffspQ4Csad7YU0U
         TO28GcyOYB9f4u73DErmbcXYWPCfoEtReGBj8x9iIeJKLmLi5oLJMTXxXACX5uX0Eslk
         RsOFKg3GNsCL+ghGJZd7DWaDzbjnHboRV9Hwd0KLkbxoErWy/44gNB1Xr/vmUXL8lqwh
         wTMXeSf9ZETL97hwXrnbUF2p8rghEEwe9JdutzeVcHF7LCZNQkeRfiBGHq5q4QkTKMHX
         KBLg==
X-Gm-Message-State: APjAAAXgiFkt4VG9+azw7O01xvhk65vJe8BGIVs7x4iKxCHOVg8C1fUj
        xFYFH+MERcpJ13QeiM7EjTOraJ+GciMHS6CqabE=
X-Google-Smtp-Source: APXvYqzFHsUZIR4dt5P3Hjmbp9ave6Nqb35MMPRXJtrbS0GvnfMEOm5b96OnKqB/zfumlG9w1sEeetW4FsMWLlG3YgI=
X-Received: by 2002:aed:2842:: with SMTP id r60mr13927377qtd.142.1567861627709;
 Sat, 07 Sep 2019 06:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190906151059.1077708-1-arnd@arndb.de> <7fc19dd4-93fb-fa15-3d36-3079cd42cf7c@linux.com>
 <17ee4877-d24a-12ad-5836-411e3e525933@linux.com>
In-Reply-To: <17ee4877-d24a-12ad-5836-411e3e525933@linux.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 7 Sep 2019 15:06:51 +0200
Message-ID: <CAK8P3a1kpLgTBqd_VC8_V7UL_gvf7kZmyaSjbbHpqsaFQ00KyQ@mail.gmail.com>
Subject: Re: [PATCH] mostpost: don't warn about symbols from another file
To:     Denis Efremov <efremov@linux.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        WANG Chao <chao.wang@ucloud.cn>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 7, 2019 at 7:28 AM Denis Efremov <efremov@linux.com> wrote:
> On 07.09.2019 01:39, Denis Efremov wrote:
> >> This is not helpful, as these are clearly not static symbols
> >> at all. Suppress the warning in a case like this.
> >>
> >
> > It looks very similar to this discussion https://lkml.org/lkml/2019/7/30/112
> >
> > Could you please write the steps to reproduce the warnings?
>
> > Now, I'm trying to build linux-next (host Ubuntu 19.04 x86_64) with:
> > $ make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
> > But I can't get these warnings.
>
> Tried defconfig, allyesconfig.

I only have one randconfig build that caused these, see
http://paste.ubuntu.com/p/D6w8RNS7MG/ for the .config

I was building linux-next with the clang-9 toolchain from http://apt.llvm.org,
but that should not matter here.

> > I would like to check the type of this asm symbols. It seems like they
> > are STT_NOTYPE. In this case the fix could also involve ELF_ST_TYPE check.
> >
>
> Ah, I forgot that we don't check the type at all, so this is not the case.
> But still, I would like to test what if the remove binding check at all?
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 76c221dd9b2b..97dbcebf2338 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1987,14 +1987,12 @@ static void read_symbols(const char *modname)
>         for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
>                 unsigned char bind = ELF_ST_BIND(sym->st_info);
>
> -               if (bind == STB_GLOBAL || bind == STB_WEAK) {
>                         struct symbol *s =
>                                 find_symbol(remove_dot(info.strtab +
>                                                        sym->st_name));
>
>                         if (s)
>                                 s->is_static = 0;
> -               }
>         }
>
>         if (!is_vmlinux(modname) || vmlinux_section_warnings)

Unfortunately, I still get the same warnings, plus one about modpost.c:

scripts/mod/modpost.c:1988:17: warning: unused variable ‘bind’
[-Wunused-variable]
WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidivmod" [vmlinux] is a static (unknown)
WARNING: "__udivsi3" [vmlinux] is a static (unknown)
WARNING: "_change_bit" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idiv" [vmlinux] is a static (unknown)
WARNING: "__umodsi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidiv" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idivmod" [vmlinux] is a static (unknown)
WARNING: "__muldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
WARNING: "__raw_writesb" [vmlinux] is a static (unknown)
WARNING: "__raw_readsb" [vmlinux] is a static (unknown)
WARNING: "__ucmpdi2" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lmul" [vmlinux] is a static (unknown)
WARNING: "__divsi3" [vmlinux] is a static (unknown)
WARNING: "__modsi3" [vmlinux] is a static (unknown)
WARNING: "_test_and_change_bit" [vmlinux] is a static (unknown)
WARNING: "__bswapdi2" [vmlinux] is a static (unknown)
WARNING: "__bswapsi2" [vmlinux] is a static (unknown)
WARNING: "__ashldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsl" [vmlinux] is a static (unknown)
WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidivmod" [vmlinux] is a static (unknown)
WARNING: "__udivsi3" [vmlinux] is a static (unknown)
WARNING: "_change_bit" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idiv" [vmlinux] is a static (unknown)
WARNING: "__umodsi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_uidiv" [vmlinux] is a static (unknown)
WARNING: "__aeabi_idivmod" [vmlinux] is a static (unknown)
WARNING: "__muldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
WARNING: "__raw_writesb" [vmlinux] is a static (unknown)
WARNING: "__raw_readsb" [vmlinux] is a static (unknown)
WARNING: "__ucmpdi2" [vmlinux] is a static (unknown)
WARNING: "__aeabi_lmul" [vmlinux] is a static (unknown)
WARNING: "__divsi3" [vmlinux] is a static (unknown)
WARNING: "__modsi3" [vmlinux] is a static (unknown)
WARNING: "_test_and_change_bit" [vmlinux] is a static (unknown)
WARNING: "__bswapdi2" [vmlinux] is a static (unknown)
WARNING: "__bswapsi2" [vmlinux] is a static (unknown)
WARNING: "__ashldi3" [vmlinux] is a static (unknown)
WARNING: "__aeabi_llsl" [vmlinux] is a static (unknown)

     Arnd
