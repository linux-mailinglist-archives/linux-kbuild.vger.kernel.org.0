Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91733F2126
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 21:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhHST4e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 15:56:34 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:33626 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231417AbhHST4d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 15:56:33 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17JJtZIr026897
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Aug 2021 04:55:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17JJtZIr026897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629402936;
        bh=q4geEpZ1/sJM5K2yjyzyxclzCbd3hjZxXnY8j4k52go=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cRYeXlklECG+nrQ8rStshkfo+Ha3sd4mWgIX0Fby5SLiZBB6zH734i03jXHh4nBqT
         K2ATkA4mLsltdAJT/ONCjcoqUrqv0lMOC7O97VjhaWzh44QZZApyE/zerGvVjc0PNP
         riAzAQ98IgSWfurWIdpCipOhlpsqJCf6oepzPS4qa/spC3bHH1m60U9azosybN+7+x
         WGVpDti+yQmYRGZqT8il5jcQwopmavSaJfcSXjzQiOdoub62YxsjlIln6zjOsczAJK
         bny2YCGGi7HdzBd2RJyD9Ul0dtwBZxvXpM2HcCZl56h7bTHpYeBaxSg8cx7E+Vc9D9
         xO/JovV1Rnknw==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id nt11so5749347pjb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 12:55:36 -0700 (PDT)
X-Gm-Message-State: AOAM532Zsl3+GivLFAPQpJ8EAaeoQzcNkggVcfPXnNefdtJGhcPq7ff6
        VPc47WE0tcqylMFeeu3lp60B2pR7EGXZChzOssU=
X-Google-Smtp-Source: ABdhPJxR59H4McaYpNLR4dGFoIDQXNH2TmeUQr2Wx3wezcCPzHaEMdQeUwd0A9yxT87s1+cbYYzCDTk8qDsu5F+R8e4=
X-Received: by 2002:a17:90a:ea87:: with SMTP id h7mr458343pjz.198.1629402935417;
 Thu, 19 Aug 2021 12:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com> <20210817002109.2736222-6-ndesaulniers@google.com>
In-Reply-To: <20210817002109.2736222-6-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 20 Aug 2021 04:54:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmWmS+vO1hxai24fN78pCirF_jJqWs8BR_FkfrAACFOw@mail.gmail.com>
Message-ID: <CAK7LNATmWmS+vO1hxai24fN78pCirF_jJqWs8BR_FkfrAACFOw@mail.gmail.com>
Subject: Re: [PATCH 5/7] x86: remove cc-option-yn test for -mtune=
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 9:21 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> As noted in the comment, -mtune= has been supported since GCC 3.4. The
> minimum required version of GCC to build the kernel (as specified in
> Documentation/process/changes.rst) is GCC 4.9.
>
> tune is not immediately expanded. Instead it defines a macro that will
> test via cc-option later values for -mtune=. But we can skip the test
> whether to use -mtune= vs. -mcpu=.
>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: x86@kernel.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/x86/Makefile_32.cpu | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
> index cd3056759880..e7355f8b51c2 100644
> --- a/arch/x86/Makefile_32.cpu
> +++ b/arch/x86/Makefile_32.cpu
> @@ -2,13 +2,7 @@
>  # CPU tuning section - shared with UML.
>  # Must change only cflags-y (or [yn]), not CFLAGS! That makes a difference for UML.
>
> -#-mtune exists since gcc 3.4
> -HAS_MTUNE      := $(call cc-option-yn, -mtune=i386)
> -ifeq ($(HAS_MTUNE),y)
>  tune           = $(call cc-option,-mtune=$(1),$(2))
> -else
> -tune           = $(call cc-option,-mcpu=$(1),$(2))
> -endif
>
>  cflags-$(CONFIG_M486SX)                += -march=i486
>  cflags-$(CONFIG_M486)          += -march=i486
> --
> 2.33.0.rc1.237.g0d66db33f3-goog
>

LGTM.

Perhaps, a follow-up patch can remove the tune macro too,
replacing  $(call tune,pentium2) with $(call cc-option,-mtune=pentium2)







--
Best Regards
Masahiro Yamada
