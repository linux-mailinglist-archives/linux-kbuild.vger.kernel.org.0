Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDA014105C
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 19:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbgAQSBl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 13:01:41 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19545 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQSBl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 13:01:41 -0500
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 00HI1L4N031520
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Jan 2020 03:01:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 00HI1L4N031520
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579284082;
        bh=ecjXaI7QeyvByIxO4lFFZF516lo++S3ClxUq0a6KQMo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZctB2BeSMYsDwJsPxDGZG9sYIDlYkHxxPO2XZIxA3CybIN5wzjsxC1G+Lk7T1Sk06
         RYcr0uiHkBVNFMYCOFeSGRDJhhhEhvzUEwHatiwHOJ/35LmJTIrA1Twtm36k0VuzTX
         ocVkbSuM1tyxl80Tp/hicnYbSHG0/hmaxULSSa6C9Ibprsi7KaNaY+olY9ZzhrwwYR
         J61TfRgH/9MWQlR9XwH3eqyNulxIgZE7XExwFgIVZTkJ2Tgk/0Y8Jw8hHZ9vKNY2SE
         x6ye8+Joagc0ChXGP1nu9ZJVVN751WdHQJLMfInSd+om1/byPeWflygz6B2cmlkTIh
         cPZWPvxo4WQPw==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id x18so15380739vsq.4
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jan 2020 10:01:21 -0800 (PST)
X-Gm-Message-State: APjAAAWBJsM1FkZpenZxNpO8UdFsEi6QQyeo/Rfs0lMsrT5eZiiFAVHR
        2Z9l3wYfl90rbjWJugYsX57T5y+USz4EF0vBCjo=
X-Google-Smtp-Source: APXvYqwKvC1D41otNjZJVp9uz6rlwbul6bvgpYp3sLyUy8oh2YDjcouN4/+UyKNlnJc/YqANr+wpUhLP9fdcX9nllik=
X-Received: by 2002:a05:6102:2334:: with SMTP id b20mr5578692vsa.155.1579284080541;
 Fri, 17 Jan 2020 10:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20200115115249.27774-1-ilie.halip@gmail.com> <CAKwvOdkdD9VF1k==G4vMeo4bBLarYz8gPvWfv6+N2kejeoXfjA@mail.gmail.com>
In-Reply-To: <CAKwvOdkdD9VF1k==G4vMeo4bBLarYz8gPvWfv6+N2kejeoXfjA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 18 Jan 2020 03:00:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1pS0nK7JoUbgOn0aMtaYH69XukjNELZNxTtV_iMmR1Q@mail.gmail.com>
Message-ID: <CAK7LNAQ1pS0nK7JoUbgOn0aMtaYH69XukjNELZNxTtV_iMmR1Q@mail.gmail.com>
Subject: Re: [RFC PATCH] lib: move memcat_p.o to obj-y
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Ilie Halip <ilie.halip@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 17, 2020 at 7:30 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jan 15, 2020 at 3:53 AM Ilie Halip <ilie.halip@gmail.com> wrote:
> >
> > The semantics of `--undefined` differ between ld.bfd and ld.lld:
> >     $ echo | gcc -x c -c - -o a.o
> >     $ echo "EXTERN(test)" > a.lds
> >     $ ld.bfd a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
> >     0000000000000000         *UND*      0000000000000000 test
> >     $ ld.lld a.o -t a.lds -o - 2>/dev/null && objdump -t | grep test
> >     $
> >
> > When building with CONFIG_STM=m, there are no in-kernel users of memcat_p()
> > and ld.lld discards this symbol because it's linked in via --no-whole-archive.
> > It's marked as undefined by a linker script but ld.lld discards it anyway (as
> > seen in the above snippet).
> >
> > Work around the ld.lld behavior by moving the object file to obj-y.
> >
> > Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
> > Link: https://github.com/ClangBuiltLinux/linux/issues/515
>
> Thanks for the patch.  This solves the observed linkage failure.
> Maybe Masahiro has more input based on the discussion in the above
> Link?

Sorry, I did not notice that thread until now.
I will take a look at it when I have time.


This patch does not seem to be a proper fix.

If this fix-up were acceptable, theoretically,
all objects that contain EXPORTED_SYMBOL
would need to be turned into obj-y from lib-y ?







> Tested-by: Nick Desaulniers <ndesaulniers@google.com>







-- 
Best Regards
Masahiro Yamada
