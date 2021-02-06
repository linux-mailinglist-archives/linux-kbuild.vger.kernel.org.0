Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9FB311D2A
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Feb 2021 13:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhBFMrT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 07:47:19 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32475 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhBFMrS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 07:47:18 -0500
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 116CkMn0021526;
        Sat, 6 Feb 2021 21:46:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 116CkMn0021526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612615582;
        bh=9Rzc5vv0hXi2qq4VeEMWQtc+VBWOzvTwws6J09xsVOo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QeIM2WesdOzDgMqtUG/xXS7FQLhBIXWuqi86vB7PAixHQkCIKkj5gRSjn5WSfu8ik
         QVMSdwLKb7zTSE42eL1MwUObXJUBhr6LeqkmuftQ+DpzUwqrMMFFADKokJQC1q7zoT
         QfISslyW0zpUxxJ1CuyrA1Qk1cN/EXznMsGmODHEAp2AXR+cS+b6m/EwJAL9WNVJ+Q
         LKnPmrdEzJv/eO8qjZsx0pP1DS9nnHBXJ2RmY2HuerTpxG4/VEoRqCMSGEg9XGivVq
         oK4I4hK6LCB9xVl7QPZMhHFgHy8w6cdNbP11C15HRHuW4Cy7+mLiQqQX9w+H6RJser
         uHTlEmE4VL3oA==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id k22so599723pll.6;
        Sat, 06 Feb 2021 04:46:22 -0800 (PST)
X-Gm-Message-State: AOAM531LJRxKMgfqVhNXv5qHbz9j9zz8scTVnZV116UPD85oRwhb4rda
        cXLA6HwVcDtpQ+T942LY/zPztC80VsH0N+flWuQ=
X-Google-Smtp-Source: ABdhPJxJS52xzMoza4f/5VvZ+g++sQunIQNG/ghLsQ3I+xTuFo8PlQuNJSoejZN6qsSV5AM7SzNIRVLchZTctuP1VsE=
X-Received: by 2002:a17:902:bb87:b029:e1:d1f:2736 with SMTP id
 m7-20020a170902bb87b02900e10d1f2736mr8380973pls.1.1612615581575; Sat, 06 Feb
 2021 04:46:21 -0800 (PST)
MIME-Version: 1.0
References: <20210206035033.2036180-1-sashal@kernel.org> <20210206035033.2036180-3-sashal@kernel.org>
In-Reply-To: <20210206035033.2036180-3-sashal@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Feb 2021 21:45:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASoWNfEAzQYOo7_PqgU61iiZk8i=F-JS38yn5AnfQNhzQ@mail.gmail.com>
Message-ID: <CAK7LNASoWNfEAzQYOo7_PqgU61iiZk8i=F-JS38yn5AnfQNhzQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: introduce KERNEL_VERSION2 and LINUX_VERSION_CODE2
To:     Sasha Levin <sashal@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 6, 2021 at 12:50 PM Sasha Levin <sashal@kernel.org> wrote:
>
> SUBLEVEL only has 8 bits of space, which means that we'll overflow it
> once it reaches 256.
>
> Few of the stable branches will imminently overflow SUBLEVEL while
> there's no risk of overflowing VERSION.
>
> Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
> should create a better balance between the different version numbers we
> use.
>
> We can't however use the original KERNEL_VERSION and LINUX_VERSION_CODE
> as userspace has created ABI dependency on their structure, and we risk
> breaking this userspace by modifying the layout of the version integers.
>
> Cc: stable@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Makefile                                       | 8 +++++++-
>  drivers/net/ethernet/mellanox/mlx5/core/main.c | 4 ++--
>  drivers/usb/core/hcd.c                         | 4 ++--
>  drivers/usb/gadget/udc/aspeed-vhub/hub.c       | 4 ++--
>  include/linux/usb/composite.h                  | 4 ++--
>  kernel/sys.c                                   | 2 +-
>  tools/perf/tests/bpf-script-example.c          | 2 +-
>  tools/perf/tests/bpf-script-test-kbuild.c      | 2 +-
>  tools/perf/tests/bpf-script-test-prologue.c    | 2 +-
>  9 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 157be50c691e5..2177c548e4c24 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1266,7 +1266,13 @@ define filechk_version.h
>                 expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
>         fi;                                                              \
>         echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
> -       ((c) > 255 ? 255 : (c)))'
> +       ((c) > 255 ? 255 : (c)))';                                       \
> +       echo \#define LINUX_VERSION_CODE2 $(shell                        \
> +       expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \


Is this needed?
No one in this patch uses LINUX_VERSION_CODE2.

The in-kernel code can use
LINUX_VERSION_MAJOR/PATCHLEVEL/SUBLEVEL directly.


Userspace does not need LINUX_VERSION_CODE2 either.

Your comment in 2/3 states that
userspace only decodes MAJOR and PATCHLEVEL fields,
so LINUX_VERSION_CODE will still do well.




> index ab4b98b3165db..a56bf381335e9 100644
> --- a/tools/perf/tests/bpf-script-example.c
> +++ b/tools/perf/tests/bpf-script-example.c
> @@ -5,7 +5,7 @@
>   */
>  #ifndef LINUX_VERSION_CODE
>  # error Need LINUX_VERSION_CODE
> -# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
> +# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'


Is this change needed?




>  #endif
>  #define BPF_ANY 0
>  #define BPF_MAP_TYPE_ARRAY 2
> diff --git a/tools/perf/tests/bpf-script-test-kbuild.c b/tools/perf/tests/bpf-script-test-kbuild.c
> index 219673aa278fb..21663295d5b5a 100644
> --- a/tools/perf/tests/bpf-script-test-kbuild.c
> +++ b/tools/perf/tests/bpf-script-test-kbuild.c
> @@ -5,7 +5,7 @@
>   */
>  #ifndef LINUX_VERSION_CODE
>  # error Need LINUX_VERSION_CODE
> -# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
> +# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
>  #endif
>  #define SEC(NAME) __attribute__((section(NAME), used))
>
> diff --git a/tools/perf/tests/bpf-script-test-prologue.c b/tools/perf/tests/bpf-script-test-prologue.c
> index bd83d364cf30d..8db19e70813cc 100644
> --- a/tools/perf/tests/bpf-script-test-prologue.c
> +++ b/tools/perf/tests/bpf-script-test-prologue.c
> @@ -5,7 +5,7 @@
>   */
>  #ifndef LINUX_VERSION_CODE
>  # error Need LINUX_VERSION_CODE
> -# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x40200" into llvm section of ~/.perfconfig'
> +# error Example: for 4.2 kernel, put 'clang-opt="-DLINUX_VERSION_CODE=0x4020000" into llvm section of ~/.perfconfig'
>  #endif
>  #define SEC(NAME) __attribute__((section(NAME), used))
>
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
