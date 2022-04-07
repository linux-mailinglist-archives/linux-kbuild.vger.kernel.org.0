Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02EDB4F86C2
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Apr 2022 19:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbiDGSBh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Apr 2022 14:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346691AbiDGSBf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Apr 2022 14:01:35 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF3BC37A90
        for <linux-kbuild@vger.kernel.org>; Thu,  7 Apr 2022 10:59:34 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id x33so4548918lfu.1
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Apr 2022 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2/Ixb8mIA2M7JIXe7fAe9rthDbNf/SQgIztcewlJmQQ=;
        b=buXo0yGsMVGnLz+9ouLK4JFFQelyxx4cO5RFmHI4tYFSV2l/gEMwvIe9tDDSZIbsiN
         jtjB/p/e2I+MKpqjoV/rzYOivXDoAIBXZRyd/aS871BjAnMeZ5siig5fLxm7BUqLITo8
         rN+hpkILuZTvuG3eXx4DHzeWgQ06y/2N9pTDXNQ2jAT4IhVMm9wGSMCsIzhIrgXDd0Uq
         0rfaq5CVOkUO2oA8qdZyJiNgPhvl/4e1eOXaP4TPGnSTXr4KvQertjDFWpINeQG5uhbI
         jg6fYUi1Livn5uv4t9dGXHLGXwRhiVhJ41S8B1+SeOfq4keuYr3Wo97KduZQVyMcvrg4
         FDKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2/Ixb8mIA2M7JIXe7fAe9rthDbNf/SQgIztcewlJmQQ=;
        b=AlcPWXt6FEDaMXEyQEeGZQuUWTmDSDGbmuXOQOb0dh290QKb2beLDFMpLwh+6k1jD6
         mvZctdelywVcdy8ZP+hLZ8iFEXrpo13uRR0zbQ1fbLwpampd/VsKS3Hidav2+ghIen28
         xog+q2056Hr01t42OxD7mPse/EnaqIQSL/DAJVEQgECaEnW/uOUfnyOPT98oOOPqX6vI
         3/G8K5b/lSXq/PDtL2X0hY4aIrymiVAGgtCzQqCFbdw8fQjdc+y82geSQepiprJTWaIj
         Vl2GH7iPH0xpXppTo9yZzDxjESXO3g5gOmd/r1VaJKdqR5KmBtLRtLoOA2KbADFN0Fqv
         l4eA==
X-Gm-Message-State: AOAM5333VvS/E8RnmAz0BXmWlVcP3HSoSjYu6X6XDAJe3vdqCzaiaauh
        noWv6Kem/Qo0Q1dWg9x2M6QOtEZTRbOWYK33cL63SA==
X-Google-Smtp-Source: ABdhPJwd0Tn0EHqWJS2TH4O2PKBodEPXj/vOPZQ4lYc3uaV5XgUTF6dL2U2r5QPIROGcac7A1RBwddt6NE7+S9R6A68=
X-Received: by 2002:a05:6512:108b:b0:44a:6dc2:ffeb with SMTP id
 j11-20020a056512108b00b0044a6dc2ffebmr10400479lfg.184.1649354372922; Thu, 07
 Apr 2022 10:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220406153023.500847-1-masahiroy@kernel.org> <20220406153023.500847-7-masahiroy@kernel.org>
In-Reply-To: <20220406153023.500847-7-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 7 Apr 2022 10:59:21 -0700
Message-ID: <CAKwvOdm7NBPj43sRw-_dtjzgpHeOHnQ9uB3rSg3rYhUu0_PN7A@mail.gmail.com>
Subject: Re: [PATCH 6/7] kbuild: make *.mod not depend on *.o
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 6, 2022 at 8:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The dependency
>
>     $(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o
>
> ... exists because *.mod files previously contained undefined symbols,
> which are computed from *.o files when CONFIG_TRIM_UNUSED_KSYMS=y.
>
> Now that the undefined symbols are put into separate *.usyms files,
> there is no reason to make *.mod depend on *.o files.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile               | 3 ++-
>  scripts/Makefile.build | 5 ++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 82ee893909e9..e915aacd02b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1792,7 +1792,8 @@ ifdef single-build
>
>  # .ko is special because modpost is needed
>  single-ko := $(sort $(filter %.ko, $(MAKECMDGOALS)))
> -single-no-ko := $(sort $(patsubst %.ko,%.mod, $(MAKECMDGOALS)))
> +single-no-ko := $(filter-out $(single-ko), $(MAKECMDGOALS)) \
> +               $(foreach x, o mod, $(patsubst %.ko, %.$x, $(single-ko)))

I'm on board with this patch, and the overall goal with the series. My
brain is having a hard time parsing `o mod` though. Can you walk me
through that? Are those targets for .o and .mod files, respectively?

>
>  $(single-ko): single_modpost
>         @:
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index f7a30f378e20..3da731cf6978 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -85,7 +85,7 @@ ifdef need-builtin
>  targets-for-builtin += $(obj)/built-in.a
>  endif
>
> -targets-for-modules := $(foreach x, mod $(if $(CONFIG_TRIM_UNUSED_KSYMS), usyms), \
> +targets-for-modules := $(foreach x, o mod $(if $(CONFIG_TRIM_UNUSED_KSYMS), usyms), \
>                                 $(patsubst %.o, %.$x, $(filter %.o, $(obj-m))))
>
>  ifneq ($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT),)
> @@ -306,7 +306,7 @@ endif
>  cmd_mod = echo $(addprefix $(obj)/, $(call real-search, $*.o, .o, -objs -y -m)) | \
>         $(AWK) -v RS='( |\n)' '!x[$$0]++' > $@
>
> -$(obj)/%.mod: $(obj)/%$(mod-prelink-ext).o FORCE
> +$(obj)/%.mod: FORCE
>         $(call if_changed,mod)
>
>  # List module undefined symbols
> @@ -469,7 +469,6 @@ $(multi-obj-m): FORCE
>         $(call if_changed,link_multi-m)
>  $(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
>
> -targets += $(multi-obj-m)
>  targets := $(filter-out $(PHONY), $(targets))
>
>  # Add intermediate targets:
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
