Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACCA42C914
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 20:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238739AbhJMSwW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Oct 2021 14:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhJMSwU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Oct 2021 14:52:20 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D75C061749
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Oct 2021 11:50:17 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i24so15451893lfj.13
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Oct 2021 11:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8/P8tB/Z2lB3uczx8fuNs4yrMjdgai73jQwqgSmb8k=;
        b=kDywsRyuPxVHakfyaPBhZGFsKn8P4P0Orn2Y9o0bfVo3J1d4YQZHM3XDib2XXfdWRs
         KTmYLFOmkI72Z1QGH14GvjX6AYTmZDaS5dPBLcz6wdhhka5qkR2cU5HScrfq4eii9joB
         kJjGWi78b/h0zw8iYk9t9gAym09ABl/pER9JXtJLYgxQ76TT9SVBaLAHX0NHc43gYtpv
         IT8uisa6SAJ5YyHZQGUMVqG+3X4K8BBUc6GIlt52UJw1KnuqCIAIzZwGOt7sIWLXLM4M
         bbF0pE5C2+pwsgZA7jHkaRqoaaFO9M5F6awahLSQp4rxAF+ikhwtg2LfOdeyXOevu15n
         rmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b8/P8tB/Z2lB3uczx8fuNs4yrMjdgai73jQwqgSmb8k=;
        b=Jp03eXKgM1plGW458wxSkFbJ+z2Dws/dgb9H3W4hFA5I0905wEuNO+FOIZUmVtSTtf
         qDi4sS7QOFDCoOevSSE/SJFSKJESA3AdCo0qPhH7Cpv36sg9AMEN14K1x4dWicg3kZzy
         SR2aCNHwptBHaU3Z8GuKsJuRz6e07MHT6w/KsTNWRSPc+sELJ2F7XqqSungpc7mPCQ3C
         WsywMP3sk8379vO4rmAjZttbrGxDlhQazCLJD8qq/ka1ht/QSwPo9Q2nQ/2F+4VE7099
         Mq9/jR/MfqmDhFHRDeL0MZKxUGmbaLu1lEIIoNwyn9oeVWXNC1ZcQEG2qbt9Kru6ZU+n
         FLRQ==
X-Gm-Message-State: AOAM530E6eVE88z2y5NKtBsXZmpiS8NkBf7CxBIjxSOKwDDrxACSCmU6
        TlX7N+QSEYDql2EIcTaG0xpQ0XPFJfdKtSUES63k/Q==
X-Google-Smtp-Source: ABdhPJybMQxtFkt+CSaxFXxXt2PhnxWlWW8tmKXXryRxD06ne8odxGrqIGRARW9LCy1ltHsb2ZBF1fp2E4wP78hKYmc=
X-Received: by 2002:a05:6512:4c7:: with SMTP id w7mr700247lfq.444.1634151015014;
 Wed, 13 Oct 2021 11:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <1634148189-29393-1-git-send-email-ashimida@linux.alibaba.com>
In-Reply-To: <1634148189-29393-1-git-send-email-ashimida@linux.alibaba.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 13 Oct 2021 11:50:03 -0700
Message-ID: <CAKwvOd=qxHU41HFEWLAz6DOvSMPdW863E9SKVe0PFK0ePDvizQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH V3]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Dan Li <ashimida@linux.alibaba.com>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        catalin.marinas@arm.com, will@kernel.org, keescook@chromium.org,
        nathan@kernel.org, tglx@linutronix.de, akpm@linux-foundation.org,
        samitolvanen@google.com, frederic@kernel.org, rppt@kernel.org,
        mark.rutland@arm.com, yifeifz2@illinois.edu, rostedt@goodmis.org,
        viresh.kumar@linaro.org, andreyknvl@gmail.com,
        colin.king@canonical.com, ojeda@kernel.org,
        luc.vanoostenryck@gmail.com, elver@google.com,
        nivedita@alum.mit.edu, ardb@kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-hardening@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 13, 2021 at 11:03 AM Dan Li <ashimida@linux.alibaba.com> wrote:
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 62c3c1d..da2da8c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -81,7 +81,7 @@ config ARM64
>         select ARCH_SUPPORTS_DEBUG_PAGEALLOC
>         select ARCH_SUPPORTS_HUGETLBFS
>         select ARCH_SUPPORTS_MEMORY_FAILURE
> -       select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
> +       select ARCH_SUPPORTS_SHADOW_CALL_STACK if (CC_HAVE_SHADOW_CALL_STACK || GCC_PLUGIN_SHADOW_CALL_STACK)
>         select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
>         select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select ARCH_SUPPORTS_CFI_CLANG
> @@ -1062,7 +1062,7 @@ config ARCH_HAS_FILTER_PGPROT
>
>  # Supported by clang >= 7.0
>  config CC_HAVE_SHADOW_CALL_STACK
> -       def_bool $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)
> +       def_bool (CC_IS_CLANG && $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18))

I guess since clang supported SCS since clang-7, but the minimally
supported version of clang according to
Documentation/process/changes.rst is 10.0.1, then this could be:

def_boot CC_IS_CLANG || $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)

Then we won't have to touch it again once SCS lands in upstream GCC,
as the cc-option test will start to pass?
-- 
Thanks,
~Nick Desaulniers
