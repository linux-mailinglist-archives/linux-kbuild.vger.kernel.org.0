Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369D362D4D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 03:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfGIBK5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jul 2019 21:10:57 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30792 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfGIBK5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jul 2019 21:10:57 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x691AnSt017037;
        Tue, 9 Jul 2019 10:10:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x691AnSt017037
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562634650;
        bh=IOwQGTfU4ebKDBmJHalk2uzWGfPFmTPrl0A5OrM7+Os=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fVLfhr49DCkywMnybofx5e0NO7NRm9Jm7umee48aGhPLxR3UbyrflToAtImlixuqV
         xHkcdTUbovKPb46Fq+fGhXf2K/fuDSBRu6elB1JopUV21pi38/wu5EjCnf0kIt8ImG
         NxvWfHiIflRDmc7fx1ZWZDvydZ6CXmfZsOWR2V1S2vXeIk6OFcv4u5bt5dvH8YMF0e
         jgf/jdZ40VrWG2To8vAR2ot2F9lp6LpmQ+qLZDUfu8y/Ut2uGsF6G98aaqGu33e87R
         A1mOFAyOMQezSPq+h2voqFxNAGmU5dRdpsQAwuWLaHY7qP/yM+BxpcChpENTNrUxMD
         CkxjKJAZ5BWCQ==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id o2so5734368uae.10;
        Mon, 08 Jul 2019 18:10:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWWzeHTx51qYhaTWLGjhD4NrUsqX0Ly8xH1nAPKUtUX0JRXUR7B
        UQXuiew7RbnbV00z3Kd+gMBSaS+pmR40Lsm315A=
X-Google-Smtp-Source: APXvYqzTtVnJ5vHaoTQu6SmM6VKV08euJlrWHu9PZx1ejUCWdpfuBh1WApgD7WIrNyGfSQGFNP8uS015OlZvOkfHSLw=
X-Received: by 2002:ab0:5ea6:: with SMTP id y38mr2853334uag.40.1562634648634;
 Mon, 08 Jul 2019 18:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190701005845.12475-1-yamada.masahiro@socionext.com> <20190701005845.12475-4-yamada.masahiro@socionext.com>
In-Reply-To: <20190701005845.12475-4-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 9 Jul 2019 10:10:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjYtGGe2Jk9H6VPU5_G_X6xbMU=KS3oPgFrAbGyMNePQ@mail.gmail.com>
Message-ID: <CAK7LNARjYtGGe2Jk9H6VPU5_G_X6xbMU=KS3oPgFrAbGyMNePQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] kbuild: do not create wrappers for header-test-y
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 1, 2019 at 10:00 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> header-test-y does not work with headers in sub-directories.
>
> For example, you may want to write a Makefile, like this:
>
> include/linux/Kbuild:
>
>   header-test-y += mtd/nand.h
>
> This entry will create a wrapper include/linux/mtd/nand.hdrtest.c
> with the following content:
>
>   #include "mtd/nand.h"
>
> To make this work, we need to add $(srctree)/include/linux to the
> header search path. It would be tedious to add ccflags-y.
>
> Instead, we could change the *.hdrtest.c rule to wrap:
>
>   #include "nand.h"
>
> This works for in-tree build since #include "..." searches in the
> relative path from the header with this directive. For O=... build,
> we need to add $(srctree)/include/linux/mtd to the header search path,
> which will be even more tedious.
>
> After all, I thought it would be handier to compile headers directly
> without creating wrappers.
>
> I added a new build rule to compile %.h into %.h.s
>
> The target is %.h.s instead of %.h.o because it is slightly faster.
> Also, as for GCC, an empty assembly is smaller than an empty object.
>
> I wrote the build rule:
>
>   $(CC) $(c_flags) -S -o $@ -x c /dev/null -include $<
>
> instead of:
>
>   $(CC) $(c_flags) -S -o $@ -x c $<
>
> Both work fine with GCC, but the latter is bad for Clang.
>
> This comes down to the difference in the -Wunused-function policy.
> GCC does not warn about unused 'static inline' functions at all.
> Clang does not warn about the ones in included headers, but does
> about the ones in the source. So, we should handle headers as
> headers, not as source files.
>
> In fact, this has been hidden since commit abb2ea7dfd82 ("compiler,
> clang: suppress warning for unused static inline functions"), but we
> should not rely on that.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Tested-by: Jani Nikula <jani.nikula@intel.com>
> ---

To exclude *.h.s from kernel-devel rpm,
I will squash the following change:

diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 009147d4718e..2d29df4a0a53 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -31,7 +31,7 @@ PROVIDES="$PROVIDES kernel-$KERNELRELEASE"
 __KERNELRELEASE=$(echo $KERNELRELEASE | sed -e "s/-/_/g")
 EXCLUDES="$RCS_TAR_IGNORE --exclude=.tmp_versions --exclude=*vmlinux* \
 --exclude=*.o --exclude=*.ko --exclude=*.cmd --exclude=Documentation \
---exclude=.config.old --exclude=.missing-syscalls.d"
+--exclude=.config.old --exclude=.missing-syscalls.d --exclude=*.s"

 # We can label the here-doc lines for conditional output to the spec file
 #







-- 
Best Regards
Masahiro Yamada
