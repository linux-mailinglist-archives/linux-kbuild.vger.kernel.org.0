Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB473BF70F
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 10:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhGHIss (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 04:48:48 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:55251 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230414AbhGHIss (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 04:48:48 -0400
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 1688jU8A014091;
        Thu, 8 Jul 2021 17:45:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 1688jU8A014091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625733931;
        bh=ft8X0W6SL9ffJoOxR1is1/byqHqLt8LZorixR+KT1KE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xMe6B4YmsJmUKZgipez+ViLaXVs5H3kcLNXOpe17qLRckOcUCLmYVkEJiuuWYcL3b
         17aKn2KMHb+Py8KVmcQKRzh3OJ9wUudVaOC5eWjLnvg0w2zuOmOY0jcFifGAvug/MQ
         6jgo2v9CYr26OU22LX44EcAW2dUOHEGJC+YTr4lXAVypC7dxedm/DqA1u5vdihvGtW
         9mH/IMKOumfIdnZDKkWUhppBE9Sg2M0mFOGD0qJtLxgwIa2CKDHvzOFNU9KYhF0ID1
         DB3NLn2s0sJvIzPBusUtMU0cptaHVNjmy2c3dI1fmzIit2CnBTfDWKgsDc27pHH26x
         6vN9Yy4Dpg7fw==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id a127so4819723pfa.10;
        Thu, 08 Jul 2021 01:45:30 -0700 (PDT)
X-Gm-Message-State: AOAM5307MIyPX/gy0p26Dk37c7fniaWeMPbjzG8My1p1FEMBCBZu+nU8
        lX8dGqMarOO7H3u/MAgGJhU4/EiZHyDVh5VS8zg=
X-Google-Smtp-Source: ABdhPJy19uJpMuZ6ZWMEgz3Kc3nLfMz6lY2BZaJ0/Li/AX7Nb9tRqXb5QuqxeGUNK9TRuLL+UR75xJiwwDMk2hjnwCY=
X-Received: by 2002:a63:d80a:: with SMTP id b10mr30885371pgh.47.1625733929909;
 Thu, 08 Jul 2021 01:45:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <20210707224310.1403944-3-ndesaulniers@google.com> <CAMuHMdXuzb6PuujuCzm_FYq9ZeZeJxVZiYTGxdGeOTkZ6+W=+w@mail.gmail.com>
In-Reply-To: <CAMuHMdXuzb6PuujuCzm_FYq9ZeZeJxVZiYTGxdGeOTkZ6+W=+w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 8 Jul 2021 17:44:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2e8eNpuPwYd+dnx1nu_R6FM2X=aH1VUNa=09ebEEyaw@mail.gmail.com>
Message-ID: <CAK7LNAQ2e8eNpuPwYd+dnx1nu_R6FM2X=aH1VUNa=09ebEEyaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 8, 2021 at 5:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Nick,
>
> On Thu, Jul 8, 2021 at 1:12 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > We get constant feedback that the command line invocation of make is too
> > long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> > target triple, or is an absolute path outside of $PATH, but it's mostly
> > redundant for a given ARCH.
> >
> > If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
> > KBUILD_CFLAGS, and KBUILD_AFLAGS based on $ARCH.
> >
> > Previously, we'd cross compile via:
> > $ ARCH=arm64 CROSS_COMPILE=aarch64-linxu-gnu make LLVM=1 LLVM_IAS=1
>
> Which didn't really work, I assume? (s/linxu/linux/)

Also
s/gnu/gnu-/



-- 
Best Regards
Masahiro Yamada
