Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D10A23BB7
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2019 17:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388388AbfETPJE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 May 2019 11:09:04 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:49774 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733027AbfETPJE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 11:09:04 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4KF8umi027391;
        Tue, 21 May 2019 00:08:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4KF8umi027391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558364937;
        bh=95HwtbpMEdAllrN7F4zNPVZ+pNQZoCbwUigUV2ddKeY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=18QrCSk8G+t+XAukQYfqtvqpNID+j398DC9uzCU6kAmT0bQ4JmxnX9Zw2aDtN8EUw
         z/xBYfXyn+DZRmfB9j8Rzt9oNI0n4SBX1RJVrseq41aTfL/VzMGIKZTrwQkcuVweX3
         f+aKAbitf/1HlUptdjYiCwbmJo0Ur/UNZ+BsLo2VL0vnQ+P7Tc56sWOLrVkBVHfAad
         W43Utwl8zrUrFRr9/ouHnfrsh+mjWH7KWVgPWSzeMjgKncJeTsS2bmax9vx9ZfYi5h
         Fos+RhgWy+AkC3tu7oAzk+y+ULC4lajYp6t/kXwvu2e2Cktlj7BFoiAvt6EPjbW236
         4EyoKuP2aMROA==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id x184so8089811vsb.5;
        Mon, 20 May 2019 08:08:57 -0700 (PDT)
X-Gm-Message-State: APjAAAWdN0sWKe6PwZXvsfUFwCAKfFVtgX1Uo/9mV3TMK/b9geOeUnC2
        FcfnA8YVz+JoUoBY0MJkS1VX82PwAW+kHIv9zA8=
X-Google-Smtp-Source: APXvYqzxDQvhelDYO1GqpUaZUlQvPgAMk4p/UNpmJQRQFDak7rLxLzf7T+QCeN0IC4L32Vrt8CzBRFBSIQ6QIJk+n+o=
X-Received: by 2002:a67:d382:: with SMTP id b2mr19939121vsj.155.1558364935894;
 Mon, 20 May 2019 08:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190423212741.12219-1-ndesaulniers@google.com>
In-Reply-To: <20190423212741.12219-1-ndesaulniers@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 21 May 2019 00:08:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARdZa16J56AxhM5bcr9oHdAw+zpa4EDjPpF8YO77==Etw@mail.gmail.com>
Message-ID: <CAK7LNARdZa16J56AxhM5bcr9oHdAw+zpa4EDjPpF8YO77==Etw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: drop support for cc-ldoption
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 24, 2019 at 6:27 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> If you want to see if your linker supports a certain flag, then ask the
> linker directly with ld-option (not the compiler with cc-ldoption).
> Checking for linker flag support is an antipattern that complicates the
> usage of various linkers other than bfd via -fuse-ld={bfd|gold|lld}.
>
> Cc: clang-built-linux@googlegroups.com
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

Applied to linux-kbuild. Thanks.




> This should probably wait until all of the call sites have been cleaned
> up. Masahiro sent them for arm and arm64, while I sent cleanups for all
> the rest.
>
>
>  Documentation/kbuild/makefiles.txt | 14 --------------
>  scripts/Kbuild.include             |  5 -----
>  2 files changed, 19 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 03c065855eaf..d65ad5746f94 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -437,20 +437,6 @@ more details, with real examples.
>         The second argument is optional, and if supplied will be used
>         if first argument is not supported.
>
> -    cc-ldoption
> -       cc-ldoption is used to check if $(CC) when used to link object files
> -       supports the given option.  An optional second option may be
> -       specified if first option are not supported.
> -
> -       Example:
> -               #arch/x86/kernel/Makefile
> -               vsyscall-flags += $(call cc-ldoption, -Wl$(comma)--hash-style=sysv)
> -
> -       In the above example, vsyscall-flags will be assigned the option
> -       -Wl$(comma)--hash-style=sysv if it is supported by $(CC).
> -       The second argument is optional, and if supplied will be used
> -       if first argument is not supported.
> -
>      as-instr
>         as-instr checks if the assembler reports a specific instruction
>         and then outputs either option1 or option2
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 7484b9d8272f..fbfb37d1bcc8 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -138,11 +138,6 @@ cc-disable-warning = $(call try-run,\
>  # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
>  cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
>
> -# cc-ldoption
> -# Usage: ldflags += $(call cc-ldoption, -Wl$(comma)--hash-style=both)
> -cc-ldoption = $(call try-run,\
> -       $(CC) $(1) $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
> -
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> --
> 2.21.0.593.g511ec345e18-goog
>


-- 
Best Regards
Masahiro Yamada
