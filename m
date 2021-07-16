Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8543CB7AE
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jul 2021 15:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239870AbhGPNHQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Jul 2021 09:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239803AbhGPNHK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Jul 2021 09:07:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D8AC061760
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jul 2021 06:04:14 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id h2so12915546edt.3
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Jul 2021 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3EFuCzIh+SeYBpu5UbN36zCvdsMMMavFs1jTakKetLg=;
        b=ZBXdVovlUDWINuH3DenX3yyikHJDRDr2XC5in3PvcE/lwDz61zADYJvdyMUF81uMM6
         XXbcSnjd4cAuovnUKeTRhuLnTGBeV+3C1LcTnX7G2y5kQhmoAQxNnywDdbAL1NXKhVEV
         tcn92roRGng/i79mMnA5uSiT8iQ3UWR6q2CRSTj59A7OzhhwVdyrLXrFPuP2i+EzUap2
         vtsh+A9s1FWLrzYzpRAlaof+1YGrboe85JIclqPon69R9psy5WHKQ89b8FvEk2AR9t7a
         28OTWr6cxiUP23tLSHX9hSN/nEQnGoAkGRQWRp4uL2NyqmsNEEdEGC1Y/MQBFrt1Rb+l
         rRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3EFuCzIh+SeYBpu5UbN36zCvdsMMMavFs1jTakKetLg=;
        b=B2M7ju0/8HKEPy0Ce1ORnOVkfgSH1OkBAE8NXzJ9uasoLcyNWlZvAjv1ZaA3WN0rh/
         Uk+8Iq3Qnuj9htS5rhb82dWnK7E8Abh4UcXV95jBOx3JR7bwgDO2cWbS46+Jhfsw+yb+
         RoO+kaDyJp+72SRhWvQF0Hw8FXQ0EGIahDRWleeHVUBWzoc0SsR9zDGoFdmoGwT+e+lD
         Vw15/B5f56eaAzo5LoAvvH2F2gE9xhsK+dqoi4HZZPMcIYcKlUlIXEpbBAvP06wtyF2y
         E5GNilgVYhy/nqPo2vrfhcKL3tVa9gHp81QnJKlXuPyE1oBFOd/ZxycKMis+QECyE7m3
         yOMQ==
X-Gm-Message-State: AOAM533FIJnNwdH2r5IRuhqJ9cAdaCWicocNmd6XwXwf/cOCzOOllvm1
        hPfTjrhEgQCoI32LStqtRXjrLJmoErpv/OgoE0poYg==
X-Google-Smtp-Source: ABdhPJwF2Vd4OfydUmikO1TlQyiVvg2oS4gN+IeEt5NyFgOSmf6VbmP1pv5jgrwgpt/3hNuw0iZgnsBVM/vCmRXOk+w=
X-Received: by 2002:aa7:d2ca:: with SMTP id k10mr15018511edr.379.1626440653392;
 Fri, 16 Jul 2021 06:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <YO3txvw87MjKfdpq@localhost.localdomain> <YO8ioz4sHwcUAkdt@localhost.localdomain>
 <CADYN=9+ZO1XHu2YZYy7s+6_qAh1obi2wk+d4A3vKmxtkoNvQLg@mail.gmail.com> <YPFa/tIF38eTJt1B@localhost.localdomain>
In-Reply-To: <YPFa/tIF38eTJt1B@localhost.localdomain>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Fri, 16 Jul 2021 15:04:01 +0200
Message-ID: <CADYN=9LVpCYc48sY63372EyfA9sepKj=LmwfOwyLqo=V45Uq=Q@mail.gmail.com>
Subject: Re: [PATCH v2] Decouple build from userspace headers
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>, hch@infradead.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, 16 Jul 2021 at 12:10, Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> On Fri, Jul 16, 2021 at 11:03:41AM +0200, Anders Roxell wrote:
> > On Wed, 14 Jul 2021 at 19:45, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> > >
>
> > In file included from
> > /home/anders/src/kernel/testing/crypto/aegis128-neon-inner.c:7:
> > /home/anders/src/kernel/testing/arch/arm64/include/asm/neon-intrinsics.h:33:10:
> > fatal error: arm_neon.h: No such file or directory
> >    33 | #include <arm_neon.h>
> >       |          ^~~~~~~~~~~~
>
> > If I revert this patch I can build it.
>
> Please, see followup fixes or grab new -mm.
> https://lore.kernel.org/lkml/YO8ioz4sHwcUAkdt@localhost.localdomain/

I tried to apply that patch but I got the same build error.

Cheers,
Anders
