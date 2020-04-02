Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7852019C785
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2020 19:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388822AbgDBRBg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Apr 2020 13:01:36 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58726 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732625AbgDBRBg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Apr 2020 13:01:36 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 032H1TeJ031701;
        Fri, 3 Apr 2020 02:01:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 032H1TeJ031701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585846890;
        bh=1mH4cw2yYcVZRUVlvx7GMUbn2oki49fXdwmWN7fbBsc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rrl7k6aVw3iI8Z3PirOB6ZMA0fHnC57gsk0b2BLP+Lo8ry3278PY9LFojc2cEijdL
         favhYLtVbKdt3pgy/ChzgY6/ofWR40HQnneX85xefvGjWsCLYAxgq+39OQpEHFaC/l
         osspRAMc38pFIYbjtbXkvqzP2lr+6hu0Tc4yvc6kiO7KYNKCUzPTmAooT9911O1p1R
         xxS/OHhG/OfVkPg6DcHufavsku3e/YJqEiT6VvWW7DB2MtCxpdhWeQknl4vbIrgZaZ
         qVQxeKG7phAMWvOZOKmoJdcX3ytam+G2EEg/QFo5BZbMa2TimyVgqfI0nqQlsZPRbE
         BEqO3N1Jlqnug==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id u9so2851516vsp.6;
        Thu, 02 Apr 2020 10:01:30 -0700 (PDT)
X-Gm-Message-State: AGi0PubkUT6/Rcj4r7NU48cdqp0DT3rdsIwb51hFRHnG+jZ2+jDYFrU1
        9SntwlBlmdZ+CznIOAX2ZUzEsVETYrexcnN4D08=
X-Google-Smtp-Source: APiQypL4Rvy03M3ygmfpwsDxMy3+2fu8bl+1s8iqt4E7kRsuRDEYA0XDULMd7iH+08rmBTvCd8fPGu6VcrUOLgyYtAw=
X-Received: by 2002:a67:33cb:: with SMTP id z194mr3175293vsz.155.1585846888868;
 Thu, 02 Apr 2020 10:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <202004020117.6E434C035@keescook>
In-Reply-To: <202004020117.6E434C035@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Apr 2020 02:00:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
Message-ID: <CAK7LNAQGTAgtADfY4H-k8X1J9nTMeOWvo8ZFfrUSHQUbhgcLKw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: Include $LD version in /proc/version
To:     Kees Cook <keescook@chromium.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Kees,

On Thu, Apr 2, 2020 at 5:18 PM Kees Cook <keescook@chromium.org> wrote:
>
> When doing Clang builds of the kernel, it is possible to link with
> either ld.bfd (binutils) or ld.lld (LLVM), but it is not possible to
> discover this from a running kernel. Add the "$LD -v" output to
> /proc/version.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  init/Makefile       | 2 +-
>  scripts/mkcompile_h | 8 ++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/init/Makefile b/init/Makefile
> index 6246a06364d0..82c15bdb42d7 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>         @$($(quiet)chk_compile.h)
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
>         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> -       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
> +       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 3a5a4b210c86..f98c07709370 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -6,7 +6,8 @@ ARCH=$2
>  SMP=$3
>  PREEMPT=$4
>  PREEMPT_RT=$5
> -CC=$6
> +LD=$6
> +CC=$7


Just a nit.

If you just append 'LD',
you do not need to touch the 'CC=$6' line.


If you do not mind, I will fold the following
on top of your patch.




--- a/init/Makefile
+++ b/init/Makefile
@@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
        @$($(quiet)chk_compile.h)
        $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
        "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
-       "$(CONFIG_PREEMPT_RT)" "$(LD)" "$(CC) $(KBUILD_CFLAGS)"
+       "$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)" "$(LD)"
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 8b38a96163e2..5b80a4699740 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -6,8 +6,8 @@ ARCH=$2
 SMP=$3
 PREEMPT=$4
 PREEMPT_RT=$5
-LD=$6
-CC=$7
+CC=$6
+LD=$7






--
Best Regards
Masahiro Yamada
