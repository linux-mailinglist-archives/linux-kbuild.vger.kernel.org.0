Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9CFB4D525F
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Mar 2022 20:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241288AbiCJTRV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Mar 2022 14:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236720AbiCJTRU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Mar 2022 14:17:20 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497C91592B8
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Mar 2022 11:16:19 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n19so11144334lfh.8
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Mar 2022 11:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=go92KYaN5aNvN8bXbqqxD++j8ixdpZLOPabJY6m9jQw=;
        b=LMIIbB0h1/4pQ0VdwUiOVE5d8NYb+t5fKYOcBza0G4sUYUWMDPGXo6a0id4sFW37kU
         6PZ2zExV/hzV0YuLWmcwShIUaxVm9631BL2nPdiIHiZGdGkS915lgqkRKgnNzjIJRABq
         3p1plaVXJ4Xyv6Y/3l4odxQrdGFhBBcovjO2Ov1AovSwcNpnnk5EtWg/AIWe9NqtZRNm
         SpWjOXK61WvLZdF+uhKHXmIVdc8jO6xY5SN7yP/WdujHoRlSZ6/zXbrAz+y7O+Dbtm3g
         Ozlpm0qv5imV2YW5vd/0MDNm7DFvkJDqOehkFMPsktIyHGsWxGU0R9DWREfGW0uwXnRG
         lFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=go92KYaN5aNvN8bXbqqxD++j8ixdpZLOPabJY6m9jQw=;
        b=A8mh8snJOyP2WnhJuW80idNNnNmHdVvMJXEqSaEQIcEGgSMeTaxgMwLkYhLG3ws1iG
         lmzoMgLZyQQ2CTKScFFYOglgKAIpxmHB9R94ywr47cd1Cu87A6QD+NtU6VCdqyE0/G15
         HFisrLMEsBL+WvvMPGDmCT8aQxXcDDxXgqI46Madkf+K/nldwUAy+JY+q7DzU00REB10
         ttsgLEzFAzWmV2sERQrPC8KsdsdNsjVWun+5FLA3Na5SMemrXuJ93SSHLSkmRmInHXgP
         hAhTzXv/d9fOb2XPbRDieT6F5CPUZdqdg2lv9yd1x2GI+/HdOSWy+yMPkH/XNxVBjHe2
         fAnw==
X-Gm-Message-State: AOAM530LEY7C3Bb3Jn+lzOaZBU0q459yypsF5QBFJKVgWeC4S4zzVtbX
        TAAqAshx1Lctk5vO6cKMr6QeYUw7X0jv4HMYe9EtIw==
X-Google-Smtp-Source: ABdhPJzEWqQmXRfdkmydm0aeWMsZ+uV0rW00eQolc1dHSilGfFUrRNnedV8T2t9cApwOAE7/envXItTTv3uQAduPaEY=
X-Received: by 2002:a05:6512:31d4:b0:445:e4ef:c0f8 with SMTP id
 j20-20020a05651231d400b00445e4efc0f8mr3847544lfe.626.1646939777382; Thu, 10
 Mar 2022 11:16:17 -0800 (PST)
MIME-Version: 1.0
References: <20220305125605.149913-1-masahiroy@kernel.org>
In-Reply-To: <20220305125605.149913-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 10 Mar 2022 11:16:05 -0800
Message-ID: <CAKwvOdkYs8wkFOGpPc6SKY8CSFHdT8t_AJdFTkSCr+43dm20Mg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add --target to correctly cross-compile UAPI
 headers with Clang
To:     Masahiro Yamada <masahiroy@kernel.org>,
        David Howells <dhowells@redhat.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
        Fangrui Song <maskray@google.com>,
        "Dmitry V. Levin" <ldv@altlinux.org>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Kerrisk <mtk.manpages@gmail.com>,
        =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>
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

On Sat, Mar 5, 2022 at 4:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When you compile-test UAPI headers (CONFIG_UAPI_HEADER_TEST=y) with
> Clang, they are currently compiled for the host target (likely x86_64)
> regardless of the given ARCH=.
>
> In fact, some exported headers include libc headers. For example,
> include/uapi/linux/agpgart.h includes <stdlib.h> after being exported.
> The header search paths should match to the target we are compiling
> them for.

Isn't that a bug in that header though? Why does it inconsistently use
size_t vs. __kernel_size_t. Shouldn't it be consistently using
__kernel_size_t? (Seeing TRUE/FALSE defined in such a low level header
is also *yikes*.) Are there platforms where sizeof(size_t) !=
sizeof(__kernel_size_t)?

Usually to bootstrap a toolchain you need to start with kernel headers
to bootstrap the libc.  It seems like some kind of circular dependency
to me if kernel headers are dependent on libc headers. Hence my
previous comment about -ffreestanding.

>
> Pick up the --target triple from KBUILD_CFLAGS in the same ways as
> commit 7f58b487e9ff ("kbuild: make Clang build userprogs for target
> architecture").

Oh boy thanks for finding+fixing this! I still suspect we shouldn't
need a cross-libc for UAPI header testing, and that the kernel headers
simply need to be cleaned up. But regardless of that it doesn't make
sense to use the wrong target when checking headers generated for the
target. Thanks for the patch (and sorry I've been falling behind on
code review lately).

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2:
>   - Reword the commit description to mention agpgart.h instead of
>     asound.h because the latter is in the no-header-test list.
>
>  usr/include/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/usr/include/Makefile b/usr/include/Makefile
> index ac206fb27c65..4215801e1110 100644
> --- a/usr/include/Makefile
> +++ b/usr/include/Makefile
> @@ -10,7 +10,7 @@ UAPI_CFLAGS := -std=c90 -Wall -Werror=implicit-function-declaration
>
>  # In theory, we do not care -m32 or -m64 for header compile tests.
>  # It is here just because CONFIG_CC_CAN_LINK is tested with -m32 or -m64.
> -UAPI_CFLAGS += $(filter -m32 -m64, $(KBUILD_CFLAGS))
> +UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
>
>  # USERCFLAGS might contain sysroot location for CC.
>  UAPI_CFLAGS += $(USERCFLAGS)
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
