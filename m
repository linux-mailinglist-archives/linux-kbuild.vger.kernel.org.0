Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C893BD4C78
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2019 05:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfJLDgw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Oct 2019 23:36:52 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25066 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfJLDgv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Oct 2019 23:36:51 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x9C3aOfV007471;
        Sat, 12 Oct 2019 12:36:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x9C3aOfV007471
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570851385;
        bh=WHihSG+Qg/s4+X69FAzzLRuZct3/u+AWzgWTVo2ivT0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ErnqTykzKfuCwIT+Wdxq5pAE7l5mvAS6+OB6vHyix1pHlxH4gT/rAqjtjU4Kl2hNQ
         F/3JkvxXfq+b+Ad0vbBqN+hQCuFRL8TWLN4uwo5uR6a5HiPTPUYspZ9rEOWnh2NSWF
         RfSK+mmqfZxS6oD7UCTiBWfbfocvDOeCHCTsUxrAeM2/uQTtg1Pb+4MdYyOgLPqBEa
         WiCUUFiDl1kVJp5xXLc3bGy9C9x2q2sXhEOi76Q8bbLVr60AtrXptiHqLrLWbAe7y+
         hOXCuZrx/TBLpdbaKWfW6moeoEz0AiUU4hrlBxSvMbSTwAdyo5nwHhjgKs+ADi5BAD
         Zl/nMR+rBDq5w==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id b1so7501644vsr.10;
        Fri, 11 Oct 2019 20:36:24 -0700 (PDT)
X-Gm-Message-State: APjAAAXFhH8oVcJ+9nSulKsLtt5AiYpP+d/Y3az16Fy2/2S2e/vzltv7
        tOVhd92nMhQealOHv0I1cxq3mdC6PC2SrQCVxDw=
X-Google-Smtp-Source: APXvYqztUPVN8tx/H7lHgyHEW08Jj11zV50ycIafHCCCTjr6xDT5/okgNPkigN96OHkslfQeGmQ2988j4adX/uvCMHQ=
X-Received: by 2002:a67:ff86:: with SMTP id v6mr11018051vsq.181.1570851383515;
 Fri, 11 Oct 2019 20:36:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191010151443.7399-4-maennich@google.com>
In-Reply-To: <20191010151443.7399-4-maennich@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 12 Oct 2019 12:35:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMn9GY2dzVvouDW5MfqR3M1pEkWM73quh1HKb_XW1L4g@mail.gmail.com>
Message-ID: <CAK7LNASMn9GY2dzVvouDW5MfqR3M1pEkWM73quh1HKb_XW1L4g@mail.gmail.com>
Subject: Re: [PATCH 3/4] symbol namespaces: revert to previous __ksymtab name scheme
To:     Matthias Maennich <maennich@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 11, 2019 at 12:16 AM Matthias Maennich <maennich@google.com> wrote:
>
> The introduction Symbol Namespaces changed the naming schema of the
> __ksymtab entries from __kysmtab__symbol to __ksymtab_NAMESPACE.symbol.
>
> That caused some breakages in tools that depend on the name layout in
> either the binaries(vmlinux,*.ko) or in System.map. E.g. kmod's depmod
> would not be able to read System.map without a patch to support symbol
> namespaces. A warning reported by depmod for namespaced symbols would
> look like
>
>   depmod: WARNING: [...]/uas.ko needs unknown symbol usb_stor_adjust_quirks
>
> In order to address this issue, revert to the original naming scheme and
> rather read the __kstrtabns_<symbol> entries and their corresponding
> values from __ksymtab_strings to update the namespace values for
> symbols. After having read all symbols and handled them in
> handle_modversions(), the symbols are created. In a second pass, read
> the __kstrtabns_ entries and update the namespaces accordingly.
>
> Suggested-by: Jessica Yu <jeyu@kernel.org>
> Fixes: 8651ec01daed ("module: add support for symbol namespaces.")
> Signed-off-by: Matthias Maennich <maennich@google.com>


According to https://lore.kernel.org/patchwork/patch/1135222/
was this problem reported by Stefan?
Reported-by: Stefan Wahren <stefan.wahren@i2se.com>


BTW, I initially suggested this way of fixing.
Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>



> @@ -74,9 +72,8 @@ struct kernel_symbol {
>         int namespace_offset;
>  };
>  #else
> -#define __KSYMTAB_ENTRY_NS(sym, sec, ns)                               \
> -       static const struct kernel_symbol __ksymtab_##sym##__##ns       \
> -       asm("__ksymtab_" #ns NS_SEPARATOR #sym)                         \


For consistency, you could also delete   asm("__ksymtab_" #sym)
by this patch instead of by 4/4.

Not a big deal, though.


Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>



-- 
Best Regards
Masahiro Yamada
