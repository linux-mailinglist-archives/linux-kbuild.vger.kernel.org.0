Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7005A3CFF18
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 18:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233311AbhGTPhQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 11:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhGTPcx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 11:32:53 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D58C3C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 09:13:30 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id hc15so35163432ejc.4
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OPEvfyjKVX+v55Ct/bQwzH3XO4UVtaI5KxArIAF+NAM=;
        b=ooSe2AbELutBo06y2Z8AtrRLFTFa6I20RcWxVSy+EiCCxGT1Yl6ABBqVBTsYJjnLho
         hdbza03lccmMdqAG1jASH9xgKIkxHYwW7Tj/Kq8YvMehqsZsw3fQU4s0ohTwzDyuT3Dw
         Myfe7GiE6ET+QChSqAhqvogqcz9Uhdt8hQ6aHjAx2JRxtPrGZR2eaPmXJ+yJIH7485uI
         mAXP8NVlsEdrWlKAoYiNSu3DlV+jFOyqx+og7ba5ES3qXfrVK1215Kw4LZls4iPa7zZv
         WziOtPJJYCEWhwsNGDq6lswEdNN6cMZ2WIRWijbWUoZocbS7/0N258b10vfvSP1isxwy
         Bkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OPEvfyjKVX+v55Ct/bQwzH3XO4UVtaI5KxArIAF+NAM=;
        b=ifNyxx0FVCkDYlusiYUkzjT3+PTHCAlit7g7Fmj6nXmBtyfnEJRtp1xzO0f04vqiqn
         bp5nkBvvkyuU597s9WnbPWlJMwVw/DATe9Vr1Bbw4ssgXuH7H+bDu6pYqV3LaXC9uRMf
         3uk+siRn7geJZoyKCbhH3B/hYOT0gQb9AMgdypf/JKL1yS4zOgYMyaRwXhN2zbM5fP7G
         RYczXu52etEF2X5O9zOlq4pkAgiRH0G1Bggzr/+RloWd23i2itBTFiLqTTGayzpitb8O
         vjEpLmEQJJ9XlTKaS2+kcAmsQMOPhat+HFW19dPdJGHYolSXtSZYFJwAjdZ8PUiy4RWq
         cVaA==
X-Gm-Message-State: AOAM533uiA6AXuKVyEqeKuHZCCp/IY+c+5k34px2wJHmPx/D7fJZrxVP
        9/OI4hUIanFxKVkj3jTsKGk16cf+KoDe0Of3g2Qncw==
X-Google-Smtp-Source: ABdhPJyk08eimMWa0anfxvsvrdc6iv9f1I9bzEt0s0PGZMI0p5ghaNcA5rqR5UxNu+E/myvVf05TPkuGSLSBgZl30UU=
X-Received: by 2002:a17:907:62a1:: with SMTP id nd33mr33659482ejc.303.1626797609356;
 Tue, 20 Jul 2021 09:13:29 -0700 (PDT)
MIME-Version: 1.0
References: <YO3txvw87MjKfdpq@localhost.localdomain> <YO8ioz4sHwcUAkdt@localhost.localdomain>
 <CADYN=9+ZO1XHu2YZYy7s+6_qAh1obi2wk+d4A3vKmxtkoNvQLg@mail.gmail.com>
 <YPFa/tIF38eTJt1B@localhost.localdomain> <CAK7LNATt3tvF9n5LMosirxs50PMQ1RKPp1j1FVAx3yz+uXmvVw@mail.gmail.com>
In-Reply-To: <CAK7LNATt3tvF9n5LMosirxs50PMQ1RKPp1j1FVAx3yz+uXmvVw@mail.gmail.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Tue, 20 Jul 2021 18:13:18 +0200
Message-ID: <CADYN=9+QStOO3WuFLank_bXWL8R_ZQMV-wyLW6n-oJ0J4J=-tQ@mail.gmail.com>
Subject: Re: [PATCH v2] Decouple build from userspace headers
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Alexey Dobriyan <adobriyan@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 18 Jul 2021 at 15:12, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Jul 16, 2021 at 7:10 PM Alexey Dobriyan <adobriyan@gmail.com> wrote:
> >
> > On Fri, Jul 16, 2021 at 11:03:41AM +0200, Anders Roxell wrote:
> > > On Wed, 14 Jul 2021 at 19:45, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > > >
> >
> > > In file included from
> > > /home/anders/src/kernel/testing/crypto/aegis128-neon-inner.c:7:
> > > /home/anders/src/kernel/testing/arch/arm64/include/asm/neon-intrinsics.h:33:10:
> > > fatal error: arm_neon.h: No such file or directory
> > >    33 | #include <arm_neon.h>
> > >       |          ^~~~~~~~~~~~
> >
> > > If I revert this patch I can build it.
> >
> > Please, see followup fixes or grab new -mm.
> > https://lore.kernel.org/lkml/YO8ioz4sHwcUAkdt@localhost.localdomain/
>
>
> With the follow-up fix,
> this patch is doing many things in a single patch.
>
> Can you split it into a series of smaller patches?
>
>
> 1/4: changes for arch/um/include/shared/irq_user.h
>      and arch/um/os-Linux/signal.c
>
>
> 2/4:  remove wrong <stdbool.h> or <stddef.h> inclusions
>       (or maybe you need to replace them with <linux/types.h>
>       to keep the affected headers self-contained)
>
>
> 3/4: add include/linux/stdarg.h,
>      then <stdarg.h> with <linux/stdarg.h>
>
>
> 4/4: move -isystem $(shell $(CC) -print-file-name=include)
>      to some sub-Makefiles from the top Makefile.
>
>
>
>
>
> (please note 4/4 will introduce a breakage in linux-next
> if somebody adds a new <stdarg.h> inclusion in this
> development cycle.
> I hope that will not happen, though)
>

Would it be possible to drop this patch for now from next since it
breaks build daily?

Cheers,
Anders
