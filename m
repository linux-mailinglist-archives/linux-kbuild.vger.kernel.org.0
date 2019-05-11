Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 459B61A648
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 May 2019 04:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbfEKCZE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 22:25:04 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41906 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728194AbfEKCZE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 22:25:04 -0400
Received: by mail-ed1-f67.google.com with SMTP id m4so7735866edd.8;
        Fri, 10 May 2019 19:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Oyc3N7ZJeUUN6zr+ts9mIeijEI2U+8VndyHkZmoha0=;
        b=jwgSKOTq5sw6Uf1fWBfcnkV2IMdrBxkuO+pM0GxaE/p7MhEW0EyQ+1xdWPsHDLGL8d
         UghVVg1k9Ew6z4bdnIUenwowl7XfVxXK1iQuVOCYuIVajbLBPdd69/76wYDHTnPCZBdG
         lXJdZ7ThQglROR+t9exoCHWj/kYVcGRuMDlJuj7Rfci+wImKTRWjmoozSYAH8RxCH2Un
         9eBTg080KBOAQbdjqtNjFM+PIIp6V33Uxw11X43lfGrn2fxOj2y5J/vXitcG1w2ZbUp5
         fC7fRP3fN4wfriyHd3ZRj1bHn/bkSkCW6AVdUcC/f0nJeO55HMnRxtC72Bm+0l7BiiBL
         ZDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Oyc3N7ZJeUUN6zr+ts9mIeijEI2U+8VndyHkZmoha0=;
        b=Or6VEjDxDnJODo2EVyn9lWGTZ7Nxtp7ncZGOTy7gJLwEnMWvbuHboZHsNNz6A/Cxb4
         f7qbG7Pf3J8xOws3G0yjJXAZxe8A7tkmtM+n4+hQ5usHAQc8KJpalkhzEEnr3I1WoZAe
         GLdQxjTxfPrKDtrvgk8fkJTZdbqNOWPJghCneDhovqEjisI19+EAgejE1fOjmvdNumn+
         NtD7vfVMpAvjF7d7z/9YeYpWdRBMvvGPGqrAVPbmOWx3wH+WP3yhXs8QFPRqQ8UzMcCg
         P/C0TtsTs4GoXc/BBWtGJFiOQK2zs7nNFS60kAq72m0OobhegnRSPyfAbQqV0KP+Ctww
         XdxQ==
X-Gm-Message-State: APjAAAUJ7tTojbXXTlATPTcmz7tPtbqDBcB9NqiKWKExJqs0FKSYGIe+
        UXDhh3cZckF2XkuqM489f6U=
X-Google-Smtp-Source: APXvYqwUd+Y9teNZ1zb+iaesA2wQZppD1RSa4t/H+AzB6sn1MzQRk1bBFGy0dpnpu1h0Iryg0dkXTQ==
X-Received: by 2002:a50:b4f7:: with SMTP id x52mr15596710edd.190.1557541501662;
        Fri, 10 May 2019 19:25:01 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id w4sm1852725edf.89.2019.05.10.19.25.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 10 May 2019 19:25:00 -0700 (PDT)
Date:   Fri, 10 May 2019 19:24:58 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     yamada.masahiro@socionext.com, clang-built-linux@googlegroups.com,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add script check for cross compilation utilities
Message-ID: <20190511022458.GA7376@archlinux-i9>
References: <20190509201925.189615-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509201925.189615-1-ndesaulniers@google.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Few comments below but nothing major, this seems to work fine as is.

On Thu, May 09, 2019 at 01:19:21PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> When cross compiling via setting CROSS_COMPILE, if the prefixed tools
> are not found, then the host utilities are often instead invoked, and
> produce often difficult to understand errors.  This is most commonly the
> case for developers new to cross compiling the kernel that have yet to
> install the proper cross compilation toolchain. Rather than charge
> headlong into a build that will fail obscurely, check that the tools
> exist before starting to compile, and fail with a friendly error
> message.

This part of the commit message makes it sound like this is a generic
problem when it is actually specific to clang. make will fail on its
own when building with gcc if CROSS_COMPILE is not properly set (since
gcc won't be found).

On a side note, seems kind of odd that clang falls back to the host
tools when a non-host --target argument is used... (how in the world is
that expected to work?)

> 
> Before:
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
> ...
> /usr/bin/as: unrecognized option '-EL'
> clang: error: assembler command failed with exit code 1 (use -v to see
> invocation)
> make[2]: *** [../scripts/Makefile.build:279: scripts/mod/empty.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/linux/Makefile:1118:
> prepare0] Error 2
> make: *** [Makefile:179: sub-make] Error 2
> 
> After:
> $ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang
> $CROSS_COMPILE set to arm-linux-gnueabihf-, but unable to find
> arm-linux-gnueabihf-as.
> Makefile:522: recipe for target 'outputmakefile' failed
> make: *** [outputmakefile] Error 1
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com
Tested-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> Note: this is probably more generally useful, but after a few minutes
> wrestling with Make errors related to "recipe commences before first
> target" and "missing separator," I came to understand my hatred of GNU
> Make. Open to sugguestions for where better to invoke this from the top
> level Makefile.
> 
>  Makefile                      |  1 +
>  scripts/check_crosscompile.sh | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
>  create mode 100755 scripts/check_crosscompile.sh
> 
> diff --git a/Makefile b/Makefile
> index a61a95b6b38f..774339674b59 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -519,6 +519,7 @@ endif
>  
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/check_crosscompile.sh
>  CLANG_FLAGS	:= --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
> diff --git a/scripts/check_crosscompile.sh b/scripts/check_crosscompile.sh
> new file mode 100755
> index 000000000000..f4586fbfee18
> --- /dev/null
> +++ b/scripts/check_crosscompile.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +# (c) 2019, Nick Desaulniers <ndesaulniers@google.com>

I think a space between the comment and function here would look nicer.

> +function check () {
> +  # Remove trailing commands, for example arch/arm/Makefile may add `-EL`.
> +  utility=$(echo ${1} | awk '{print $1;}')

Shellcheck mentions the ${1} should be quoted.

> +  command -v "${utility}" &> /dev/null
> +  if [[ $? != 0 ]]; then

This can be simplified into:

if ! command -v "${utility}" &> /dev/null; then

> +    echo "\$CROSS_COMPILE set to ${CROSS_COMPILE}," \
> +      "but unable to find ${utility}."
> +    exit 1
> +  fi
> +}

Maybe a space here and after utilities?

> +utilities=("${AS}" "${LD}" "${CC}" "${AR}" "${NM}" "${STRIP}" "${OBJCOPY}"
> +  "${OBJDUMP}")

I think this would look a little better with the "${OBJDUMP}" aligned to
the "${AS}" (and maybe split the lines to make them evenly align?)

Another note, this script could in theory be invoked via 'sh' if bash
doesn't exist on a system (see CONFIG_SHELL's definition), where only
POSIX compliant constructs should be used (so no arrays). I don't know
how often this occurs to matter (or if it does in this case) but worth
mentioning.

> +for utility in "${utilities[@]}"; do
> +  check "${utility}"
> +done
> -- 
> 2.21.0.1020.gf2820cf01a-goog
