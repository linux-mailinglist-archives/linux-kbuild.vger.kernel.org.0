Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4245E875C
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Sep 2022 04:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbiIXCUU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 23 Sep 2022 22:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbiIXCUS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Sep 2022 22:20:18 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC2F6717B
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Sep 2022 19:20:15 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id e5so1729785pfl.2
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Sep 2022 19:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=OqGIr83avsKieKKHgb8l4/PvPv6lvnyXb0Oxt5Keb0M=;
        b=QQ2mfUv7p7UJJ/wu8hdvLQLwax8cFTF5n3JslE8afwFsUqYiwWTNLPOeahX66KI2xU
         pDfYguqdCC25fWFqX2NyI3GapDMuvIx7JnjqNeg5p7nERCDN8qqACmMANbPZvfLbno6d
         Mv0d3NK+8Rfsq2ZbmkjIAB8CdE5ZKYkis64UD7ZU05IeWUCpOE0LmsJWNC7hxvOnsdiE
         /79BRdEO43VapKsi/VjSkpTtPEWap2sP+h/UjmdXxhZ8bwpswhbzCPh1cBSfXew0yzZm
         gIiYt10YcviacZxs3sT+HrJNhaypCeeqjN2z6FpaAfXnvaL7YtYTk1SgGadaY7NGE8YG
         Tyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=OqGIr83avsKieKKHgb8l4/PvPv6lvnyXb0Oxt5Keb0M=;
        b=tsvRzDq0s1CpmQ/dMW4AaKgi+GBzH0OWP/zMguLtdzNQ+mlQUdIzPnWL85hIWkZTB3
         kiujW1uZ5f3SF0GfVm2BHPk8URCNw1Jw+VvGS/6oOWwvHUXdWug7zFNtfaLqFkR60OjS
         OpSCH1YsIC9ob8B3V+58QlokpvICbZRUmS9T7ttdLItsbg1uRv8owRUbnhvsj2C1+1KF
         eSEI9869g/Nu8MMF3H1vhpvEzTC4N5uLrDA+3nzPenbc8ZwEn3t+Z/aK/wFhIYy84xnW
         3u0rTcHtd4Vw6sxvqZK1qhDSU7QfLJHnkTRWItL9gdqdyJdaHUz0EQk/GMNbtnSTsoW8
         iOHQ==
X-Gm-Message-State: ACrzQf2p4CicJjQstsvJ1/kEjVSeUk9uuAgWqfKsGzhc80LlBPplG7bl
        QsItKFtNt5rR41Ts0iNDhVuv5yt5wsPKWd8XOSB4xQ==
X-Google-Smtp-Source: AMsMyM47XGX6nnzq5zmVPJ7WKLYQDZAJKqYRNc7f22QCqvjJW0pgWzz/uaUULwJ59wBC0CNTwE+37EAtcRnqsyT4LFw=
X-Received: by 2002:a63:e709:0:b0:438:98e8:d1c with SMTP id
 b9-20020a63e709000000b0043898e80d1cmr10283997pgi.403.1663986014944; Fri, 23
 Sep 2022 19:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
 <20220919174547.3730737-1-ndesaulniers@google.com> <CAK7LNAS5xSQTjDuu+dsNW2fOz1-s7x0gsCLmfQOnGpb5CY06KA@mail.gmail.com>
In-Reply-To: <CAK7LNAS5xSQTjDuu+dsNW2fOz1-s7x0gsCLmfQOnGpb5CY06KA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 23 Sep 2022 19:20:03 -0700
Message-ID: <CAKwvOdk-oj24MQs-W0Xs6p33f+Ei7Wu3wwCX+d34T=xoOPxOiw@mail.gmail.com>
Subject: Re: [PATCH v4] Makefile.debug: re-enable debug info for .S files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Bill Wendling <morbo@google.com>,
        Greg Thelen <gthelen@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Sep 23, 2022 at 7:12 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This patch still misses the debug info for *.S files
> for the combination of LLVM_IAS=0 and
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> because, as the comment says, Clang does not pass -g down to GAS.
>
>
> With "[v4] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT"
> and this one applied,
>
>
>
> $ grep CONFIG_DEBUG_INFO_DWARF .config
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> $ make LLVM=1 LLVM_IAS=0 arch/x86/kernel/irqflags.o
>   SYNC    include/config/auto.conf.cmd
>   SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
>   SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
>   SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
>   HOSTCC  arch/x86/tools/relocs_32.o
>   [snip]
>   AS      arch/x86/kernel/irqflags.o
> $ objdump  -h arch/x86/kernel/irqflags.o | grep debug
> $
>
>
>
>
>
>
>
>
> I think the following fix-up is needed on top.
>
>
>
>
> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> index d6aecd78b942..8cf1cb22dd93 100644
> --- a/scripts/Makefile.debug
> +++ b/scripts/Makefile.debug
> @@ -1,4 +1,5 @@
> -DEBUG_CFLAGS   := -g
> +DEBUG_CFLAGS   :=
> +debug-flags-y  := -g
>
>  ifdef CONFIG_DEBUG_INFO_SPLIT
>  DEBUG_CFLAGS   += -gsplit-dwarf
>
>
>
>
> Then, I can see the debug sections.
>
>
>
> $ make LLVM=1 LLVM_IAS=0 arch/x86/kernel/irqflags.o
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   AS      arch/x86/kernel/irqflags.o
> $ objdump -h arch/x86/kernel/irqflags.o | grep debug
>   6 .debug_line   00000050  0000000000000000  0000000000000000  0000008f  2**0
>   7 .debug_info   0000002e  0000000000000000  0000000000000000  000000f8  2**0
>   8 .debug_abbrev 00000014  0000000000000000  0000000000000000  000001d0  2**0
>   9 .debug_aranges 00000030  0000000000000000  0000000000000000  000001f0  2**4
>  10 .debug_str    0000004d  0000000000000000  0000000000000000  00000250  2**0
>
>
>
>
>
> If you agree, I can locally fix it up as such.

Ah, sorry I missed testing that combination. Thanks for your
thoroughness. Yes please apply that diff on top.
-- 
Thanks,
~Nick Desaulniers
