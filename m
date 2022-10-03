Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6373C5F33E8
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Oct 2022 18:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbiJCQx1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Oct 2022 12:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiJCQxZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Oct 2022 12:53:25 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D351A24099
        for <linux-kbuild@vger.kernel.org>; Mon,  3 Oct 2022 09:53:24 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 70so10379427pjo.4
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Oct 2022 09:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=gZKEiTUAFXZosZUTE0DVKhThrNQqN4l1F7V4i7rzUeA=;
        b=o5TDDhqMiYi/K0MtXNmkiwycZaDqOD2l4xsqFKTZanBx3k7SfgyRxpOmwpQLPryXUR
         grgkZ965pst0bXVyKwjzLY6f1YNCTxW5dTPw6mUwtchyeDVsQKwBfbCFkp+9A5gpBItI
         TrEUYPTTCXC9mxifIr6UZYI54irowJVOAH7uBOY2VlU9XTcRhYz2hUcyP6/lrqTxJ1qn
         1zc72wS2UM2jB+rSuTFQa5iZyaivDbqQdf0HMW3gAJ3rvTC3K7zCFPl3lqW5TV/LxOlv
         M1X28qtr/TMe1GLR6HjEpctvfSpr/4Fe5KDbrCWlhDqc6YNBzJByZK10JnMCs09kXeba
         MzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gZKEiTUAFXZosZUTE0DVKhThrNQqN4l1F7V4i7rzUeA=;
        b=bG1L+j/U6mi3v8LWkCczvI7YVsX7sLtEO3ZZQ7ATqS+wo+Ae6Qv1y2R0Aanghd2Q7s
         bOeEiw+qy7EHGPU3tJL+kX5yKYthVbcGnTM5Ir6v1VMqSY5AyD6kVHFS6GPGr87qPk51
         y0lpjDG7kF/LaqvLOl0xn8QcfQ5VMH3aQPdeq4W3LlEE5qzpMd5yTsKG0x1V3RHzeB7x
         //Ppp0j/zF0BeEPY1YyC7I2iPHITNtmYMMcMrt4VGTGZ0CiCGjUwrqxyioQQNoq5jD9S
         HUJWyM8YS/rc5iWLVaA7a9UmxKoBiNNKuKj1JC49AFjYaSud2byamOx66h7sz5mMMQJX
         p/cw==
X-Gm-Message-State: ACrzQf3Rvz1Bwn6raWFevUUd6lWinweQbfVLliwTN1FaG0BKhqxUZgR3
        r9KzNw+/0xGOaGn6vQAx9eaRmX4mkWAhY+a/H1aT8Q==
X-Google-Smtp-Source: AMsMyM5CDeD+wdruJsiYbQMn/0gNAkrS8VhVLsm7oItP4SziHtS/RVb3RiWdudu02VlWFT9tltTDxgN399CLC9OkTno=
X-Received: by 2002:a17:90b:3a88:b0:209:f35d:ad53 with SMTP id
 om8-20020a17090b3a8800b00209f35dad53mr13175321pjb.102.1664816004128; Mon, 03
 Oct 2022 09:53:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221002181107.51286-1-masahiroy@kernel.org> <20221002181107.51286-2-masahiroy@kernel.org>
In-Reply-To: <20221002181107.51286-2-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 3 Oct 2022 09:53:13 -0700
Message-ID: <CAKwvOdk9BxB03X6rm6J7orjR9Cou5NqNKe3D1x4nzxwZZNS6sg@mail.gmail.com>
Subject: Re: [PATCH 1/3] Kconfig.debug: simplify the dependency of DEBUG_INFO_DWARF4/5
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 2, 2022 at 11:11 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit c0a5c81ca9be ("Kconfig.debug: drop GCC 5+ version check for
> DWARF5") could have cleaned up the code a bit deeper.
>
> "CC_IS_CLANG &&" is unneeded. No functional change is intended.

This implies that there are only 2 compilers capable of building the
kernel; consider also removing
include/linux/compiler-intel.h
if ICC is no longer supported.  Otherwise, what implications does this
patch have for ICC?

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  lib/Kconfig.debug | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index d3e5f36bb01e..f4b2165f24db 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -264,7 +264,7 @@ config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
>  config DEBUG_INFO_DWARF4
>         bool "Generate DWARF Version 4 debuginfo"
>         select DEBUG_INFO
> -       depends on !CC_IS_CLANG || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
> +       depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
>         help
>           Generate DWARF v4 debug info. This requires gcc 4.5+, binutils 2.35.2
>           if using clang without clang's integrated assembler, and gdb 7.0+.
> @@ -276,7 +276,7 @@ config DEBUG_INFO_DWARF4
>  config DEBUG_INFO_DWARF5
>         bool "Generate DWARF Version 5 debuginfo"
>         select DEBUG_INFO
> -       depends on !CC_IS_CLANG || (CC_IS_CLANG && (AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)))
> +       depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
>         help
>           Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
>           5.0+ accepts the -gdwarf-5 flag but only had partial support for some
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
