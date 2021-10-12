Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF3042ACF2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 21:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbhJLTJR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 15:09:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbhJLTJR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 15:09:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA155C061745
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Oct 2021 12:07:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c16so1260154lfb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Oct 2021 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IKQxVqcAmgZKu/tSeqOwVg3gX23vstZQejnJbzgCj/s=;
        b=O4WgFNaEVppR1TUAUoEoywmWCYqdP5jCd+B/Qe6JnWekMkgzuxLiy3+qaGLweJf805
         gVJd5R9BMgaixfNdxd/Q6+QTmhtTW5QcJXimmpmMIZB9DkN9q3OJmZssS1N9AgOnMj3M
         f18kWRNZVTIa1r14GnqNVIyY/bv279PES1d8YM9czLF5iuqsiKtvFTDtZ6kid5+lHpWr
         sV58kNm5NatfWCuvvZ4vVAZnZn1xB+Wlbk8TBq8dE4HLtexh7Xx7+yeOZV9x+2LcVzbf
         CUwIbAfiEpqGBBIMu2cssUyTCAgtLYmw3R7oyaHNB2qdnST6Eq08JBmtbgKezNmR3oto
         Y4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IKQxVqcAmgZKu/tSeqOwVg3gX23vstZQejnJbzgCj/s=;
        b=QvkBJ1lLP1hGgZARIgtWfC3sOLUstfLvMNv7PEBROc92mP9PrVrFFFJfXn+Vn5Xdb0
         E4E2DEyS4qTrlG2GQiJlPYaWdLvn2yXdtl+0e+4waD4iLuUh0wBOdtW3gRT2sYkg7p8U
         eV52OEZTNA6l3dXR1zQZg3/d3qn2+FWom7Y/fRCU9uvVO+46O3zHOPh4Z92msKb4KeED
         Vhpo7NMtox6E1tVTBxsUIkLwNy/mjhgWH4AD1He6jZduSU3i0T3SZEBMb0drXb9zc/4p
         Lgg28VWdsLcl2sEZJHlVue+sHhTTAi8UiR/u3yVMMtK/dgO2Wr88fsL41Tr3Bp6WOPDj
         wK6g==
X-Gm-Message-State: AOAM532BrvqKReSaMHDZVQgmyQQb15GkxJMAm8nuX//ZtF+7kOU8478A
        Zor+wl8ipSLbkEeRldIg86s2It+YytldOlp9vd28Ab4tBYc=
X-Google-Smtp-Source: ABdhPJyF0EUYiKnUt0ZEwpD2Kg4rJqw/Uya9fqRNtXwfVqd4j8R7NL7QDCaGvzhUA1GbBJrHaPdfATqmUxOhhuEtNzU=
X-Received: by 2002:a2e:8695:: with SMTP id l21mr9515526lji.339.1634065632961;
 Tue, 12 Oct 2021 12:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211012032503.459821-1-masahiroy@kernel.org>
In-Reply-To: <20211012032503.459821-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 12 Oct 2021 12:07:02 -0700
Message-ID: <CAKwvOdnFLV0xQYbiouvf8zibKq-pKo7q0R9QVC7ywWLYMHHZ7w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: split DEBUG_CFLAGS out to scripts/Makefile.debug
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 11, 2021 at 8:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> To slim down the top Makefile, split out the code block surrounded by
> ifdef CONFIG_DEBUG_INFO ... endif.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesauniers@google.com>

> ---
>
>  Makefile               | 39 +--------------------------------------
>  scripts/Makefile.debug | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 38 deletions(-)
>  create mode 100644 scripts/Makefile.debug
>
> diff --git a/Makefile b/Makefile
> index ee5896261d2f..8e3224470dc1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -847,44 +847,6 @@ ifdef CONFIG_ZERO_CALL_USED_REGS
>  KBUILD_CFLAGS  += -fzero-call-used-regs=used-gpr
>  endif
>
> -DEBUG_CFLAGS   :=
> -
> -ifdef CONFIG_DEBUG_INFO
> -
> -ifdef CONFIG_DEBUG_INFO_SPLIT
> -DEBUG_CFLAGS   += -gsplit-dwarf
> -else
> -DEBUG_CFLAGS   += -g
> -endif
> -
> -ifndef CONFIG_AS_IS_LLVM
> -KBUILD_AFLAGS  += -Wa,-gdwarf-2
> -endif
> -
> -ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> -dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> -dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
> -DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> -endif
> -
> -ifdef CONFIG_DEBUG_INFO_REDUCED
> -DEBUG_CFLAGS   += -fno-var-tracking
> -ifdef CONFIG_CC_IS_GCC
> -DEBUG_CFLAGS   += -femit-struct-debug-baseonly
> -endif
> -endif
> -
> -ifdef CONFIG_DEBUG_INFO_COMPRESSED
> -DEBUG_CFLAGS   += -gz=zlib
> -KBUILD_AFLAGS  += -gz=zlib
> -KBUILD_LDFLAGS += --compress-debug-sections=zlib
> -endif
> -
> -endif # CONFIG_DEBUG_INFO
> -
> -KBUILD_CFLAGS += $(DEBUG_CFLAGS)
> -export DEBUG_CFLAGS
> -
>  ifdef CONFIG_FUNCTION_TRACER
>  ifdef CONFIG_FTRACE_MCOUNT_USE_CC
>    CC_FLAGS_FTRACE      += -mrecord-mcount
> @@ -1033,6 +995,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
>
>  # include additional Makefiles when needed
>  include-y                      := scripts/Makefile.extrawarn
> +include-$(CONFIG_DEBUG_INFO)   += scripts/Makefile.debug
>  include-$(CONFIG_KASAN)                += scripts/Makefile.kasan
>  include-$(CONFIG_KCSAN)                += scripts/Makefile.kcsan
>  include-$(CONFIG_UBSAN)                += scripts/Makefile.ubsan
> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> new file mode 100644
> index 000000000000..9f39b0130551
> --- /dev/null
> +++ b/scripts/Makefile.debug
> @@ -0,0 +1,33 @@
> +DEBUG_CFLAGS   :=
> +
> +ifdef CONFIG_DEBUG_INFO_SPLIT
> +DEBUG_CFLAGS   += -gsplit-dwarf
> +else
> +DEBUG_CFLAGS   += -g
> +endif
> +
> +ifndef CONFIG_AS_IS_LLVM
> +KBUILD_AFLAGS  += -Wa,-gdwarf-2
> +endif
> +
> +ifndef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
> +dwarf-version-$(CONFIG_DEBUG_INFO_DWARF5) := 5
> +DEBUG_CFLAGS   += -gdwarf-$(dwarf-version-y)
> +endif
> +
> +ifdef CONFIG_DEBUG_INFO_REDUCED
> +DEBUG_CFLAGS   += -fno-var-tracking
> +ifdef CONFIG_CC_IS_GCC
> +DEBUG_CFLAGS   += -femit-struct-debug-baseonly
> +endif
> +endif
> +
> +ifdef CONFIG_DEBUG_INFO_COMPRESSED
> +DEBUG_CFLAGS   += -gz=zlib
> +KBUILD_AFLAGS  += -gz=zlib
> +KBUILD_LDFLAGS += --compress-debug-sections=zlib
> +endif
> +
> +KBUILD_CFLAGS += $(DEBUG_CFLAGS)
> +export DEBUG_CFLAGS
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
