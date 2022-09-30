Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA345F1167
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Sep 2022 20:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231872AbiI3SOa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Sep 2022 14:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbiI3SON (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Sep 2022 14:14:13 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68F381EDF68
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Sep 2022 11:13:35 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d10so4912534pfh.6
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Sep 2022 11:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=csppaKmQ1ESJt0WGd0PBHaMkSLI1suVHoGARj7x1z+c=;
        b=nNRUnwrAE4/ZhAggVoCMVewDLJhPFl1kxsKTRupBBnShTfF+x75jwYc2po3v+kimjU
         i1boPexvizor3SY8Y2xO9XN9BIMnuYBK0o4wQduStit6w9MzYXUdjPFHxacobnKw/u/N
         vH6j9KJuHwf+E5OrRws1VninG2Ytv2gtVmVE16leLlZwjNeeApywcvLjrt5fUthIYRp3
         ZfTMI0X7AE9Zd4E9oiC2cagJzpeHmS3PMIwnGJLZ7CgFMyGhRYOveZ9TBsQu0519amfh
         FOPFgfkhBGhyfgC9bn+i/KzLN/WBINbz3UJ4fVahBKKXGLEWSZvAJd2gwmYhKHDlEc/o
         VtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=csppaKmQ1ESJt0WGd0PBHaMkSLI1suVHoGARj7x1z+c=;
        b=rHpaPfQHaXf2ydDNl0oi5OJ0KysAKy08GhIckUMTc1twduiJHEqLF5PRGu7ptOEElV
         vEgRBv/GZ/Bq30HZlFJJz5DknixBqDCieWpmFIFG4udf0dQ/+w8xnMgW/L2DKVQlh7li
         7IO0MkkQnAB6L/GZ57+Mpyqiz4+xTHgmamnYH9XLzfqPZ5Q8Ovm+Z5kBKM1QP3o1P8r5
         9RwK8f705mdm31wwZKf82mQe9gpaBQSrHmwTu8hJRdmNZBQ+72miWq5xi1C2t9+JBbJN
         Nrx1MsAlRZKLZoqSGtWLE7fYlHpc5ez7JLOTAnKe0KpfNIyBuv7nxUgG/AUJiH6IQt29
         2G7Q==
X-Gm-Message-State: ACrzQf3sA9uF1yR9xvt14g+pegCfE1edXEm3K38TFzKjCGg65xcGIz2n
        bIhww93AkPlajEIlJOxdBRlqgCb15JeDSLq6TEnXxg==
X-Google-Smtp-Source: AMsMyM4WPZBeH1UOcgkarIzc3EwJ8qMxeWdcIqwDAbLOVzpbyKHs4boy4ez766cTMTdd70FQi+/DZ4syvDpSJ64ibRo=
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr8765081pgi.403.1664561614652; Fri, 30
 Sep 2022 11:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220930085351.2648034-1-masahiroy@kernel.org>
In-Reply-To: <20220930085351.2648034-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 30 Sep 2022 11:13:23 -0700
Message-ID: <CAKwvOdnS8mGiNWPyn+jA7=MdZ3NsO0zrq2hAK8bvndf_4z1MJQ@mail.gmail.com>
Subject: Re: [PATCH] Kconfig.debug: split debug-level and DWARF-version into
 separate choices
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 30, 2022 at 1:55 AM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> Commit f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO selectable from
> a choice") added CONFIG_DEBUG_INFO_NONE into the DWARF version choice,
> but it should rather belong to the debug level choice.
>
> This commit cosolidates CONFIG options into two choices:

s/cosolidates/consolidates/

>
>  - Debug info level (NONE / REDUCED / DEFAULT)
>
>  - DWARF format (DWARF_TOOLCHAIN_DEFAULT / DWARF4 / DWARF5)
>
> This is more consistent with compilers' policy because the -g0 compiler
> flag means "no debug info".
>
>   GCC manual:
>
>     -g<level>
>
>       Request debugging information and also use level to specify how
>       much information. The default level is 2.
>
>       Level 0 produces no debug information at all. Thus, -g0 negates -g.
>
>       Level 1 produces minimal information, enough for making backtraces
>       in parts of the program that you don=E2=80=99t plan to debug. This =
includes
>       descriptions of functions and external variables, and line number
>       tables, but no information about local variables.
>
>       Level 3 includes extra information, such as all the macro
>       definitions present in the program. Some debuggers support macro
>       expansion when you use -g3.
>
>   Rustc Codegen manual:
>
>     debuginfo
>
>       This flag controls the generation of debug information. It takes
>       one of the following values:
>
>       0: no debug info at all (the default).
>       1: line tables only.
>       2: full debug info.
>
> I moved CONFIG_DEBUG_INFO_REDUCED into the debug level choice.
>
> This change will make it easier to add another debug info level if
> necessary.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

SGTM; thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  lib/Kconfig.debug | 60 +++++++++++++++++++++++++++++------------------
>  1 file changed, 37 insertions(+), 23 deletions(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d3e5f36bb01e..03e75a54be6c 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -232,17 +232,11 @@ config DEBUG_INFO
>           information will be generated for build targets.
>
>  choice
> -       prompt "Debug information"
> +       prompt "Debug information level"
>         depends on DEBUG_KERNEL
>         help
>           Selecting something other than "None" results in a kernel image
>           that will include debugging info resulting in a larger kernel i=
mage.
> -         This adds debug symbols to the kernel and modules (gcc -g), and
> -         is needed if you intend to use kernel crashdump or binary objec=
t
> -         tools like crash, kgdb, LKCD, gdb, etc on the kernel.
> -
> -         Choose which version of DWARF debug info to emit. If unsure,
> -         select "Toolchain default".
>
>  config DEBUG_INFO_NONE
>         bool "Disable debug information"
> @@ -250,9 +244,41 @@ config DEBUG_INFO_NONE
>           Do not build the kernel with debugging information, which will
>           result in a faster and smaller build.
>
> +config DEBUG_INFO_REDUCED
> +       bool "Reduced debugging information"
> +       select DEBUG_INFO
> +       help
> +         If you say Y here compiler is instructed to generate less debug=
ging
> +         information for structure types. This means that tools that
> +         need full debugging information (like kgdb or systemtap) won't
> +         be happy. But if you merely need debugging information to
> +         resolve line numbers there is no loss. Advantage is that
> +         build directory object sizes shrink dramatically over a full
> +         DEBUG_INFO build and compile times are reduced too.
> +         Only works with newer gcc versions.
> +
> +config DEBUG_INFO_DEFAULT
> +       bool "Default-level debugging information"
> +       select DEBUG_INFO
> +       help
> +         If you say Y here compiler is instructed to generate the defaul=
t
> +         level of debugging information.
> +
> +         This adds debug symbols to the kernel and modules (gcc -g), and
> +         is needed if you intend to use kernel crashdump or binary objec=
t
> +         tools like crash, kgdb, LKCD, gdb, etc on the kernel.
> +
> +endchoice # "Debug information level"
> +
> +choice
> +       prompt "DWARF version"
> +       depends on DEBUG_INFO
> +       prompt "DWARF version"
> +       help
> +         Which version of DWARF debug info to emit.
> +
>  config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>         bool "Rely on the toolchain's implicit default DWARF version"
> -       select DEBUG_INFO
>         help
>           The implicit default version of DWARF debug info produced by a
>           toolchain changes over time.
> @@ -261,9 +287,10 @@ config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>           support newer revisions, and prevent testing newer versions, bu=
t
>           those should be less common scenarios.
>
> +         If unsure, say Y.
> +
>  config DEBUG_INFO_DWARF4
>         bool "Generate DWARF Version 4 debuginfo"
> -       select DEBUG_INFO
>         depends on !CC_IS_CLANG || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_=
GNU && AS_VERSION >=3D 23502)))
>         help
>           Generate DWARF v4 debug info. This requires gcc 4.5+, binutils =
2.35.2
> @@ -275,7 +302,6 @@ config DEBUG_INFO_DWARF4
>
>  config DEBUG_INFO_DWARF5
>         bool "Generate DWARF Version 5 debuginfo"
> -       select DEBUG_INFO
>         depends on !CC_IS_CLANG || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_=
GNU && AS_VERSION >=3D 23502)))
>         help
>           Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0=
+ (gcc
> @@ -290,22 +316,10 @@ config DEBUG_INFO_DWARF5
>           config if they rely on tooling that has not yet been updated to
>           support DWARF Version 5.
>
> -endchoice # "Debug information"
> +endchoice # "DWARF version"
>
>  if DEBUG_INFO
>
> -config DEBUG_INFO_REDUCED
> -       bool "Reduce debugging information"
> -       help
> -         If you say Y here gcc is instructed to generate less debugging
> -         information for structure types. This means that tools that
> -         need full debugging information (like kgdb or systemtap) won't
> -         be happy. But if you merely need debugging information to
> -         resolve line numbers there is no loss. Advantage is that
> -         build directory object sizes shrink dramatically over a full
> -         DEBUG_INFO build and compile times are reduced too.
> -         Only works with newer gcc versions.
> -
>  config DEBUG_INFO_COMPRESSED
>         bool "Compressed debugging information"
>         depends on $(cc-option,-gz=3Dzlib)
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
