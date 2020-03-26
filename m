Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A535A194993
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 21:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgCZUvf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 16:51:35 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:60039 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbgCZUvf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:51:35 -0400
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 02QKpB37016411;
        Fri, 27 Mar 2020 05:51:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 02QKpB37016411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585255872;
        bh=zRQ7nCLtjVIU1Jq1HUXWonwpqrxN+T1KGJqxECEbYQM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WTuGQjp7kChJ1ST2JqdmXuS0WEo1zexYQsX/JqecibFcS4AiJIxr1dTwJjMrEqx7o
         U2B6CQ1NPFtPxw56un3S/xdeZcxhX2s36uh8nQU3BXB0voh6SWC9MBWv8wv8Xd9FeT
         DdW8Busb1dTeisI3Mbu4XlyDpvt4bxNyWcVJkrqOVFft3TZFoOVH4+3jPZZTZKsuOe
         qR0ts1dbukFHyL6M8Njg8XtAKx5N/wu60vbcGBBsKi4jzMKjgx9f7qFuy1UrMWrwjT
         Vk8j2OFe0r6rPp3SycnhhhPENmdQ+MIbLNjzYhDf3cYQX6qTI6qWgIOoY7rSjQ4DmM
         HDTttTA034q2w==
X-Nifty-SrcIP: [209.85.222.41]
Received: by mail-ua1-f41.google.com with SMTP id o15so2711254ual.3;
        Thu, 26 Mar 2020 13:51:11 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3rk2jXwAW9W/+cFn57cIRJ4a6TQJFUBdJkK4eOWO7PU+56a1GO
        LNbKBgYILLsaJ1hTFV+pqQxgETwa3Ep2qOYpZJw=
X-Google-Smtp-Source: ADFU+vulKPchjBB+wJWyQk8duaib49GFM1PSH3O5Tu2zolCDCTk/AuA/mB2ZDNQX+Mpj+8VI/7zef+V9swnyXsYSkRk=
X-Received: by 2002:a9f:28c5:: with SMTP id d63mr8445238uad.25.1585255870618;
 Thu, 26 Mar 2020 13:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdmLWqVq_EQk2S4FUSUCU7yoppYD4oiL+P7taWoDTyrb9w@mail.gmail.com>
 <20200326202600.7086-1-Jason@zx2c4.com>
In-Reply-To: <20200326202600.7086-1-Jason@zx2c4.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 27 Mar 2020 05:50:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVciXgqwfaEbH5i2GT++hHhbjabtzN_s=tzXh4up93ZA@mail.gmail.com>
Message-ID: <CAK7LNASVciXgqwfaEbH5i2GT++hHhbjabtzN_s=tzXh4up93ZA@mail.gmail.com>
Subject: Re: [PATCH] x86: update AS_* macros to binutils >=2.23, supporting
 ADX and AVX2
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 27, 2020 at 5:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Now that the kernel specifies binutils 2.23 as the minimum version, we
> can remove ifdefs for AVX2 and ADX throughout.
>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>
>
> Masahiro - here's an updated patch based on -next, as Nick requested.
> Whether or not you'd prefer this one to the other one based on Linus'
> tree is up to you, but here it is in case it's helpful.


Thanks.

When the netfilter PR is pulled,
I will rebase on top of Linus' tree.


> diff --git a/net/netfilter/Makefile b/net/netfilter/Makefile
> index 292e71dc7ba4..cd0d6ad48650 100644
> --- a/net/netfilter/Makefile
> +++ b/net/netfilter/Makefile
> @@ -83,10 +83,8 @@ nf_tables-objs := nf_tables_core.o nf_tables_api.o nft_chain_filter.o \
>                   nft_set_pipapo.o
>
>  ifdef CONFIG_X86_64
> -ifneq (,$(findstring -DCONFIG_AS_AVX2=1,$(KBUILD_CFLAGS)))
>  nf_tables-objs += nft_set_pipapo_avx2.o
>  endif
> -endif


This hunk should go to:

[v2,10/16] x86: probe assembler capabilities via kconfig instead of makefile


I will try my best to remember this.


--
Best Regards
Masahiro Yamada
