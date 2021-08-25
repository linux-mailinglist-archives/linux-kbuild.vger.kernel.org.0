Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CFE3F6E8A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 06:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhHYEpd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 00:45:33 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:31613 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbhHYEpd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 00:45:33 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17P4iMnk018605
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 13:44:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17P4iMnk018605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629866663;
        bh=DqIvSHtgFoXALuHZn57Z3KEbfy5yQoRH9FoiaBdwibI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bUsfxEAV0fZP6HAyhHIuYP05+H92XsTdiFdwSVAkCyYh23yUZ1cKvMamCw1GfwWrl
         Ywhd1oOa1jCSUnwrefDbaZv4h95IYtH1AeUSPc7VZPpnLG4/7XPlqr9/qimNcJxsxO
         yJK/JQX5+FNFVII+aXGUFcvMufJ1eA9pVUCGYCA3roXh3Js8FjYSoutINE6gmWJg79
         gzLsJejAOsEXs9N8esXrGseu5cMEyUNQOrVQDGObwAoUyM8M6+qEG8x4PFyZZoXNnz
         Q5lhF7Q7VSf2Orhu7aZsnx7+ASnJKwOn/+i8/6/vwADcQb8a+XDljI6M4nFwx0L+7h
         WWbpNB6ep1/og==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id e15so13578968plh.8
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Aug 2021 21:44:22 -0700 (PDT)
X-Gm-Message-State: AOAM532hZ7suQ4ZVk1pfsFSjox4WJ4dVtoqW4QKExHUqpZRB+rykToSI
        DCbkpuxx6IanNkbzdagUKtBANwYHZvkfoRoe94Y=
X-Google-Smtp-Source: ABdhPJw4lY96u3XcTdagW/906fLBrhp/oeThudfUKpvu0mKLbKei/lIJGMssJpO2Z3pSqLjzYzAvy4r05T2V9pUaOsk=
X-Received: by 2002:a17:90a:9314:: with SMTP id p20mr8470039pjo.87.1629866662071;
 Tue, 24 Aug 2021 21:44:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com> <20210817002109.2736222-7-ndesaulniers@google.com>
In-Reply-To: <20210817002109.2736222-7-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Aug 2021 13:43:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7E9uMJfCGsFPkP_z9y0Y_PrXXzMTRRiwsbj66bTi8SQ@mail.gmail.com>
Message-ID: <CAK7LNAS7E9uMJfCGsFPkP_z9y0Y_PrXXzMTRRiwsbj66bTi8SQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] Makefile: replace cc-option-yn uses with cc-option
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 9:21 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
>
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
>
> This allows us to pursue removing cc-option-yn.
>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 72f9e2b0202c..f76be5f62d79 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -967,7 +967,7 @@ ifdef CONFIG_FUNCTION_TRACER
>  ifdef CONFIG_FTRACE_MCOUNT_USE_CC
>    CC_FLAGS_FTRACE      += -mrecord-mcount
>    ifdef CONFIG_HAVE_NOP_MCOUNT
> -    ifeq ($(call cc-option-yn, -mnop-mcount),y)
> +    ifneq ($(call cc-option, -mnop-mcount),)
>        CC_FLAGS_FTRACE  += -mnop-mcount
>        CC_FLAGS_USING   += -DCC_USING_NOP_MCOUNT
>      endif
> --
> 2.33.0.rc1.237.g0d66db33f3-goog
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210817002109.2736222-7-ndesaulniers%40google.com.



I am fine with this change, but
is there any reason why you did not touch the following hunk?



ifdef CONFIG_HAVE_FENTRY
  # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
  ifeq ($(call cc-option-yn, -mfentry),y)
    CC_FLAGS_FTRACE     += -mfentry
    CC_FLAGS_USING      += -DCC_USING_FENTRY
  endif
endif









-- 
Best Regards
Masahiro Yamada
