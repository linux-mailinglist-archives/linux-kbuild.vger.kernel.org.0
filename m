Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A43C2E18D0
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 07:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgLWGRH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 01:17:07 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59329 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726069AbgLWGRH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 01:17:07 -0500
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BN6G2T7012500;
        Wed, 23 Dec 2020 15:16:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BN6G2T7012500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608704163;
        bh=YcR9XCdTcqEdPIBqd1+ulUn0LN4dKqfLsym+wZS9IJ8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1m7EDcDHobE5H/KYAAsy2pQehm3uLRDdG+Ic38XpRNtdBScA2Oo2fVKtqcfCr5nUF
         Hpsc+9RFTw3vWh3tmfGdjJRK+0WLToAD71RYkgD3/mKpjjxj6PuJRxhT1xqf7VDMVH
         jqRjH/k2npHGh0ULa+qZ13nbbIqvH0WbMiWs2OdgUqXRt/4mqVm4mWO4Pa5cPnO/Wn
         LpCgdV1XpHJi4GUjEExos6vRPuoN56oAMYrDUcILNX2NerQ4ZLTHXvW7pUo8Ijy2AD
         sITMOJf4r4JLW8hxUXRh8Ps1TQNIUXQa79G98ApNUQjIk+gm1PDTlXPHMkrMNuI1T/
         2J0JNEBTtPS5g==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id w1so627588pjc.0;
        Tue, 22 Dec 2020 22:16:03 -0800 (PST)
X-Gm-Message-State: AOAM5335T6aLpp5GkX2fhIjrAqlHqzvSJjRoVk+kmlPK2EbYQGH75A+V
        Y9fvGmBLiHcS9RG8DVeJ4pCNw6aX2QZRE3PZT+k=
X-Google-Smtp-Source: ABdhPJxXleNbJxvpk4Em/2AF/EVUORw/dVXOcMx78a3SwYfTsZrJwKoLZyNiS5JUCfGHp631zKu9R2XtkgyT3C3mKyw=
X-Received: by 2002:a17:90a:d18c:: with SMTP id fu12mr24488813pjb.153.1608704161762;
 Tue, 22 Dec 2020 22:16:01 -0800 (PST)
MIME-Version: 1.0
References: <20201219183911.181442-1-masahiroy@kernel.org>
In-Reply-To: <20201219183911.181442-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 23 Dec 2020 15:15:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARhCdhpniwXzd1a9H-OpgksBqxakOjiDEAHiwWTmrStoQ@mail.gmail.com>
Message-ID: <CAK7LNARhCdhpniwXzd1a9H-OpgksBqxakOjiDEAHiwWTmrStoQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: avoid static_assert for genksyms"
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 20, 2020 at 3:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This reverts commit 14dc3983b5dff513a90bd5a8cc90acaf7867c3d0.
>
> Macro Elver had sent a fix proper fix earlier, and also pointed out
> corner cases:
>
> "I guess what you propose is simpler, but might still have corner cases
> where we still get warnings. In particular, if some file (for whatever
> reason) does not include build_bug.h and uses a raw _Static_assert(),
> then we still get warnings. E.g. I see 1 user of raw _Static_assert()
> (drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h )."
>
> I believe the raw use of _Static_assert() should be allowed, so this
> should be fixed in genksyms.
>
> Even after commit 14dc3983b5df ("kbuild: avoid static_assert for
> genksyms"), I confirmed the following test code emits the warning.
>
>   ---------------->8----------------
>   #include <linux/export.h>
>
>   _Static_assert((1 ?: 0), "");
>
>   void foo(void) { }
>   EXPORT_SYMBOL(foo);
>   ---------------->8----------------
>
>   WARNING: modpost: EXPORT symbol "foo" [vmlinux] version generation failed, symbol will not be versioned.
>
> Now that commit 869b91992bce ("genksyms: Ignore module scoped

I updated the commit id in the mainline.

     9ab55d7f240f


Now, applied to linux-kbuild.



> _Static_assert()") fixed this issue properly, the workaround should
> be reverted.
>
> Link: https://lkml.org/lkml/2020/12/10/845
> Cc: Marco Elver <elver@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> I will apply this after Macro's patch is pulled.
>
>
>
>  include/linux/build_bug.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/include/linux/build_bug.h b/include/linux/build_bug.h
> index 7bb66e15b481..e3a0be2c90ad 100644
> --- a/include/linux/build_bug.h
> +++ b/include/linux/build_bug.h
> @@ -77,9 +77,4 @@
>  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>
> -#ifdef __GENKSYMS__
> -/* genksyms gets confused by _Static_assert */
> -#define _Static_assert(expr, ...)
> -#endif
> -
>  #endif /* _LINUX_BUILD_BUG_H */
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
