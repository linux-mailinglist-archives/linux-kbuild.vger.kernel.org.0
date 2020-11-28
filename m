Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5562C7597
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 23:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729979AbgK1VtQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 16:49:16 -0500
Received: from condef-03.nifty.com ([202.248.20.68]:61803 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732673AbgK1RzM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 12:55:12 -0500
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-03.nifty.com with ESMTP id 0AS7598n011099;
        Sat, 28 Nov 2020 16:05:09 +0900
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0AS74obX013284;
        Sat, 28 Nov 2020 16:04:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0AS74obX013284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606547091;
        bh=PE39hdI/e7+EZBc7ywdHmRsFj/6iCzNiPht7cSP0zfw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oisVV3r5ysBMBGWOwAVbjJbHfbOgIv3VbZT4LEWZZQMqNI8e5bEz1MoRINUbV5F6E
         j+v3cDS11iW4CfXpK9+8yFJViMXmLRQ++rHmFdqt31q7I8WEMxKZM6w9NTkbxEYTSO
         mhxUthLTsPkzmEZSonXL7s/mew+HSo2iWVQn7ooqkTZ+Cp639rP/7+oGsqRoXS7fS+
         96ZTqOni4JfYr8J9dWcM6ekydFEsBFaeMZQATYXjexfKrHZ2XSR5VP08sOxwwEOrh+
         /TFu3eQ8AkSGqgn1oi1M9qKq61A5Ov42wsDW2TUanC0f2e7jaBJ5crNeUt0m3n2U4I
         UULs77IScPSUg==
X-Nifty-SrcIP: [209.85.210.173]
Received: by mail-pf1-f173.google.com with SMTP id x24so6364889pfn.6;
        Fri, 27 Nov 2020 23:04:51 -0800 (PST)
X-Gm-Message-State: AOAM533jnjWbMXAaieLrFMyZPHFbj5ouFMszpEmlBptOWyJ7MjVNLO1Q
        NBINUKNMDiVFhWDAmYp6pM2xISHYaLDuAd83iPI=
X-Google-Smtp-Source: ABdhPJyEbE7fUISaIUmbRWAYArE+Qu8uv+lh7GUBnbnVkWeGUL6BRii61yVbTAjL74jQpHB7kYEDj3RRjnhV03dHmiQ=
X-Received: by 2002:a63:3205:: with SMTP id y5mr9717508pgy.47.1606547090308;
 Fri, 27 Nov 2020 23:04:50 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
 <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
 <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com> <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Nov 2020 16:04:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com>
Message-ID: <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 28, 2020 at 7:05 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Nov 27, 2020 at 1:53 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> >     33.68%  cc1plus
>
> So a third of the time is the _single_ invocation of cc1plus, which
> happens from scrips/gcc-plugin.sh doing that
>
>      $HOSTCC -c -x c++ -std=gnu++98 - -fsyntax-only
>
> thing. Which is purely to verify that plugins work.
>
> Ugh.
>
> Emese - I'm talking to myself while I'm looking at why "make
> allmodconfig" is so unbearably slow. This is part of it.
>
>               Linus


If you do 'make allmodconfig' from the clean source tree,
some logs are displayed.

If you do that once again, no logs,
which means no recompilation of the 'conf' binary.

Of course, GNU Make evaluates some recipes due to the FORCE,
but the costs are quite small.



As for the cc1plus cost, I got a similar result.

Running scripts/gcc-plugin.sh directly
took me 0.5 sec, which is a fourth
of the allmodconfig run-time.

Actually, I did not know this shell script
was so expensive to run...

I also added Kees to CC.


Even if we are able to manage this script somehow,
Kconfig invocation still takes more than 1 sec
due to the current design.



masahiro@grover:~/workspace/linux$ make mrproper
masahiro@grover:~/workspace/linux$ time make allmodconfig
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#

real 0m4.415s
user 0m3.686s
sys 0m0.763s
masahiro@grover:~/workspace/linux$ time make allmodconfig
#
# No change to .config
#

real 0m2.041s
user 0m1.564s
sys 0m0.519s

masahiro@grover:~/workspace/linux$ export HOSTCC=gcc
masahiro@grover:~/workspace/linux$ time  scripts/gcc-plugin.sh gcc

real 0m0.560s
user 0m0.512s
sys 0m0.048s





-- 
Best Regards
Masahiro Yamada
