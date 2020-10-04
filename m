Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E2428295C
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 09:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgJDHQT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 03:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDHQT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 03:16:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5B33C0613CE;
        Sun,  4 Oct 2020 00:16:18 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t23so2424128pji.0;
        Sun, 04 Oct 2020 00:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RXKCh5HpeWdI85i5+9LmXdJRxwwEh3eG7DoEYlLrBrs=;
        b=bwZ7T5i04auIpgSm7UQ8UMzMNlNEZT3XrCsh4ww7bRH5VnfGl2i/reaVOnHgLOPDZE
         hOdOcqWMOcFdY6UN5uqC/7mjyezEqTlOAexf47wiIZVGypkq33Y2Pog7lpEJ6pqEC0XI
         l0+8egMXW/1gqRitFPSRrwgESMN3RES+tI6t9qOi64dTsMEk4hruYZhkTtt3Juiyr6jQ
         uPMIdE2khnk81qvci2EqhcbE9sltH6b8IfEYsisAHvc6CxLhezvaXvek5XusbfdXD+2Q
         hPrd4odTP1wPFy8HNGssbL66fAKB9FVCwIdaL0UzGBOC3/fpemz+xjjk9ChmgN6vGptR
         HUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RXKCh5HpeWdI85i5+9LmXdJRxwwEh3eG7DoEYlLrBrs=;
        b=KOODMadVqVFwZheiyac4Ukj8mXDXqibwO1dRbooQS+sdMEsICOxmeed/Wp14TLWWND
         iQMJGKLdojTN8xgJmHxTOWe5ekCPs1HcC2FzzIWQ2W2p6IQdU+RkoA5cmTXxjybUzRu/
         F9GuC1ZxvLZc7E6TXa19Zvdj/OA3pH99P0bwpgNVVuvRqKqmJ1hwMbqrO0dYJ7y/CHG1
         RKSKEgJRYLcMEbeuGWRIHaXCYPwCOdEKeMasFrSBJg07OkLheMWOkczSPVQ/Qf7auj/8
         BpO54qXUmt2h+GX+E2RmwDc9FIpmqEv384rHAUSmjuw1PlwiEckrJdHL8ToJIkiah+yz
         LaKg==
X-Gm-Message-State: AOAM530YyHgdFZGDAOfqzX8Rny+lpyH5J1ONDfDPeoV9/T22VrfIDylZ
        2dlQ2BNKx4buyp5LPnCVvFs=
X-Google-Smtp-Source: ABdhPJyjRe7RfWWz1VixHGhYVZ2QS9He73mXY+MwEfWKn38yTFwK88Ht+bdLjhezSMnyUN7HB3W5QQ==
X-Received: by 2002:a17:90a:a111:: with SMTP id s17mr10886040pjp.28.1601795777789;
        Sun, 04 Oct 2020 00:16:17 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain (ip68-3-136-221.ph.ph.cox.net. [68.3.136.221])
        by smtp.gmail.com with ESMTPSA id j12sm6523742pjs.21.2020.10.04.00.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 00:16:17 -0700 (PDT)
Date:   Sun, 4 Oct 2020 00:16:14 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] ubsan: Force -Wno-maybe-uninitialized only for GCC
Message-ID: <20201004071614.GC1650@Ryzen-9-3900X.localdomain>
References: <20201002221527.177500-1-keescook@chromium.org>
 <20201002221527.177500-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002221527.177500-4-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 02, 2020 at 03:15:26PM -0700, Kees Cook wrote:
> Clang handles 'maybe-uninitialized' better in the face of using UBSAN,
> so do not make this universally disabled for UBSAN builds.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Well this patch is not strictly necessary because Clang does not support
-Wmaybe-uninitialized anyways :) its flags are -Wuninitialized and
-Wsometimes-uninitialized so the warning stays enabled for UBSAN as it
stands.

However, something like this could still worthwhile because it would
save us one call to cc-disable-warning (yay micro optimizations).

Maybe it just does not need to have a whole new symbol, just make it

ubsan-cflags-$(CONFIG_CC_IS_GCC)

instead of

ubsan-cflags-$(CONFIG_UBSAN)

No strong opinions either way though.

> ---
>  lib/Kconfig.ubsan      | 6 ++++++
>  scripts/Makefile.ubsan | 6 +++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index aeb2cdea0b94..1fc07f936e06 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -36,6 +36,12 @@ config UBSAN_KCOV_BROKEN
>  	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
>  	  in newer releases.
>  
> +config UBSAN_DISABLE_MAYBE_UNINITIALIZED
> +	def_bool CC_IS_GCC
> +	help
> +	  -fsanitize=* options makes GCC less smart than usual and
> +	  increases the number of 'maybe-uninitialized' false-positives.
> +
>  config CC_HAS_UBSAN_BOUNDS
>  	def_bool $(cc-option,-fsanitize=bounds)
>  
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 72862da47baf..c5ef6bac09d4 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -# -fsanitize=* options makes GCC less smart than usual and
> -# increases the number of 'maybe-uninitialized' false-positives.
> -ubsan-cflags-$(CONFIG_UBSAN) += $(call cc-disable-warning, maybe-uninitialized)
> +# The "maybe-uninitialized" warning can be very noisy.
> +ubsan-cflags-$(CONFIG_UBSAN_DISABLE_MAYBE_UNINITIALIZED) += \
> +						$(call cc-disable-warning, maybe-uninitialized)
>  
>  # Enable available and selected UBSAN features.
>  ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
> -- 
> 2.25.1
