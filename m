Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA34637B692
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 May 2021 09:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhELHIl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 May 2021 03:08:41 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33811 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbhELHIl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 May 2021 03:08:41 -0400
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 14C77Dmd021378
        for <linux-kbuild@vger.kernel.org>; Wed, 12 May 2021 16:07:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 14C77Dmd021378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620803233;
        bh=ANr3RlemlDGsqzdZNV1FUnUy8W+neY5ECDbySyNT6IQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IF6mwWvoQgtFWCEM+r4T1KnP1wLMVRyPo1ZqNi89vmr1sDzhUTlP7wYNqkmfiCf46
         B2W1wvEiEx8W2NhNK1LQEYHX20DxVmf2JVeypUa/avq6BWBQTtc3UzwFbzNyMKbT+D
         jnt03O6H4jQZZwgpkZkvow6k04r3uvm915Rr69wH+3JJeceyvmCNbc7s6Ak0aD1Oom
         Q8gfdFwJMQOjKlZoPuqkUGeOv/ABsXYlAUYh43tzKbuZcItb7DiITilKYHcc/8fVih
         934/i5N34eMg/P6z+PFg8U4n11OK8R6oK3yplLpajGb8PfRqi7FSpy7ASgfj6Ibn9A
         eHe/QCnGEsGWg==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id c17so17865329pfn.6
        for <linux-kbuild@vger.kernel.org>; Wed, 12 May 2021 00:07:13 -0700 (PDT)
X-Gm-Message-State: AOAM530q8kygIYGBU+ci2q70Np46haIcsl3CMg1yVNSlFWVVQr3zjq6B
        32zBDLsWGyVcu0ELx5uECtTNE50WEqkeDAtEFdk=
X-Google-Smtp-Source: ABdhPJx9btIR+KEXMyyHUM/1PLE4JJvnI2oNvMfmCmgrYiydMdZxZe+EFZlkGusUp2TnFgdO3K+/ffbyO1XSPsFLuPA=
X-Received: by 2002:a63:a547:: with SMTP id r7mr34573033pgu.7.1620803232570;
 Wed, 12 May 2021 00:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <2321702f-b888-87f6-b314-8e5734ee7fa9@infradead.org>
In-Reply-To: <2321702f-b888-87f6-b314-8e5734ee7fa9@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 12 May 2021 16:06:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_-c+_9wc7wXo2Q7E_wEY+Mhg1XvxmDy7VHwVcEyBFeA@mail.gmail.com>
Message-ID: <CAK7LNAR_-c+_9wc7wXo2Q7E_wEY+Mhg1XvxmDy7VHwVcEyBFeA@mail.gmail.com>
Subject: Re: arch/um/include/asm/Kbuild question
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        richard -rw- weinberger <richard.weinberger@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 12, 2021 at 3:18 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi.
>
> I thought that adding
> +generic-y += rwonce.h
>
> to arch/um/include/asm/Kbuild would fix a build problem:
>
>   CC [M]  fs/hostfs/hostfs_user.o
> In file included from ../include/asm-generic/div64.h:27,
>                  from ../fs/hostfs/hostfs_user.c:21:
> include/linux/compiler.h:248:10: fatal error: asm/rwonce.h: No such file or directory
>   248 | #include <asm/rwonce.h>
>       |          ^~~~~~~~~~~~~~
>
>
> but it doesn't seem to be helping.
> Do I need to use mandatory-y instead?
>
> Or is arch/um/ with ARCH=um and SUBARCH=i386 just "different"?


I see

  mandatory-y += rwonce.h

in include/asm-generic/Kbuild.


arch/x86/include/generated/asm/rwonce.h
is generated.


Is it still failing?



>
> The build error is:
> ERROR: modpost: "__divdi3" [fs/hostfs/hostfs.ko] undefined!
>
> and my current patch attempt is below
>
> Thanks.
>
> ---
> From: Randy Dunlap <rdunlap@infradead.org>
>
> <asm-generic/div64.h> wants rwonce.h, so add rwonce.h to the
> arch/um/include/asm/Kbuild generic-y list of header files.
>
> ERROR: modpost: "__divdi3" [fs/hostfs/hostfs.ko] undefined!
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
>  arch/um/include/asm/Kbuild |    1 +
>  fs/hostfs/hostfs_user.c    |   13 +++++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> --- linux-next-20210511.orig/fs/hostfs/hostfs_user.c
> +++ linux-next-20210511/fs/hostfs/hostfs_user.c
> @@ -17,6 +17,7 @@
>  #include <sys/syscall.h>
>  #include "hostfs.h"
>  #include <utime.h>
> +#include <asm-generic/div64.h>
>
>  static void stat64_to_hostfs(const struct stat64 *buf, struct hostfs_stat *p)
>  {
> @@ -242,17 +243,21 @@ int set_attr(const char *file, struct ho
>                         return err;
>
>                 times[0].tv_sec = st.atime.tv_sec;
> -               times[0].tv_usec = st.atime.tv_nsec / 1000;
> +               times[0].tv_usec = st.atime.tv_nsec;
> +               do_div(times[0].tv_usec, 1000);
>                 times[1].tv_sec = st.mtime.tv_sec;
> -               times[1].tv_usec = st.mtime.tv_nsec / 1000;
> +               times[1].tv_usec = st.mtime.tv_nsec;
> +               do_div(times[1].tv_usec, 1000);
>
>                 if (attrs->ia_valid & HOSTFS_ATTR_ATIME_SET) {
>                         times[0].tv_sec = attrs->ia_atime.tv_sec;
> -                       times[0].tv_usec = attrs->ia_atime.tv_nsec / 1000;
> +                       times[0].tv_usec = attrs->ia_atime.tv_nsec;
> +                       do_div(times[0].tv_usec, 1000);
>                 }
>                 if (attrs->ia_valid & HOSTFS_ATTR_MTIME_SET) {
>                         times[1].tv_sec = attrs->ia_mtime.tv_sec;
> -                       times[1].tv_usec = attrs->ia_mtime.tv_nsec / 1000;
> +                       times[1].tv_usec = attrs->ia_mtime.tv_nsec;
> +                       do_div(times[1].tv_usec, 1000);
>                 }
>
>                 if (fd >= 0) {
> --- linux-next-20210511.orig/arch/um/include/asm/Kbuild
> +++ linux-next-20210511/arch/um/include/asm/Kbuild
> @@ -20,6 +20,7 @@ generic-y += param.h
>  generic-y += pci.h
>  generic-y += percpu.h
>  generic-y += preempt.h
> +generic-y += rwonce.h
>  generic-y += softirq_stack.h
>  generic-y += switch_to.h
>  generic-y += topology.h
>


-- 
Best Regards
Masahiro Yamada
