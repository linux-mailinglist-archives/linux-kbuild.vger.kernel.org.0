Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C412185C0
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 09:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfEIHGm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 03:06:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35865 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726192AbfEIHGl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:06:41 -0400
Received: by mail-wm1-f68.google.com with SMTP id j187so1690536wmj.1;
        Thu, 09 May 2019 00:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=QxjxCtAGC9sgwBVP0aujIL+nj1BEgOsSRfVwObMvkJw=;
        b=hMNmTM3Fa4JTw2IDJeS+emhELf+P3C9s3RfCoMpeL0GM15rxVFVRG0CFfxB4hE3QCu
         cZlYTWpl96SUlYt+Rn8Gl03IQMhr4MaFNVeY20kQTP9tCYM3CN4lF6SePXptshRO3PYd
         IMEr4/wAsirOUjRScpOicNL3c37QQRVXFwx7mbHU+phdHdenH5H0eQQz7moktMDrnnE2
         v1gvMvigCBo+Tbw5kKXo1NaG8aV9g2AArXNITCElVMdG6l9fxJynCeBDCdEURabuqAVT
         IAmM1rSnMbFXwjwRsk6jVojnGFsmKusq89hNa6Q/UIR+VbCH+mRGaS+73Vp+NIdHQ+DF
         RBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=QxjxCtAGC9sgwBVP0aujIL+nj1BEgOsSRfVwObMvkJw=;
        b=mX8LI/gjYG46MjqA60guZizQTJmBTlCGPtZ30Fd9uXAUp8yNUl5MZ+l2UDPwe6h+OL
         IVdo9if88BElVr5XkcweSoDaQDDojNOmlSvLVwIDj4QbOjR69FhB+tb8xaEEAnFVgCSS
         eynDHCFHs1WRiOQ1pVGzmUr/ezyspCoo5CdE3XGzLRg7ZyoPxMfIVSP3kuBwrGFrr/NQ
         0DeSftj/QMWVsVtnSj62HnJzsnAMtB6wqCoYUzQybOZfuTyBUbDpBfcsOvQNjzJn53uc
         +DbTyjhrEdsM0pPTOptXMNmWqz++oVXImf2uAPeDUCwSxvm7S7aX2MZdNr/yOAEGyRb0
         OMIg==
X-Gm-Message-State: APjAAAX8zjAMeo0ZypE5oHgvHYHXUmJ6IenVPGIDttedS+JhA3hKvZ+z
        3otA9Q1/grEMbaPz2NpSLcMh9hZWsnGd7KLvGpg=
X-Google-Smtp-Source: APXvYqzH6foRLsHJ29fBZzdGGPQUH8sMhpgz0hNztNX2aeCfOQEtixxoWrrihN1sdE3rlgkVECQmfNxJSeXS35A9LNI=
X-Received: by 2002:a1c:cc15:: with SMTP id h21mr1521987wmb.85.1557385599242;
 Thu, 09 May 2019 00:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064455.1173-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509064455.1173-1-yamada.masahiro@socionext.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 9 May 2019 09:06:27 +0200
Message-ID: <CA+icZUX_AgZdH5Z+1+k+oVdYSo7vqzeJsGPndb_Sa8VOSk_yOg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 8:45 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> We do not support old Clang versions. Upgrade your clang version
> if any of these flags is unsupported.
>
> Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> except -fcatch-undefined-behavior.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Looks good to me.

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

Just as sidenote:
I experimented with a snapshot version of clang-9 and lld-9 and could
build, link and boot on bare-metal with '-mglobal-merge' on
Debian/buster AMD64.
But forgot to document in [1].

[1] https://github.com/ClangBuiltLinux/linux/issues/431

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
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509064455.1173-1-yamada.masahiro%40socionext.com.
> For more options, visit https://groups.google.com/d/optout.
