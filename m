Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 905A1188CA
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 13:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfEILPj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 07:15:39 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43187 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfEILPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:15:38 -0400
Received: by mail-ed1-f66.google.com with SMTP id w33so1651675edb.10;
        Thu, 09 May 2019 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1mAgKXKVH6WJBmD9lEy5Hj69s/z+i3XAtMbYTQrm+2w=;
        b=QA6Edfawa1zT9m9B+S/BkNfQazS4cCMndYNMA/og+NYbvmgkqAHNTdVXuXKfTLh+wR
         qCdI9Lr1K2gbRYi4Y10nT9fCJREhMYQ2E0ajnPNtTlJqcFfhMA2JhUYzbMIWpHsGdrsE
         KyPA0TRbfcqpNAXvBP1+E7rXrYeC7A7pSmkS2DMnckMjdJaBUq4+qfsnoXWIv6TPUvKw
         CmrEa1Ih0GZ6yr0fqPikN9tqoHUzVoPtRGhdwLEwWb+MN5f7KEAGS5QtaRH2qPZtNTwO
         FEwdwSrrABkEzg5YFC1zvw6p+NKgR6U8cb4QxkK8TuHx5Prz8yLZ9XW3GKI5Use4UaRE
         A4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1mAgKXKVH6WJBmD9lEy5Hj69s/z+i3XAtMbYTQrm+2w=;
        b=gCsE+H0IbzOkaDUBSiEB7VLTnJfp7s1spkR/v2PfTR8ITB4zX7yBjnKvvwLr2AxPOu
         razytLTF4vyHH7iBfXF61AVQA0Y+UeWTtd/iOUA/+Jc1Wldu/bITBFb/QSmZO6AnKR3t
         ufBJYkeYj574rKYP1M9+ZzJXGSZ9M3mpYUw7cfn9I1Ebd4kULmgl1su57VE08JgvcYr7
         Zkhj/7WRKgC2KnTeTzUNgPtnBh10pYy8RcUi5Hk77jHII3iNC1WPTkJbeQzk97CVya9w
         S/6+58Xv9Tvh/Dz7hMnrYlghu9Cl6LUMSG/LnEuJTBY2jMyPFXvyvSlPFoi3ufCgJpl2
         sadw==
X-Gm-Message-State: APjAAAV+lITzRopj/sSwGgdaIcQ5vZQg9aA/aEe2mTuQn/CDGeMV6mfQ
        3reciEtbLURO7rYUk7R/pK8=
X-Google-Smtp-Source: APXvYqwGMCpOdLTxnht++5+hKtWPAl5Aps+XOP+DAJpiCjVanBHLY7ecFbvwxGHXC43savWrLIKOdg==
X-Received: by 2002:a17:906:65b:: with SMTP id t27mr2744512ejb.49.1557400536609;
        Thu, 09 May 2019 04:15:36 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id v15sm276581ejh.6.2019.05.09.04.15.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 09 May 2019 04:15:35 -0700 (PDT)
Date:   Thu, 9 May 2019 04:15:34 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Message-ID: <20190509111534.GA32696@archlinux-i9>
References: <20190509064455.1173-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509064455.1173-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 09, 2019 at 03:44:55PM +0900, Masahiro Yamada wrote:
> We do not support old Clang versions. Upgrade your clang version
> if any of these flags is unsupported.
> 
> Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> except -fcatch-undefined-behavior.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>  Makefile                   | 10 +++++-----
>  scripts/Makefile.extrawarn | 12 ++++++------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index bd7ae11947cb..c71ffb6f55b5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
>  KBUILD_CFLAGS += $(stackp-flags-y)
>  
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> -KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> +KBUILD_CPPFLAGS += -Qunused-arguments
> +KBUILD_CFLAGS += -Wno-format-invalid-specifier
> +KBUILD_CFLAGS += -Wno-gnu
>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
> -KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> +KBUILD_CFLAGS += -Wno-tautological-compare
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>  # See modpost pattern 2
> -KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> +KBUILD_CFLAGS += -mno-global-merge
>  KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)

I think we should just remove this, I'm fairly confident the kernel
can't be reliably compiled with anything earlier than Clang 4 (Pixel 2
was shipped with it but had some hacks, this commit is from Clang 3.5):

https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4

Otherwise:

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

>  else
>  
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 768306add591..523c4cafe2dc 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -66,11 +66,11 @@ KBUILD_CFLAGS += $(warning)
>  else
>  
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format)
> -KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> -KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> +KBUILD_CFLAGS += -Wno-initializer-overrides
> +KBUILD_CFLAGS += -Wno-unused-value
> +KBUILD_CFLAGS += -Wno-format
> +KBUILD_CFLAGS += -Wno-sign-compare
> +KBUILD_CFLAGS += -Wno-format-zero-length
> +KBUILD_CFLAGS += -Wno-uninitialized
>  endif
>  endif
> -- 
> 2.17.1
> 
