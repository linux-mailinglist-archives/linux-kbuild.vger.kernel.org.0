Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 234672E18C5
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Dec 2020 07:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgLWGKe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Dec 2020 01:10:34 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:51256 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbgLWGKd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Dec 2020 01:10:33 -0500
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0BN69JDr031671
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Dec 2020 15:09:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BN69JDr031671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608703760;
        bh=T0pbFrAHJ4PDrxOeHbOrYEGn4/YswM66O1dpryDRACE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0OZ8E+Bhe+1alxO/aCVp5Arnf6w+NppoipNhvspLS/qxwRN65hI/QcaI0WLsgJeTE
         TwokJFwO7VxZ49B8FVVpZVofICjX7UOKK/f1Y9KqpPzmdgnw9R2mQmfXu54XP+SCuW
         ybheC7HD9jTHYlPOl+qMFTMMuq2T3iTPzYaPD6L1nlJIeKAUd45gb7nFIszv00xvzy
         MvGphlu3PUhjQncvXpjDydvsaJw3fZJkDrCV883OwIk284ZxbXva6aj0lKDICGtrGS
         whBSgLmEVCNqByS3X6oCTbR7JRdl89b2stx6Jypb4YFoYgPsIZzoFSvY65VUvUZF9b
         gXf7ou+XirMDg==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id j13so2627026pjz.3
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Dec 2020 22:09:20 -0800 (PST)
X-Gm-Message-State: AOAM531H7DJQ1Hg3q9MNoB+L5ZIRQDD6R05VmRjnUZspvWYF8u1LfC2O
        1G5zCm3TO+rpLbdXrWVGYsFsHwxPVCnIeCwRY1s=
X-Google-Smtp-Source: ABdhPJykgm4Xv3FiAwZrVCPFt9yZrfWo3PXpZK5vDAqja4Kh5B35G8Pc4ct7GI+V2qiTvILlStFdZne7u+t0gr/KOl8=
X-Received: by 2002:a17:90a:c910:: with SMTP id v16mr25117479pjt.198.1608703759336;
 Tue, 22 Dec 2020 22:09:19 -0800 (PST)
MIME-Version: 1.0
References: <CAL1ky9r9FutN2baRhV_WO-stV1FHKq-par4uv-VfCdofcGhSVg@mail.gmail.com>
 <CAK7LNAQRa18QWQep=Tj9Due_TvAotD4_v0GX83yP0SKX=jUQSQ@mail.gmail.com> <CAL1ky9orK39qmvPPk05SoUHWByTwL-kSkgTsbZEvh1vUR4+hXw@mail.gmail.com>
In-Reply-To: <CAL1ky9orK39qmvPPk05SoUHWByTwL-kSkgTsbZEvh1vUR4+hXw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 23 Dec 2020 15:08:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARnoU6GFCxNTEzOqj1J2hYZVNJKTtEb81b_VtRz6jswiQ@mail.gmail.com>
Message-ID: <CAK7LNARnoU6GFCxNTEzOqj1J2hYZVNJKTtEb81b_VtRz6jswiQ@mail.gmail.com>
Subject: Re: [PATCH] lib/raid6: Let $(UNROLL) rules work with BSD userland.
To:     John Millikin <jmillikin@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 23, 2020 at 1:24 PM John Millikin <jmillikin@gmail.com> wrote:
>
> On Wed, Dec 16, 2020 at 2:46 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Does it depend on the awk version?
> >
> > I tried this in FreeBSD 12.
> >
> > masahiro@:~ $ cat test.awk
> > BEGIN {  print N }
> > masahiro@:~ $ awk --version
> > awk version 20121220 (FreeBSD)
> > masahiro@:~ $ awk -ftest.awk -vN=1
> > 1
> >
> > It worked for me.
> >
>
> Yes, it appears to be version dependent. Apologies for the confusion
> -- I didn't realize there were multiple dialects of BSD awk.
>
> On FreeBSD and OpenBSD awk works with the existing command. On NetBSD
> and macOS awk fails with the following error:
>
> $ touch unroll.awk input.c
> $ awk -f./unroll.awk -vN=0 < input.c
> awk: can't open file -vN=0
>  source line number 1 source file -vN=0
>  context is
> >>>  <<<
> $
>
> My patch lets the $(UNROLL) command support the NetBSD/macOS variant
> -- this is needed to support building the Linux kernel on a macOS host
> machine.



I see, the default awk on macOS is quite old.

$ awk --version
awk version 20070501



Please update the commit description
to mention this issue happens on NetBSD/macOS.




-- 
Best Regards
Masahiro Yamada
