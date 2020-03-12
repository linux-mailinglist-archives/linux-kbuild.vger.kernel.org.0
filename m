Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D51B51826DA
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2020 02:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387613AbgCLBuu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 21:50:50 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39424 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387585AbgCLBuu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 21:50:50 -0400
Received: by mail-pg1-f194.google.com with SMTP id s2so2202735pgv.6
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Mar 2020 18:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TNX4E2Oz+P2PqsWFGk/pjWA5oylWbxV8DXQ+/wHZJno=;
        b=fVxMDJREtBZAj62pPpMyCBkOOX53uoDb5O4RTD2jewJ+/oSx/tczt2p2wdtCX8XM5G
         pSAqKUXayRh6axkmQKz/AplA4OqD3m32fN8xIDPZERGd1uOlxgVlcz85BGw2QHu8cmDs
         2mOF3QjglbHTmcyyA4G3fMonpiQLbgvkqUIK5FhYECBuuuOgJHUoHhjm6cBTDswAcYqJ
         DHleBSofPZ69Gtttwk2ODOHFBdQuyn3GBIB/0ncBRs12+mFwhhHclknq6S+h6qWbyHMJ
         04LJvZPWl2VhjrNAhD2ffKscJJir9y7jLyTrH2vrAXwcyzmXAsNSiSJRPczcjbxbS3Uu
         op5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TNX4E2Oz+P2PqsWFGk/pjWA5oylWbxV8DXQ+/wHZJno=;
        b=gXumYIuyeocSFjF2Y0JttdJkc5jwVayAUoSbdmsJGMhMy5W7BboYEiCNQxKRBlqXCJ
         heolVV8B629lTJ6/qK6VN7LdP/myUXm7W+DO7D+Bk+OM+PDqS4CQWLcsCAwnTGS4GnUx
         gDsfL8Oe1VzoCX2e5vZZWOjo4ipup7KbQGFbEHtodk37erP1pDZnfOsvnyXyFJ9E8N1m
         7RPmWQz6hhJIcDtb8w2JeQbS0kRydBaaz4JJkCHKv2t2OmLRzo9krIYkSG8Rw2wokD76
         9C/vpwkoOs12zY6O+km97pPekRG52glwkQh4JDKuKWflgdcydR2lYvimK4A9j77vGPe8
         XB1A==
X-Gm-Message-State: ANhLgQ3IUdKVjiLlJVRnYiJBVrh61DEgKE6srM1FzumBgyggTWScd5H7
        9lktwqfpJyh8aNrPD1Mm5AnP2JBls3sPaUHn/viHow==
X-Google-Smtp-Source: ADFU+vuzhRgnw4SaWfxZFbeh7XsrUD8yW2HZ4wH+4hXd6Kh30bMgMrlpb4+gL9Iasl0wQvcHgsaBJx/mWORy+9PV12A=
X-Received: by 2002:a63:4453:: with SMTP id t19mr5119675pgk.381.1583977848854;
 Wed, 11 Mar 2020 18:50:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200311223725.27662-1-masahiroy@kernel.org>
In-Reply-To: <20200311223725.27662-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 11 Mar 2020 18:50:37 -0700
Message-ID: <CAKwvOdncHn9deGkP_VoOyk7Yhs6YbEeX=DwrMKX-u8RqoVKkcg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sparc: revive __HAVE_ARCH_STRLEN for 32bit sparc
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        sparclinux@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 11, 2020 at 3:37 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Prior to commit 70a6fcf3283a ("[sparc] unify 32bit and 64bit string.h"),
> __HAVE_ARCH_STRLEN was defined in both of string_32.h and string_64.h
>
> It did not unify __HAVE_ARCH_STRLEN, but deleted it from string_32.h
>
> This issue was reported by the kbuild test robot in the trial of
> forcible linking of $(lib-y) to vmlinux.
>
> Fixes: 70a6fcf3283a ("[sparc] unify 32bit and 64bit string.h")

Nice find with the above commit.  Thanks for the patch.  Without it,
looks like 32b sparc is using strlen from lib/string.c.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Reported-by: kbuild test robot <lkp@intel.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Insert a new patch to avoid sparc32 build error
>
>  arch/sparc/include/asm/string.h    | 4 ++++
>  arch/sparc/include/asm/string_64.h | 4 ----
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/sparc/include/asm/string.h b/arch/sparc/include/asm/string.h
> index 3d9cd082716b..001a17baf2d5 100644
> --- a/arch/sparc/include/asm/string.h
> +++ b/arch/sparc/include/asm/string.h
> @@ -37,6 +37,10 @@ void *memmove(void *, const void *, __kernel_size_t);
>  #define __HAVE_ARCH_MEMCMP
>  int memcmp(const void *,const void *,__kernel_size_t);
>
> +/* Now the str*() stuff... */
> +#define __HAVE_ARCH_STRLEN
> +__kernel_size_t strlen(const char *);
> +
>  #define __HAVE_ARCH_STRNCMP
>  int strncmp(const char *, const char *, __kernel_size_t);
>
> diff --git a/arch/sparc/include/asm/string_64.h b/arch/sparc/include/asm/string_64.h
> index ee9ba67321bd..d5c563058a5b 100644
> --- a/arch/sparc/include/asm/string_64.h
> +++ b/arch/sparc/include/asm/string_64.h
> @@ -12,8 +12,4 @@
>
>  #include <asm/asi.h>
>
> -/* Now the str*() stuff... */
> -#define __HAVE_ARCH_STRLEN
> -__kernel_size_t strlen(const char *);
> -
>  #endif /* !(__SPARC64_STRING_H__) */
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
