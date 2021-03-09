Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76FB332F66
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 20:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbhCIT4M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 14:56:12 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:42753 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbhCIT4I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 14:56:08 -0500
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 129Jtd8V015140;
        Wed, 10 Mar 2021 04:55:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 129Jtd8V015140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615319739;
        bh=O2Wusp+oF1an+HCfKF/8accMBu76kIYY85AHixnE3LA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2tBjBYarT9iWOhUds3YLiEf+1/6OXbrgghJw2c9e7XL9ITknLmpugZGp7pPcWxBuu
         x1JMBapghXLDHko+27MAgrNA+VkWcZkW9/j8IhkXpvpKD7uVfBvqf5dWnCm7tc9JRg
         nFpOF9yNiz/BP3zHTmFfCka/Y6U936t+M1lV0jb4s+ZTh7dPmrPF1mMJ2nJXlht901
         m7N5WkIfns+Pjw55Qlo7rKONiuAP5XrCTavOqKBICimUfCTyWirQ/R/aSH5kXXSbnd
         3ylEgcGx54V+Qc5s7v2uUEQFGhATUkSZ5C2CiSuj/QWPjTpQ+G+vKZmr85SNMd3h9Z
         wRNmfO720Przw==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id n17so3600061plc.7;
        Tue, 09 Mar 2021 11:55:39 -0800 (PST)
X-Gm-Message-State: AOAM533GIi30z1z2ZLq+Eb0iCk0nubCdp8Sw947Ol2RpiupxafEfLOgr
        ZnKe93ivYtITp0h/Ni27ED/aKVFJMjr+Y2Eruvw=
X-Google-Smtp-Source: ABdhPJxFjRqVc0PsKtmDIrLRimcT42M0ZYqKVZIigD3lor/la9zVBXvRgb+kKLXQ3Q0Z8aPs9E8uwsYFUdL7kv8n09I=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr6321761pji.87.1615319738849;
 Tue, 09 Mar 2021 11:55:38 -0800 (PST)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org> <20210302210646.3044738-2-nathan@kernel.org>
In-Reply-To: <20210302210646.3044738-2-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 04:55:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNARd7pM7SCKJOS=_ZDE+-Q_buDOfw_u0vsfof6G1FWXvOQ@mail.gmail.com>
Message-ID: <CAK7LNARd7pM7SCKJOS=_ZDE+-Q_buDOfw_u0vsfof6G1FWXvOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: Only specify '--prefix=' when building with
 clang + GNU as
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 6:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When building with LLVM_IAS=1, there is no point to specifying
> '--prefix=' because that flag is only used to find the cross assembler,
> which is clang itself when building with LLVM_IAS=1. All of the other
> tools are invoked directly from PATH or a full path specified via the
> command line, which does not depend on the value of '--prefix='.
>
> Sharing commands to reproduce issues becomes a little bit easier without
> a '--prefix=' value because that '--prefix=' value is specific to a
> user's machine due to it being an absolute path.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>


I was tricked by a couple of Reviewed-by/Tested-by tags.

With this patch applied, the code looks as follows:


ifneq ($(CROSS_COMPILE),)
CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
ifneq ($(LLVM_IAS),1)
GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
CLANG_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
CLANG_FLAGS += -no-integrated-as
endif
endif


For the native build (empty CROSS_COMPILE),
you cannot add -no-integrated-as.


I dropped this from my tree.



Is the correct code as follows?


ifneq ($(LLVM_IAS),1)
CLANG_FLAGS += -no-integrated-as
ifneq ($(CROSS_COMPILE),)
CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
CLANG_FLAGS += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
endif
endif






> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c20f0ad8be73..0413b8c594cd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -566,12 +566,12 @@ CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g
>  ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> +ifneq ($(LLVM_IAS),1)
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> -endif
> -ifneq ($(LLVM_IAS),1)
>  CLANG_FLAGS    += -no-integrated-as
>  endif
> +endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
> --
> 2.31.0.rc0.75.gec125d1bc1
>


-- 
Best Regards
Masahiro Yamada
