Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 361E828BD64
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Oct 2020 18:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390282AbgJLQTf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 12:19:35 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:29613 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390043AbgJLQTe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 12:19:34 -0400
X-Greylist: delayed 2761 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Oct 2020 12:19:33 EDT
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 09CGJBXw003349;
        Tue, 13 Oct 2020 01:19:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 09CGJBXw003349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602519552;
        bh=HSVjCaHtsc2dmRdoJJRl8nIVTZkEJZ3ZKN4IOKEiAz0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qNwNh7mRnCz6XCKrCTUait4q+4+oQXzlRXXLX6DKNwvlMSdKNT8Ve4P6Pkl0rmITX
         HY4sE0RwIrcNNBKM063zq/jRI7s3rWdgs5VKJ/xRxa4hCbdrdmPcCjLTo3zHwXzzhm
         +5R3WLyy6RkglKVLKaum2IJaZw0GEYmgLeeROtLr0qM2rY4u4Fh4KMlOUySMxXzu4S
         93uzhnXobNao2ZfiKUDcPEtqTPeeLJlhS3TIZwEn3M5K9zUZlAsZMPcufk0VCAroL6
         bAJNCFa3Q0Lmyn150b8J7dwLDgz98NzXeS6NwmnByHzdT9CJLtSQAWdh1w1K/FPaB8
         L7AZlO4Sbihhg==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id n14so13925016pff.6;
        Mon, 12 Oct 2020 09:19:11 -0700 (PDT)
X-Gm-Message-State: AOAM533/lZ0EVAzAsyfjp7XQ3EyFAKsKzAhN6mDJDMckvxcZ/Dv84B+D
        5IPH/NSibOeGU/Q5D2dwl+6dKEW/Ne0yrqbh2A0=
X-Google-Smtp-Source: ABdhPJzngWagrH7sftCmJHLWQj8sGBu5RbPw53TOYBqMF5rPdKgCNRSBDYInuS5dENRcQV0vKp3ZD6d3YNumIy51UKs=
X-Received: by 2002:a17:90b:1b12:: with SMTP id nu18mr20160486pjb.153.1602519550926;
 Mon, 12 Oct 2020 09:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
In-Reply-To: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 13 Oct 2020 01:18:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
Message-ID: <CAK7LNAQwib66YwnMuN9qGQBs8dqqVaufOr9BqYMKfYUqiXu6jg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] use interpreters to invoke scripts
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 4, 2020 at 12:19 AM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>
> This patch series aims at removing the dependency on execute
> bit of the scripts in the kbuild system.
>
> If not working with fresh clone of linux-next, clean the srctree:
> make distclean
> make tools/clean
>
> To test the dependency on execute bits, I tried building the
> kernel after removing x-bits for all files in the repository.
> Removing execute bits:
> for i in $(find -executable -type f); do chmod -x $i; done
>
> Any attempts to configure (or build) the kernel fail because of
> 'Permission denied' on scripts with the following error:
> $ make allmodconfig
> sh: ./scripts/gcc-version.sh: Permission denied
> init/Kconfig:34: syntax error
> init/Kconfig:33: invalid statement
> init/Kconfig:34: invalid statement
> sh: ./scripts/ld-version.sh: Permission denied
> init/Kconfig:39: syntax error
> init/Kconfig:38: invalid statement
> sh: ./scripts/clang-version.sh: Permission denied
> init/Kconfig:49: syntax error
> init/Kconfig:48: invalid statement
> make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
> make: *** [Makefile:606: allmodconfig] Error 2
>
> Changes:
> 1. Adds specific interpreters (in Kconfig) to invoke
> scripts.
>
> After this patch I could successfully do a kernel build
> without any errors.
>
> 2. Again, adds specific interpreters to other parts of
> kbuild system.
>
> I could successfully perform the following make targets after
> applying the PATCH 2/2:
> make headerdep
> make kselftest-merge
> make rpm-pkg
> make perf-tar-src-pkg
> make ARCH=ia64 defconfig
> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare
>
> Following changes in PATCH 2/2 are not yet tested:
> arch/arm64/kernel/vdso32/Makefile
> arch/nds32/kernel/vdso/Makefile
> scripts/Makefile.build
>
> Ujjwal Kumar (2):
>   kconfig: use interpreters to invoke scripts
>   kbuild: use interpreters to invoke scripts
>
>  Makefile                          |  4 ++--
>  arch/arm64/kernel/vdso/Makefile   |  2 +-
>  arch/arm64/kernel/vdso32/Makefile |  2 +-
>  arch/ia64/Makefile                |  4 ++--
>  arch/nds32/kernel/vdso/Makefile   |  2 +-
>  init/Kconfig                      | 16 ++++++++--------
>  scripts/Makefile.build            |  2 +-
>  scripts/Makefile.package          |  4 ++--
>  8 files changed, 18 insertions(+), 18 deletions(-)
>
> --
> 2.26.2
>


Andrew Morton suggested and applied the doc patch
(commit e9aae7af4601688386 in linux-next),
but did not pick up this series.

It is difficult to predict which patch he would
pick up, and which he would not.


I can apply this series
together with Lukas' base patch.


I pointed out possible mistakes in 2/2.
I can locally fix them up if you agree.


BTW, Kees Cook suggested dropping the x bit
from all scripts, but I did not agree with that part.


In the doc change, Lukas mentioned
"further clean-up patches", but I hope
it does not mean dropping the x bits.


--
Best Regards

Masahiro Yamada
