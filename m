Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CCB1BA7FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2020 17:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgD0Paf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Apr 2020 11:30:35 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:49264 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbgD0Pae (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 11:30:34 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 03RFUIqq028481;
        Tue, 28 Apr 2020 00:30:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 03RFUIqq028481
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588001419;
        bh=/LO6tICgE78MZNhI1NfW4LOOHrAlbACrYCGyWo2BTqw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qST2hDpnTJl4/f26VsFJkL2qqFyxkFzgWcd1JWQEXc2vTHFuTJuzQnStVdwoX0ka2
         2MhT452jqIkwBj7bx6uzMJwk9p5j9qZbv2j9INX6LVhYdfDC/tXHS1la9J2pH2IZi5
         VWiccNvsoe6oC+Ylx3jYRdbbaC/7VgWKyMFWmDVoioTf37iduYa3SMFii4fXiWspbe
         29FLS2ci0qH5+CG0H+S72RDHxvhNNIErObNghwvt+PIrgE2IsaxvbkO+LZIAuaEfJX
         O/bYbRttBGmSy6DJoo/vCA7T8lCeYlA5lhxk41nsku5TqNgI9F6HljC1wwNQDYa9Ux
         Vo+mkDcJ6Q0Ug==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id q200so4909364vka.13;
        Mon, 27 Apr 2020 08:30:19 -0700 (PDT)
X-Gm-Message-State: AGi0PuYtrO6sysjQPoERhd9tBeI2jtl12YRhDLyaPM4uxO3VN1UhF9SH
        uzJnFHF/FdUnj/M5JPaplKbY8xLHNzR6V4u4JCE=
X-Google-Smtp-Source: APiQypKPWSgj1WNxoDTf/RzqLmXb5cExoxDiUbXylHQF5TuEtk2FzTU1h3dF5UyrhWd/507lk3BPLfx1iFmCKsrqDhc=
X-Received: by 2002:a1f:2a13:: with SMTP id q19mr4301247vkq.73.1588001417846;
 Mon, 27 Apr 2020 08:30:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200423142354.312088-1-masahiroy@kernel.org> <20200423142354.312088-4-masahiroy@kernel.org>
In-Reply-To: <20200423142354.312088-4-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 28 Apr 2020 00:29:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMXV6F_LpEr3AhAJSNt8TAGHDMxR4XFQ7L7Ha=__Dh8A@mail.gmail.com>
Message-ID: <CAK7LNASMXV6F_LpEr3AhAJSNt8TAGHDMxR4XFQ7L7Ha=__Dh8A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: use CONFIG_CC_VERSION_TEXT to construct
 LINUX_COMPILER macro
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 23, 2020 at 11:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> scripts/mkcompile_h runs $(CC) just for getting the version string.
> Re-use CONFIG_CC_VERSION_TEXT to optimize it.
>
> For GCC, this slightly changes the version string. I do not think it
> is a big deal as we do not have the defined format for LINUX_COMPILER.
> In fact, the recent commit 4dcc9a88448a ("kbuild: mkcompile_h:
> Include $LD version in /proc/version") added the linker version.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - new patch
>
>  init/Makefile       | 2 +-
>  scripts/mkcompile_h | 3 +--
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/init/Makefile b/init/Makefile
> index d45e967483b2..30c7345e4fe2 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
>         @$($(quiet)chk_compile.h)
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
>         "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
> -       "$(CONFIG_PREEMPT_RT)" "$(CC)" "$(LD)"
> +       "$(CONFIG_PREEMPT_RT)" "$(CONFIG_CC_VERSION_TEXT)" "$(LD)"


This causes a build error.

I will fix it up as follows:




diff --git a/init/Makefile b/init/Makefile
index 30c7345e4fe2..57499b1ff471 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -35,4 +35,4 @@ include/generated/compile.h: FORCE
        @$($(quiet)chk_compile.h)
        $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@   \
        "$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"    \
-       "$(CONFIG_PREEMPT_RT)" "$(CONFIG_CC_VERSION_TEXT)" "$(LD)"

+       "$(CONFIG_PREEMPT_RT)" $(CONFIG_CC_VERSION_TEXT) "$(LD)"




> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 5b80a4699740..baf3ab8d9d49 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -6,7 +6,7 @@ ARCH=$2
>  SMP=$3
>  PREEMPT=$4
>  PREEMPT_RT=$5
> -CC=$6
> +CC_VERSION="$6"
>  LD=$7
>
>  vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
> @@ -62,7 +62,6 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>    printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
>    echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
>
> -  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
>    LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
>                       | sed 's/[[:space:]]*$//')
>    printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
> --
> 2.25.1
>


--
Best Regards
Masahiro Yamada
