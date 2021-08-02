Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E97C3DE135
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 23:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231605AbhHBVGg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 17:06:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231730AbhHBVGf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 17:06:35 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D1AC061764
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 14:06:25 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id s48so7575540ybi.7
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Gsk+PU6zv89mFYfFw3XbKhLrnW0DMZFFqe7xZQfb8k=;
        b=f4jCW1Q8XIGNV8OibA8486wQbNvDzvRs7inZpSU50AT1zf+1dggjCx+NvLT6vP+sU8
         RkwtH8wx0ov2K7pkUNwHW1o+3vX9UIxVZHk6eThI0eFWvCp7qbco/iRhz6hqPh+tuipQ
         P4TgM4jJd371kZhrg+03Avzt6tF+gMBK15AM+nvRgnQ27HOXrprBefRlJNarze5fE03m
         OcnjM5rvSqwmLRpVO1q6owHuFKHjuBaaJsFMpiDehejIlWWQmabZ+FwcLSZJIobhJDNL
         uqv9uWA2Snc9PqOo3SdXjINIZFCdnQp0MxKiE38cCsBKCiYJ78Ewxr8Z+nM+eMuOpJdQ
         XxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Gsk+PU6zv89mFYfFw3XbKhLrnW0DMZFFqe7xZQfb8k=;
        b=DpBiz6GdAF46uFqaQdDghE9HYHLFUOBZkn40Oad8a7CQjdWvJ0UMq9L9viKcYfQN+h
         aaaka/AvLvni21TFmhtFSV3+Ro5+AcBFT0wrc4xmFeg8dsrRWDlV4V/eYJUq4zlyEhJi
         PCEGi6v9DVG3QzrggJNXwJum91ONZ8GFKCFB28VYLmcl/KXlDX+B11vx9n6t53DZ8r9v
         Mv2KrQAV1SQu2HhTnk/C7olQe59jFAqzjwRfzD0oErOrzhBgvVKNKSyXCQoNy8bbKSsl
         E/e7nM0lMNHuGYKA7VX5RpLuuwqnFYLtH/VeQyv5SkMoZEYsWqVO0aJo80VHFA/B/AOF
         9QZw==
X-Gm-Message-State: AOAM533TWTOGYUyrBzekWkFEHi+NMqXcgaIbMmxdAwR/OZZQ2uozw35v
        qwRBIzVTXFqd+e+ozE+ldirhjLOf+S2Zhn0T/jSugw==
X-Google-Smtp-Source: ABdhPJyil4dfkBNuBySZ9Tmrp2EXIOmUc/V/ajCIHcCBl2HqK0RSea3yeuHIKeY7PpdvgDhSQnqoL0uQuzdYcxeXOnc=
X-Received: by 2002:a05:6902:1549:: with SMTP id r9mr24716376ybu.308.1627938384181;
 Mon, 02 Aug 2021 14:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com> <20210802183910.1802120-2-ndesaulniers@google.com>
In-Reply-To: <20210802183910.1802120-2-ndesaulniers@google.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Mon, 2 Aug 2021 14:06:13 -0700
Message-ID: <CAFP8O3Jc=iwzAQojgBZZzdT8iVBY9TO6GLTq+0vkXoo6L5JJ-A@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] Makefile: move initial clang flag handling into scripts/Makefile.clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 2, 2021 at 11:39 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> With some of the changes we'd like to make to CROSS_COMPILE, the initial
> block of clang flag handling which controls things like the target triple,
> whether or not to use the integrated assembler and how to find GAS,
> and erroring on unknown warnings is becoming unwieldy. Move it into its
> own file under scripts/.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  MAINTAINERS            |  1 +
>  Makefile               | 15 +--------------
>  scripts/Makefile.clang | 14 ++++++++++++++
>  3 files changed, 16 insertions(+), 14 deletions(-)
>  create mode 100644 scripts/Makefile.clang
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 19135a9d778e..3af8d39f43ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4501,6 +4501,7 @@ B:        https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
>  F:     include/linux/compiler-clang.h
> +F:     scripts/Makefile.clang
>  F:     scripts/clang-tools/
>  K:     \b(?i:clang|llvm)\b
>
> diff --git a/Makefile b/Makefile
> index 6b555f64df06..444558e62cbc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -586,20 +586,7 @@ endif
>  CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
>
>  ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> -ifneq ($(CROSS_COMPILE),)
> -CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> -endif
> -ifeq ($(LLVM_IAS),1)
> -CLANG_FLAGS    += -integrated-as
> -else
> -CLANG_FLAGS    += -no-integrated-as
> -GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> -endif
> -CLANG_FLAGS    += -Werror=unknown-warning-option
> -KBUILD_CFLAGS  += $(CLANG_FLAGS)
> -KBUILD_AFLAGS  += $(CLANG_FLAGS)
> -export CLANG_FLAGS
> +include $(srctree)/scripts/Makefile.clang
>  endif
>
>  # Include this also for config targets because some architectures need
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> new file mode 100644
> index 000000000000..297932e973d4
> --- /dev/null
> +++ b/scripts/Makefile.clang
> @@ -0,0 +1,14 @@
> +ifneq ($(CROSS_COMPILE),)
> +CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> +endif
> +ifeq ($(LLVM_IAS),1)
> +CLANG_FLAGS    += -integrated-as

-i* options are for includes. -fintegrated-as is the canonical spelling.
Since -fintegrated-as is the default (for most llvm/lib/Target/
targets and the ones clang builds actually support),
it can even be deleted.

> +else
> +CLANG_FLAGS    += -no-integrated-as
> +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> +CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +endif
> +CLANG_FLAGS    += -Werror=unknown-warning-option
> +KBUILD_CFLAGS  += $(CLANG_FLAGS)
> +KBUILD_AFLAGS  += $(CLANG_FLAGS)
> +export CLANG_FLAGS
> --
> 2.32.0.554.ge1b32706d8-goog
>
