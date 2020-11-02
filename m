Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAD52A28E2
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 12:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgKBLSD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 06:18:03 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35860 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728460AbgKBLSD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 06:18:03 -0500
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0A2BHYWq023778;
        Mon, 2 Nov 2020 20:17:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0A2BHYWq023778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1604315855;
        bh=ud8yc1c1O6tA/BXytd1hI5e/Hbr1qdlkXTLOb3pvaHc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OwlTYvVDbe2Jnxgi0SIOoVWAfEGzNvrvskBuP3w6tDkCsevgRtPvs1jgaodEiOqIZ
         jax3zFfT7UR/Y1n7GV5uUz1Mu6OBtgQyfzzfPgUJhCkS2J5YufjP5C7NRdHnm5N7x9
         bhOw7k1U0Qu9NGgm8o99KPHh6XadlF5BF1J6uCUADW/68q9n7FyCOztMVTctwxjqBD
         anx+BvyIyzRGQIK6bupi1swjf67fJFB4tbsyGj9qb12AXlMyj6Bn3FcV24H8xcMQJj
         eu+mpZcyxduJF2lDcthgq0ab1c8WH7khvTb1m0ziG3vb/RpRTkqSvll0pFT5pNwVru
         w0ctTNtVUui2w==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id 133so10816384pfx.11;
        Mon, 02 Nov 2020 03:17:34 -0800 (PST)
X-Gm-Message-State: AOAM530NPkTfj41TwZnhXDRHqQAMErlZdkdekaP76j/Oxu6yOo7+RQSM
        p1BhPVM7dO6DFcpHEABdhOEYc+1VtYPsnSAg1ZI=
X-Google-Smtp-Source: ABdhPJy0y47wEsDylTk4buJtvphQRe+Gjxcny80RfpJyROfkl4dM3BnbSFpSzAMMw7ekYi50OeO/aw1FPXyFMPX0ODs=
X-Received: by 2002:a17:90b:4b84:: with SMTP id lr4mr17512949pjb.153.1604315853970;
 Mon, 02 Nov 2020 03:17:33 -0800 (PST)
MIME-Version: 1.0
References: <20201029112112.21285-1-dzagorui@cisco.com>
In-Reply-To: <20201029112112.21285-1-dzagorui@cisco.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 2 Nov 2020 20:16:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNATb3z3ctGJD4b4+JxdsiF-9ecDOUDuTmLTvQ1UgRC5LnQ@mail.gmail.com>
Message-ID: <CAK7LNATb3z3ctGJD4b4+JxdsiF-9ecDOUDuTmLTvQ1UgRC5LnQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -fmacro-prefix-map for .S sources compilation
To:     Denys Zagorui <dzagorui@cisco.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 29, 2020 at 8:22 PM Denys Zagorui <dzagorui@cisco.com> wrote:
>
> Follow-up to a73619a845d5 ("kbuild: use -fmacro-prefix-map to make
> __FILE__ a relative path") commit. Assembler sources also use __FILE__
> macro so this flag should be also apllied to that sources.
>
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Makefile b/Makefile
> index ee2284a5cad2..26c4294f6e25 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -947,6 +947,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
>
>  # change __FILE__ to the relative path from the srctree
>  KBUILD_CFLAGS  += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
> +KBUILD_AFLAGS  += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)



-fmacro-prefix-map is a preprocessor option.

https://gcc.gnu.org/onlinedocs/gcc-10.2.0/gcc/Preprocessor-Options.html#Preprocessor-Options



I think it makes more sense to replace

KBUILD_CFLAGS  += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)

with

KBUILD_CPPFLAGS        += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)


Then, this flag will be passed to .S files as well as .c files.








>  # ensure -fcf-protection is disabled when using retpoline as it is
>  # incompatible with -mindirect-branch=thunk-extern
> --
> 2.19.0.dirty
>


--
Best Regards
Masahiro Yamada
