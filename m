Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70F00663398
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Jan 2023 22:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbjAIV6r (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Jan 2023 16:58:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237880AbjAIV6p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jan 2023 16:58:45 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C46EBC5
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 13:58:44 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id v3so6871224pgh.4
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 13:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8mtKWc4WmtGm6NDppB1FPmywRJwZewn7Wl9vLbuK9vw=;
        b=SXyWMObFZXeTNyQecHi104uVS3C5VVNdbITrtvMou5aDqzX/U4NRz7uvEIsM8Onyco
         x8qqLrvh0HSwV3fczYkK93qVBE1SWVIm5mK9HzYglylMhUJMaXqn7bL6FtcjEoZEo/fo
         OcjstuljDhRYrS830xjpdSB77YwrYtXuM+PYffd8oCYXe+qhIHx87mShQzdUWimUiypY
         QNKHUicr800mVPn0COXPqDU4vjZAVpA83JY6L6WaC9XuTG0bw7sSTuItcNytIXboiUkK
         JB8evh3Cgq1lCllojmImBjDJpZSraooL+3WVJsi+rOxRCXx/O5eGPvvgudRNalID0dyL
         rXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mtKWc4WmtGm6NDppB1FPmywRJwZewn7Wl9vLbuK9vw=;
        b=S50HS81bbCSyjOWrDBMtuEgMSchMkpIHNEFalBH68kdobZazQWM9gZ9wZup7bUg4rZ
         wZzGU2HXlydssizje4T3JOe9727mywjNyCdVUXYd0wukHooB0yhvQmes6n3nAxEaSKDa
         cfdUwB6vxbiSjdfCMeY+CDNdZviGJdpF6P+QIzk2jml8bWpJrJnWwt+T9VuMYL+wWaQa
         ePW+ctAx2Usv4BZMa5SHJd8jChmFlQGStGEwzlwDS1NPmQQHvL+jcCgNYQPTtl+jYTbe
         Q/M7I7Ya9NvPjeW/g89wtJy6yzJuwpTPabc3XqbvhA/xCoBXWzWmbCOGQ1lFXmHhi02n
         eVEQ==
X-Gm-Message-State: AFqh2krhW50sS65LYs5jzTuck86N9L01PQ4ZHrc/wpzzXwNVubE9ocdF
        XedaneUiGmessXBTKnw3TbWSip2Sz2cMmqmwYxyBBw==
X-Google-Smtp-Source: AMrXdXsTlZoISLITCF02n+J4dXMcvFqFszZPB4liS+mZyZpp5BBYwkngdTAnTeTZgwlDRJLb/yCfd+smm6q/Dgm9C1w=
X-Received: by 2002:a63:4943:0:b0:478:e6cf:c24c with SMTP id
 y3-20020a634943000000b00478e6cfc24cmr5128347pgk.365.1673301523884; Mon, 09
 Jan 2023 13:58:43 -0800 (PST)
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org> <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-6-658cbc8fc592@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Jan 2023 13:58:32 -0800
Message-ID: <CAKwvOdknEE7DyUG0s43GNGf27QeMgW2fUTXcCzKLbjH1g318vQ@mail.gmail.com>
Subject: Re: [PATCH 06/14] powerpc/vdso: Remove unused '-s' flag from ASFLAGS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org
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

On Wed, Jan 4, 2023 at 11:55 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> warns that ASFLAGS contains '-s', which is a linking phase option, so it
> is unused.
>
>   clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]
>
> Looking at the GAS sources, '-s' is only useful when targeting Solaris
> and it is ignored for the powerpc target so just drop the flag
> altogether, as it is not needed.

Do you have any more info where you found this?  I don't see -s
documented as an assembler flag.
https://sourceware.org/binutils/docs/as/PowerPC_002dOpts.html
https://sourceware.org/binutils/docs/as/Invoking.html

The patch seems fine to me, but what was this ever supposed to be?
FWICT it predates git history (looking at
arch/powerpc/kernel/vdso32/Makefile at fc15351d9d63)

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: mpe@ellerman.id.au
> Cc: npiggin@gmail.com
> Cc: christophe.leroy@csgroup.eu
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/vdso/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
> index 6a977b0d8ffc..45c0cc5d34b6 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
>  ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
>
>  CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
> -AS32FLAGS := -D__VDSO32__ -s
> +AS32FLAGS := -D__VDSO32__
>
>  CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
> -AS64FLAGS := -D__VDSO64__ -s
> +AS64FLAGS := -D__VDSO64__
>
>  targets += vdso32.lds
>  CPPFLAGS_vdso32.lds += -P -C -Upowerpc
>
> --
> 2.39.0



-- 
Thanks,
~Nick Desaulniers
