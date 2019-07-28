Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFB077DA1
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jul 2019 06:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbfG1EMw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jul 2019 00:12:52 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:65068 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbfG1EMw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 00:12:52 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6S4CdjR006104;
        Sun, 28 Jul 2019 13:12:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6S4CdjR006104
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564287160;
        bh=0MK1H0dhpv35mcDABUwmSGMHTifsb84AE0Njh7iGzXE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nhbJEE/hHAfIA+vkSa4MoRPBqWO0ptiRdrBGFP3fu2xciML7oh+CuBEDz03KLjiDE
         VBQCXrh2oclERyWy3kxCUO+u4BAkxpTxjojoV3/ON4/LvtGwtMDG4kRmMtiF5KtqeS
         FYd55oAJHXeaJVTFniX3d1h1KETkSrLy/HKgfph8J4BeBPz0/9whXqx6VxhEccCY7D
         9jAYSg6MSeFDtr8/KZJ0ErTLRT70x5J2wldenkCAEQa5NQK2360GI93MRKz6MizIxo
         k8i8tFA0Pi2G4Nz2ZDSQVx/ZnttTB9hXMzc5u4YRa8d9Uqbcp9blJtG/SZxjGR5AJK
         8Kl5ToRL0Qe+g==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id j21so22776471uap.2;
        Sat, 27 Jul 2019 21:12:39 -0700 (PDT)
X-Gm-Message-State: APjAAAU+UR1gjVTpTWUduzpBdpRQ34UdqZnaV8PLpSaRXka5CMnLLzh2
        zk4tTiTkIagaqr5JCwCV8PCWPgwXFXkjoYgZSus=
X-Google-Smtp-Source: APXvYqynCeMIrU1hpnz2EjUmT9rjD7rjM9SOJw8TsVxFfFXROiUct/H85ENu10DwH10fEYvmjy8r2z7ofw6snK7A1Eo=
X-Received: by 2002:a9f:2265:: with SMTP id 92mr50705926uad.121.1564287158473;
 Sat, 27 Jul 2019 21:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sun, 28 Jul 2019 13:12:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
Message-ID: <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
Subject: Re: [PATCH] Kbuild: Handle PREEMPT_RT for version string and magic
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Sewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Thomas,

On Sat, Jul 27, 2019 at 5:49 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Update the build scripts and the version magic to reflect when
> CONFIG_PREEMPT_RT is enabled in the same way as CONFIG_PREEMPT is treated.
>
> The resulting version strings:
>
>   Linux m 5.3.0-rc1+ #100 SMP Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #101 SMP PREEMPT Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #102 SMP PREEMPT_RT Fri Jul 26 ...
>
> The module vermagic:
>
>   5.3.0-rc1+ SMP mod_unload modversions
>   5.3.0-rc1+ SMP preempt mod_unload modversions
>   5.3.0-rc1+ SMP preempt_rt mod_unload modversions
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org

Since CONFIG_PREEMPTION was introduced after -rc1,
I think this should be queued on top of -rc2.

Just a nit below.


> ---
>  include/linux/vermagic.h |   10 +++++++---
>  init/Makefile            |    5 +++--
>  scripts/Makefile.modpost |    2 +-
>  scripts/mkcompile_h      |    4 +++-
>  4 files changed, 14 insertions(+), 7 deletions(-)
>
> --- a/include/linux/vermagic.h
> +++ b/include/linux/vermagic.h
> @@ -7,10 +7,14 @@
>  #else
>  #define MODULE_VERMAGIC_SMP ""
>  #endif
> -#ifdef CONFIG_PREEMPT
> -#define MODULE_VERMAGIC_PREEMPT "preempt "
> +#ifdef CONFIG_PREEMPTION
> +# ifdef CONFIG_PREEMPT
> +#  define MODULE_VERMAGIC_PREEMPT "preempt "
> +# else
> +#  define MODULE_VERMAGIC_PREEMPT "preempt_rt "
> +# endif
>  #else
> -#define MODULE_VERMAGIC_PREEMPT ""
> +# define MODULE_VERMAGIC_PREEMPT ""

Maybe, is the following more readable?

#if defined(CONFIG_PREEMPT_RT)
#define MODULE_VERMAGIC_PREEMPT "preempt_rt "
#elif defined(CONFIG_PREEMPT)
#define MODULE_VERMAGIC_PREEMPT "preempt "
#else
#define MODULE_VERMAGIC_PREEMPT ""
#endif


Thanks.

-- 
Best Regards
Masahiro Yamada
