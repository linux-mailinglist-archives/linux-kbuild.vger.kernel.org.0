Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9B8B28294E
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 09:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDHIw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 03:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDHIw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 03:08:52 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEA1C0613CE;
        Sun,  4 Oct 2020 00:08:52 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id h6so3025242pgk.4;
        Sun, 04 Oct 2020 00:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a995q0geAJRx5CQ3HidLlyV8bk3RpRdiLEvrfSZbfME=;
        b=P/4cnQXYuzZkC3XNfB8SFptnBRqQP2WKnsGkGNl3kt1gkRVN+4SNfFsUxOaWNso3qp
         C9o5dO/1Mqh//cuKuAszMQa0j7moBuN5AEhS7uCFz/0W4ZndX9j5A8f6AE+8G2vJnAmJ
         BbnP3wmB4mpaTXlflzXMCF1HQ0KQgIzTqscmTFWl5wdkS2q1ImIW4yXHPxHvv0EVz998
         RzCvWRYIpBQkVNftpWiWOdXpzsbgi0kSbiicFHa+75D5Qx6EELp8dx3S064PMuO9FQ7n
         cSXy164RomRLS+jnioQzxv1upZXH52f9N5ooLy/aGrv19g7x2G2oVfdZB4LJjMCdTQgf
         8TIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a995q0geAJRx5CQ3HidLlyV8bk3RpRdiLEvrfSZbfME=;
        b=LVKK/ji5bv1OVlIRLFpr033RlNthI/FQ82x0FABx0XGI4Y0LQf0TFbS6KkrFBuqgM8
         L4S/Y1IFvqVU7rVtTWhdKmD4iHepZz9HGT4dTN6aeOXl2P7z97sHasGQA3icueLLxKQZ
         JX5NAbgv2Nctb/z1KfKUK5tm/u5w5vE7jSuplR5ocBOImJjrSoxSSRveQRp735xyET4u
         ock02k96AljcwyWkcNemnvybyB1ttieRfBVwc0fAuqivIZDe6wCS9aSRopG3yvP6mOG6
         Zb8TKOPj/u2OplOBXH/LqD1AoF0aWQDDm9U4vAfKNbdG/x0hG4d384/pGS2q75YO+5oD
         meqw==
X-Gm-Message-State: AOAM533Oq9lohV9lg9zYqUs2bq1r0gsJ1Ve2G+I/JytlH12/QSdmJy+c
        9Lyy9NH/WStIGUjvjUTojiw=
X-Google-Smtp-Source: ABdhPJwwHQfGVUU3DR4KgMUmgls/cIM6gipZdPBInckVUNrpe9OOsaHFQLdmRwJIWgb/jjxqkI58cA==
X-Received: by 2002:a05:6a00:170a:b029:152:6881:5e2d with SMTP id h10-20020a056a00170ab029015268815e2dmr729153pfc.20.1601795331892;
        Sun, 04 Oct 2020 00:08:51 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain (ip68-3-136-221.ph.ph.cox.net. [68.3.136.221])
        by smtp.gmail.com with ESMTPSA id a1sm6464335pjh.2.2020.10.04.00.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 00:08:50 -0700 (PDT)
Date:   Sun, 4 Oct 2020 00:08:47 -0700
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
Subject: Re: [PATCH 1/4] ubsan: Move cc-option tests into Kconfig
Message-ID: <20201004070847.GA1650@Ryzen-9-3900X.localdomain>
References: <20201002221527.177500-1-keescook@chromium.org>
 <20201002221527.177500-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002221527.177500-2-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 02, 2020 at 03:15:24PM -0700, Kees Cook wrote:
> Instead of doing if/endif blocks with cc-option calls in the UBSAN
> Makefile, move all the tests into Kconfig and use the Makefile to
> collect the results.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Link: https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/

I tested menuconfig to make sure all the flags when CONFIG_UBSAN_MISC is
flipped.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

One comment below.

> ---
>  lib/Kconfig.ubsan      | 48 +++++++++++++++++++++++++++++++++++++++-
>  scripts/Makefile.ubsan | 50 ++++++++++++++----------------------------
>  2 files changed, 64 insertions(+), 34 deletions(-)
> 
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 58f8d03d037b..c0b801871e0b 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -36,10 +36,17 @@ config UBSAN_KCOV_BROKEN
>  	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
>  	  in newer releases.
>  
> +config CC_HAS_UBSAN_BOUNDS
> +	def_bool $(cc-option,-fsanitize=bounds)
> +
> +config CC_HAS_UBSAN_ARRAY_BOUNDS
> +	def_bool $(cc-option,-fsanitize=array-bounds)
> +
>  config UBSAN_BOUNDS
>  	bool "Perform array index bounds checking"
>  	default UBSAN
>  	depends on !UBSAN_KCOV_BROKEN
> +	depends on CC_HAS_UBSAN_ARRAY_BOUNDS || CC_HAS_UBSAN_BOUNDS
>  	help
>  	  This option enables detection of directly indexed out of bounds
>  	  array accesses, where the array size is known at compile time.
> @@ -47,11 +54,17 @@ config UBSAN_BOUNDS
>  	  to the {str,mem}*cpy() family of functions (that is addressed
>  	  by CONFIG_FORTIFY_SOURCE).
>  
> +config CC_ARG_UBSAN_BOUNDS
> +	string
> +	default "-fsanitize=array-bounds" if CC_HAS_UBSAN_ARRAY_BOUNDS
> +	default "-fsanitize=bounds"
> +	depends on UBSAN_BOUNDS
> +
>  config UBSAN_LOCAL_BOUNDS
>  	bool "Perform array local bounds checking"
>  	depends on UBSAN_TRAP
> -	depends on CC_IS_CLANG
>  	depends on !UBSAN_KCOV_BROKEN
> +	depends on $(cc-option,-fsanitize=local-bounds)
>  	help
>  	  This option enables -fsanitize=local-bounds which traps when an
>  	  exception/error is detected. Therefore, it should be enabled only
> @@ -69,6 +82,38 @@ config UBSAN_MISC
>  	  own Kconfig options. Disable this if you only want to have
>  	  individually selected checks.
>  
> +config UBSAN_SHIFT
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=shift)
> +
> +config UBSAN_DIV_ZERO
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=integer-divide-by-zero)
> +
> +config UBSAN_UNREACHABLE
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=unreachable)
> +
> +config UBSAN_SIGNED_OVERFLOW
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=signed-integer-overflow)
> +
> +config UBSAN_UNSIGNED_OVERFLOW
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
> +
> +config UBSAN_OBJECT_SIZE
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=object-size)
> +
> +config UBSAN_BOOL
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=bool)
> +
> +config UBSAN_ENUM
> +	def_bool UBSAN_MISC
> +	depends on $(cc-option,-fsanitize=enum)
> +
>  config UBSAN_SANITIZE_ALL
>  	bool "Enable instrumentation for the entire kernel"
>  	depends on ARCH_HAS_UBSAN_SANITIZE_ALL
> @@ -89,6 +134,7 @@ config UBSAN_ALIGNMENT
>  	bool "Enable checks for pointers alignment"
>  	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
>  	depends on !UBSAN_TRAP
> +	depends on $(cc-option,-fsanitize=alignment)
>  	help
>  	  This option enables the check of unaligned memory accesses.
>  	  Enabling this option on architectures that support unaligned
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 9716dab06bc7..72862da47baf 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -1,37 +1,21 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -export CFLAGS_UBSAN :=
> +# -fsanitize=* options makes GCC less smart than usual and
> +# increases the number of 'maybe-uninitialized' false-positives.
> +ubsan-cflags-$(CONFIG_UBSAN) += $(call cc-disable-warning, maybe-uninitialized)

Is this just to force -Wno-maybe-uninitialized even when W=2?
-Wmaybe-uninitialized is already disabled globally after
commit 78a5255ffb6a ("Stop the ad-hoc games with
-Wno-maybe-initialized"). I feel like it might be worth a comment in
case that changes in the future but maybe that is a bit much.

> -ifdef CONFIG_UBSAN_ALIGNMENT
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=alignment)
> -endif
> +# Enable available and selected UBSAN features.
> +ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
> +ubsan-cflags-$(CONFIG_UBSAN_BOUNDS)		+= $(CONFIG_CC_ARG_UBSAN_BOUNDS)
> +ubsan-cflags-$(CONFIG_UBSAN_LOCAL_BOUNDS)	+= -fsanitize=local-bounds
> +ubsan-cflags-$(CONFIG_UBSAN_SHIFT)		+= -fsanitize=shift
> +ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
> +ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
> +ubsan-cflags-$(CONFIG_UBSAN_SIGNED_OVERFLOW)	+= -fsanitize=signed-integer-overflow
> +ubsan-cflags-$(CONFIG_UBSAN_UNSIGNED_OVERFLOW)	+= -fsanitize=unsigned-integer-overflow
> +ubsan-cflags-$(CONFIG_UBSAN_OBJECT_SIZE)	+= -fsanitize=object-size
> +ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
> +ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
> +ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= -fsanitize-undefined-trap-on-error
>  
> -ifdef CONFIG_UBSAN_BOUNDS
> -      ifdef CONFIG_CC_IS_CLANG
> -            CFLAGS_UBSAN += -fsanitize=array-bounds
> -      else
> -            CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
> -      endif
> -endif
> -
> -ifdef CONFIG_UBSAN_LOCAL_BOUNDS
> -      CFLAGS_UBSAN += -fsanitize=local-bounds
> -endif
> -
> -ifdef CONFIG_UBSAN_MISC
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=shift)
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=integer-divide-by-zero)
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=unreachable)
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=signed-integer-overflow)
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=object-size)
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=bool)
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize=enum)
> -endif
> -
> -ifdef CONFIG_UBSAN_TRAP
> -      CFLAGS_UBSAN += $(call cc-option, -fsanitize-undefined-trap-on-error)
> -endif
> -
> -      # -fsanitize=* options makes GCC less smart than usual and
> -      # increase number of 'maybe-uninitialized false-positives
> -      CFLAGS_UBSAN += $(call cc-option, -Wno-maybe-uninitialized)
> +export CFLAGS_UBSAN := $(ubsan-cflags-y)
> -- 
> 2.25.1
