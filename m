Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 587B838D2C3
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 May 2021 03:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhEVBTJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 21 May 2021 21:19:09 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23142 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbhEVBTJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 May 2021 21:19:09 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 14M1HUhd025311;
        Sat, 22 May 2021 10:17:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 14M1HUhd025311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621646251;
        bh=GD6Yp0ZT6wOegnCWg09McQE8unMC0H+KwAvBi2hFOvs=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=hXZbzXvNepiCfC0Fk2/z7yo4z9Bz2G5cYYux6m7HCl9GiI3beXEQQ3xA05Ldle5ak
         KVKTJhTjidfDCPIUpXw8MOmXQ/W/LDrUy41eNuH/y4kyPdVzNKgK2SFV+tVHoInFlm
         I4Z4B2RG0DxziIlBrqWBgLVb2+F6A3zd8luuO7mgYiXNCG2HhzIvVfEVKPv89Li9sB
         sG79YKObxKjGF0XLOzySusHUeH6DmdgGBqHrMS8IKF07UFL2avDVZ8H8qrKkRvvlpb
         s0q80rW/vjauyjvMuL7R9hfNRuKDQ3Y+XEa3Jg6DkQB+3QmpeweWwtjdZDqqrEeBOm
         YIpQZx30hgUxw==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso7920368pjx.1;
        Fri, 21 May 2021 18:17:30 -0700 (PDT)
X-Gm-Message-State: AOAM5335T71Ex3S2vIKbVsT5EN8dLaFvstkI5iERs50eazH4wikh1rrO
        lubGdPc3OBitlY+qeHPpVObjSP32CoGW4wxQ+6U=
X-Google-Smtp-Source: ABdhPJw5JgCNftkcFxzjXzA29r2w8FsQL3a3NFWcSSYA2hqReva210UKVj298o/kPpkN9NQnA2mSiB07/2H+YnIxVwA=
X-Received: by 2002:a17:902:541:b029:f0:3187:409b with SMTP id
 59-20020a1709020541b02900f03187409bmr14932548plf.47.1621646250020; Fri, 21
 May 2021 18:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210512075729.60291-1-masahiroy@kernel.org> <20210512075729.60291-4-masahiroy@kernel.org>
 <YKeLoDy3QddLd6jb@lillesand.fjasle.eu>
In-Reply-To: <YKeLoDy3QddLd6jb@lillesand.fjasle.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 May 2021 10:16:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQweN_=f0hvMo4CK7ZM=rGnhf_dQF3XRTAyPsA3Ca7p4g@mail.gmail.com>
Message-ID: <CAK7LNAQweN_=f0hvMo4CK7ZM=rGnhf_dQF3XRTAyPsA3Ca7p4g@mail.gmail.com>
Subject: Re: [PATCH 4/5] hexagon: move core-y in arch/hexagon/Makefile to arch/hexagon/Kbuild
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        linux-hexagon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 21, 2021 at 7:30 PM Nicolas Schier <nicolas@fjasle.eu> wrote:
>
> Hi Masahiro,
>
> On Wed 12 May 2021 16:57:28 GMT, Masahiro Yamada wrote:
> > Use obj-y to clean up Makefile.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/hexagon/Kbuild   | 1 +
> >  arch/hexagon/Makefile | 4 ----
> >  2 files changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/arch/hexagon/Kbuild b/arch/hexagon/Kbuild
> > index a4e40e534e6a..d930c2f954d5 100644
> > --- a/arch/hexagon/Kbuild
> > +++ b/arch/hexagon/Kbuild
> > @@ -1 +1,2 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +obj += kernel/ mm/ lib/
>
> This should probably be 'obj-y' instead of 'obj'?
>

Oops, thanks for catching that!
I will fix it when I apply it.

-- 
Best Regards
Masahiro Yamada
