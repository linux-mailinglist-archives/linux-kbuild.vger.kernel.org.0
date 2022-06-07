Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3F953669A
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 May 2022 19:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349591AbiE0RdL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 May 2022 13:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233938AbiE0RdK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 May 2022 13:33:10 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EAA6CAB8
        for <linux-kbuild@vger.kernel.org>; Fri, 27 May 2022 10:33:08 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v8so7902065lfd.8
        for <linux-kbuild@vger.kernel.org>; Fri, 27 May 2022 10:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bj4qyw34YxTvRCJ4T4CzfYuGvBv7f0gh9GISKHTlOYY=;
        b=SKy17ZMe4xDQzYC7q3+GNm5c5xF1hjIYTQ4puIJ3zzSAcV+Y95jaehz+fj4+GuYZKY
         uqstDwu/NMw3ISzHC+z5V+hCrCadYuaVQdFTtnBP8Q8u7pIi5sM9tfTFGJ5vBxT4e/vX
         06o5PPz2i9Lno4XFomQUCKm8wFTMtlQPYpkexnlSFOV4XIsM0W1NRjhzaDH/Et0ksimG
         8gVuiS6YpZIKXbeANzTrWc6Ay5T6Rv8KwcqMDdYHJIaE8h8hho95NJJ4R3+4lH1wytdb
         yJyGvtMAfZRZnMr8B/rXDhKZK06APDuvGJb52EsNS62kqaaQvNEemJnHq1qtVlQjaN7O
         IUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bj4qyw34YxTvRCJ4T4CzfYuGvBv7f0gh9GISKHTlOYY=;
        b=PxhmagW8aoUJK+YJD1QcvSSoHGMTi9eoqn61VH+9SLRRO6xl7z0oRD4RptngmbUOJG
         rKGh9WIZUfwvOBxh8MfnUwVzvUSlaPhfPhivSlWZOEjXfuyLhTiAhHfrw5U7S65GfqVW
         vCjQYmkVn04xlsWhrVaQU20javLZ+lisyCc51yEzDY0WAMsH/x0tun2NpiwPaMFYHsC6
         UlxwanCSsMqlcZJDzHt4DFnFpOWPZQvoz1u2A8nqL3T7ZRavSVzsLpgIJpNV9yli/MCS
         3wxD4Igaekoe8qaKi06/CiHmFw77TzGmR75oFbpr4oyHvpN0d/4tpt5WceACpHDGt/1F
         JrQg==
X-Gm-Message-State: AOAM532HVjrMFUn89THS3MnmwtaACjyDsigpsGJhg72+S82VYcKNzaJF
        muGbKizAAINqEgvZpNJpyvR7iuC3XVCFtSyGgc7HLQ==
X-Google-Smtp-Source: ABdhPJzr0zh7RqK3oufVwRmxE56PvSyrvSdp3z1Zx8heuuJjzgu04wiRGDT9v/yTHIeA6z7GEd9gFjjqg5ITn/M97gw=
X-Received: by 2002:a05:6512:48e:b0:477:c024:1a1c with SMTP id
 v14-20020a056512048e00b00477c0241a1cmr31618834lfq.100.1653672786348; Fri, 27
 May 2022 10:33:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220527100155.1996314-1-masahiroy@kernel.org> <20220527100155.1996314-2-masahiroy@kernel.org>
In-Reply-To: <20220527100155.1996314-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 27 May 2022 10:32:54 -0700
Message-ID: <CAKwvOd=sMwYPJyUcKVAu9V3bWszuUJ2NUMC8BMT5AdN5i=ra2A@mail.gmail.com>
Subject: Re: [PATCH v7 1/8] kbuild: replace $(linked-object) with CONFIG options
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, llvm@lists.linux.dev,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 27, 2022 at 3:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> *.prelink.o is created when CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT
> is enabled.
>
> Replace $(linked-object) with $(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)
> so you will get better idea when the --link option is passed.
>
> No functional change is intended.

It triggered my PTSD to see this ^ expression; many commits to LLVM
are labeled "NFCI."
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v7:
>   - New patch
>
>  scripts/Makefile.build | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 06400504150b..f80196eef03a 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -219,7 +219,7 @@ objtool_args =                                                              \
>         $(if $(CONFIG_STACK_VALIDATION), --stackval)                    \
>         $(if $(CONFIG_HAVE_STATIC_CALL_INLINE), --static-call)          \
>         --uaccess                                                       \
> -       $(if $(linked-object), --link)                                  \
> +       $(if $($(CONFIG_LTO_CLANG)$(CONFIG_X86_KERNEL_IBT)), --link)    \
>         $(if $(part-of-module), --module)                               \
>         $(if $(CONFIG_GCOV_KERNEL), --no-unreachable)
>
> @@ -284,7 +284,6 @@ quiet_cmd_cc_prelink_modules = LD [M]  $@
>  # modules into native code
>  $(obj)/%.prelink.o: objtool-enabled = y
>  $(obj)/%.prelink.o: part-of-module := y
> -$(obj)/%.prelink.o: linked-object := y
>
>  $(obj)/%.prelink.o: $(obj)/%.o FORCE
>         $(call if_changed,cc_prelink_modules)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
