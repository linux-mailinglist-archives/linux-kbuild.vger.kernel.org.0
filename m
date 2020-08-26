Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC381252FE3
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 15:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730270AbgHZN26 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 09:28:58 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:52122 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730214AbgHZN2p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 09:28:45 -0400
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 07QDSRqm004629;
        Wed, 26 Aug 2020 22:28:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 07QDSRqm004629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598448507;
        bh=nnAMcUaGRUQahEKCpGV9sxhCZhM9PXG2c9FGIHnAxps=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CptZvp0nKo7FcaqgrlAj0bOvX1AhXaaFtimeKeWv+0b/NylzOJ+bOIcub+O0ATkUb
         2ht6/AmcumJyIDrHQ0F3bY8VhLtiI5tItXManPu+EDWOkSUWqgB3jL2bZLqT/pSakL
         JZssGdnV7lGCPY2sdjU8f9f6KD41GKs43rMbKhHQ6ELZG+II2v0+UHuGGhEqaWb++E
         +I3P6iOeG3zbG0CyngfemZ3tEx2qoJtLMLEn/kj7QEIxzhLYpOtlpMEoyCAHuSq81V
         8xZ7izxudqU/lKqE8z8SmmZv1UP/EuyLzox+1nRhlkLzCB6nySH+6ItNmwPWNvSfin
         5AxoJ/r8Lxr7A==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id s2so275350pjr.4;
        Wed, 26 Aug 2020 06:28:27 -0700 (PDT)
X-Gm-Message-State: AOAM530nrLM0gPCDT9reBsw4Sf1YdnW/7i0dUoQ+G8oZ7RoCaFlpi09n
        B7BUyvA4NTKSFj6QznxjKJKxCleHFd7le+uvHtk=
X-Google-Smtp-Source: ABdhPJymxQdYhWRn7RNPnYZe2TBvPIpBtp3BpPF0KRoVNvV+kTcnxYhIgClbwBtNU7bIThwESkQmiZX54m4mSbQ7Hdo=
X-Received: by 2002:a17:902:301:: with SMTP id 1mr12118372pld.198.1598448506530;
 Wed, 26 Aug 2020 06:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200822145618.1222514-1-masahiroy@kernel.org>
In-Reply-To: <20200822145618.1222514-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Aug 2020 22:27:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASTHS8UgpZOvvFt1865hwRf8Z3Oan-Rr2pu2jZpKhrMbA@mail.gmail.com>
Message-ID: <CAK7LNASTHS8UgpZOvvFt1865hwRf8Z3Oan-Rr2pu2jZpKhrMbA@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] kbuild: clang-tidy
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 22, 2020 at 11:56 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I improved gen_compile_commands.py,
> then rebased Nathan's v7 [1] on top of them.
> To save time, I modified the Makefile part.
> No change for run-clang-tools.py
>
> "make clang-tidy" should work in-tree build,
> out-of-tree build (O=), and external module build (M=).
>
> V3:
> Fix minor mistakes pointed out by Nick
> Add a new patch (09/10) to remove the warning about
> too few .cmd files.
>
> V2:
> Keep the previous work-flow.
> You can still manually run scripts/gen_compile_commands.json
>
> 'make compile_commands.json' or 'make clang-tidy' is handier
> for most cases. As Nick noted, there is 3 % loss of the coverage.
>
> If you need the full compilation database that covers all the
> compiled C files, please run the script manually.
>
> [1] https://patchwork.kernel.org/patch/11687833/
>
>
> Masahiro Yamada (9):
>   gen_compile_commands: parse only the first line of .*.cmd files
>   gen_compile_commands: use choices for --log_levels option
>   gen_compile_commands: do not support .cmd files under tools/ directory
>   gen_compile_commands: reword the help message of -d option
>   gen_compile_commands: make -o option independent of -d option
>   gen_compile_commands: move directory walk to a generator function
>   gen_compile_commands: support *.o, *.a, modules.order in positional
>     argument
>   kbuild: wire up the build rule of compile_commands.json to Makefile
>   gen_compile_commands: remove the warning about too few .cmd files
>
> Nathan Huckleberry (1):
>   Makefile: Add clang-tidy and static analyzer support to makefile



All applied to linux-kbuild.







>  MAINTAINERS                                 |   1 +
>  Makefile                                    |  45 +++-
>  scripts/clang-tools/gen_compile_commands.py | 236 ++++++++++++++++++++
>  scripts/clang-tools/run-clang-tools.py      |  74 ++++++
>  scripts/gen_compile_commands.py             | 151 -------------
>  5 files changed, 352 insertions(+), 155 deletions(-)
>  create mode 100755 scripts/clang-tools/gen_compile_commands.py
>  create mode 100755 scripts/clang-tools/run-clang-tools.py
>  delete mode 100755 scripts/gen_compile_commands.py
>
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200822145618.1222514-1-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
