Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC672649C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 18:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgIJQbe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 12:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgIJQ0p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 12:26:45 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542CAC061757;
        Thu, 10 Sep 2020 09:26:21 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f142so6620268qke.13;
        Thu, 10 Sep 2020 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u6ipngvB4JWmCirHiN613ekfbG1vVvJJvC/3Qroc/h4=;
        b=DQagOZDOT9VqXFwVB+dkIE3jQpoY/zrtom7izhYOg/bqtMTt2+ERhXCXfoD0apNiRW
         z5ZhAl6oFjX2VTSNSnQI0ulS/Ju0QoH16cgdiPE0Pei2dztMAdYsDQ4pm9ZJUnJgHGmD
         YhAeg0uCkoYLl2zyod6/ySwLc/+yPPXHLyjayg4HBmGYzqttrYI+4+ZDSJmD0QdKEUfq
         FLw7qMmlO5QXXw+YyGhoVFBS3WkeuvXobkOhjbt+rM1GF+y0fonU0NdpV1vPxzZaRx8s
         zHX8ngswv1h6MwoZ+giVrcv02tZ5QS4qQn6V6JekfCIPac+oQLBBDI7XLhJ062u6/iP0
         bHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u6ipngvB4JWmCirHiN613ekfbG1vVvJJvC/3Qroc/h4=;
        b=ZVetFd0lIlM10L94z9pp3Un/2yHfBKCg5G0CcO0bQHXRQDK412+xNiCiAB+h/3jzGC
         x3tMwCipAUKDvjH0X5NQ25iuyznBMtPlYrCWSv96Ryd8OQfLEZ2xvIn7lTkMNdpvEC19
         5WX0gYiHQrB1h9aJAkLEW6hlWkkfo/cd7YFk2OXo85CIv0NJX9axbMmxM/VE38X5AW7M
         EbJPQpdWRPEKFeChgIFuWf1VZCTasBtt2Ue7sQFBFh+YOTx9JQiknVRNNF1yH8YBiwC1
         w9DlDWcXZXkod9zIg+M1lxrWyMeFct6eJ5x+B7BwhQrOGwc/OxmHwbF4JNUG0f5cd4eL
         NDfg==
X-Gm-Message-State: AOAM530ao8LcXUgQgFicxsKCu1qN2W/lryGmkNmjD4GIQEWBV+kDA8GT
        INSLI0zzesDRDjbXyrUWGbs=
X-Google-Smtp-Source: ABdhPJyKeaURFSZ52gJgA2Rq5+VQW6v3QZzcl9Td9Bf1H0J1p3MyR4dI4EKuNA5vgDRzH8WbvpMlkQ==
X-Received: by 2002:a37:a7cb:: with SMTP id q194mr8685507qke.183.1599755180181;
        Thu, 10 Sep 2020 09:26:20 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id 15sm6630858qka.96.2020.09.10.09.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 09:26:19 -0700 (PDT)
Date:   Thu, 10 Sep 2020 09:26:17 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] kbuild: remove cc-option test of -fno-strict-overflow
Message-ID: <20200910162617.GA3119896@ubuntu-n2-xlarge-x86>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910135120.3527468-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 10, 2020 at 10:51:17PM +0900, Masahiro Yamada wrote:
> The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> 
> Here is the godbolt:
> https://godbolt.org/z/odq8h9
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Appeared in clang 3.0.0 in commit 6e50103acda2b918545f30141edeb991d766f2a4.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  Makefile                          | 2 +-
>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4b5a305e30d2..059b36f2ea53 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -922,7 +922,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
>  KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
>  
>  # disable invalid "can't wrap" optimizations for signed / pointers
> -KBUILD_CFLAGS	+= $(call cc-option,-fno-strict-overflow)
> +KBUILD_CFLAGS	+= -fno-strict-overflow
>  
>  # clang sets -fmerge-all-constants by default as optimization, but this
>  # is non-conforming behavior for C and in fact breaks the kernel, so we
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index d6adb4677c25..dfffd55175a3 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -90,7 +90,7 @@ VDSO_CFLAGS  += -O2
>  # Some useful compiler-dependent flags from top-level Makefile
>  VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
>  VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
> -VDSO_CFLAGS += $(call cc32-option,-fno-strict-overflow)
> +VDSO_CFLAGS += -fno-strict-overflow
>  VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
>  VDSO_CFLAGS += $(call cc32-option,-Werror=date-time)
>  VDSO_CFLAGS += $(call cc32-option,-Werror=incompatible-pointer-types)
> -- 
> 2.25.1
> 
