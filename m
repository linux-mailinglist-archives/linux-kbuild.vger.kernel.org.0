Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2AD3FCC2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239994AbhHaRR6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239659AbhHaRRz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:17:55 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FCFFC061760
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:16:59 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y34so268975lfa.8
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=obdT8H3XYks2rJPjk5mybOLqMo1D6xNjm3PqnOSi/Co=;
        b=M8HO7XZ8gEpPcSZ9IHcOu5DzjDBc45aO6HMKmSD4PUBvAlGCeW8AZ3yffZUgeXUO4q
         PmKxHho9OVF/9kWc8M629PmHyioaO74KXGPdnHDooREtDV3DJsWyQuGGYMAT8uj8FHXn
         SAfJhMYypBSCOqo22iy/+kHfq/jQNKe05Dg/FlSRJhtHTL98u9IWKVNU0DzOaIFCc7Pd
         OrpftmTdYzwCdAlrrBAQ6wBPH7V1C857vpj88o/pusO94g8khv6GycpRXdlq24n0tTiI
         mgfJHd9SB/m7zaFCI3bkptzHQ4WnWqM81CMYv5ekHtgMZBP+iw6oOwlxfExLKie8zXGO
         C6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obdT8H3XYks2rJPjk5mybOLqMo1D6xNjm3PqnOSi/Co=;
        b=nde1n2KVRpiaW5vYt+nT7LmrRVZZ7+adxSGArlxlR+6RkomGH2mQZLD/IGF59FJF5s
         Ob13ucYAgIjIHcE/W1lWYEj3XLj2+te0w2o3EjISZ7LPFc5Y6dgxTNybo9GeE3Fvoqo4
         YyTEbxha5wlAg66wML30wlmoBarjLddBsoWp9Bkq4jaeURYzUXzj8+ve0QknQdDTg4lL
         +tUvgcWgBaZ11Spdwfjvxl3JczDXYymPyu5z0EZal5tbn2DsazYk2O89Iq0Bmm7v+ZUd
         fm/UGyG8GpliKXPr+R+3F67/I3SZL4B7iGAHbWUBTCpeHRzFc6STlI4yea3aPt3sQsQK
         M9uA==
X-Gm-Message-State: AOAM531l5IS9jK/cyOlWAo44xVx5Nfke1DgdoxfYqqsKlgH28qXz9Vi0
        mjQYyC84WsZC8BVHdwdbMMiVZeyeFb4Kk3Pn71GjTA==
X-Google-Smtp-Source: ABdhPJydYfYxTQDSdJbtgTOZjrnwb5IRRbv7WAkxTk6roO4tlccLhpb7ALDT3CbhQTmTtv/QjyiiaF86jVRZDomz0/8=
X-Received: by 2002:a05:6512:3e22:: with SMTP id i34mr22513753lfv.374.1630430217595;
 Tue, 31 Aug 2021 10:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org> <20210831074004.3195284-3-masahiroy@kernel.org>
In-Reply-To: <20210831074004.3195284-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 31 Aug 2021 10:16:45 -0700
Message-ID: <CAKwvOdn9661=wg3ErhaHM=QS4=zOqjK7_f7VqpTgUoGTGnzHsA@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] kbuild: rename __objtool_obj to objtool
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Rename __objtool_obj to objtool, and move it out of the
> 'ifndef CONFIG_LTO_CLANG' conditional, so it can be used for
> cmd_cc_lto_link_modules as well.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  scripts/Makefile.build | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 17508c0e4358..e78096cd396b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -225,6 +225,8 @@ endif # CONFIG_FTRACE_MCOUNT_USE_RECORDMCOUNT
>
>  ifdef CONFIG_STACK_VALIDATION
>
> +objtool := $(objtree)/tools/objtool/objtool
> +
>  objtool_args =                                                         \
>         $(if $(CONFIG_UNWINDER_ORC),orc generate,check)                 \
>         $(if $(part-of-module), --module)                               \
> @@ -236,17 +238,15 @@ objtool_args =                                                            \
>
>  ifndef CONFIG_LTO_CLANG
>
> -__objtool_obj := $(objtree)/tools/objtool/objtool
> -
>  # 'OBJECT_FILES_NON_STANDARD := y': skip objtool checking for a directory
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'y': skip objtool checking for a file
>  # 'OBJECT_FILES_NON_STANDARD_foo.o := 'n': override directory skip for a file
>  cmd_objtool = $(if $(patsubst y%,, \
>         $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> -       $(__objtool_obj) $(objtool_args) $@)
> +       $(objtool) $(objtool_args) $@)
>  objtool_obj = $(if $(patsubst y%,, \
>         $(OBJECT_FILES_NON_STANDARD_$(basetarget).o)$(OBJECT_FILES_NON_STANDARD)n), \
> -       $(__objtool_obj))
> +       $(objtool))
>
>  endif # CONFIG_LTO_CLANG
>  endif # CONFIG_STACK_VALIDATION
> @@ -300,8 +300,7 @@ cmd_cc_lto_link_modules =                                           \
>  ifdef CONFIG_STACK_VALIDATION
>  # objtool was skipped for LLVM bitcode, run it now that we have compiled
>  # modules into native code
> -cmd_cc_lto_link_modules += ;                                           \
> -       $(objtree)/tools/objtool/objtool $(objtool_args) --module $@
> +cmd_cc_lto_link_modules += ; $(objtool) $(objtool_args) --module $@
>  endif
>
>  $(obj)/%.lto.o: $(obj)/%.o FORCE
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
