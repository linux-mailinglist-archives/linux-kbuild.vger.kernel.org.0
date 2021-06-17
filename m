Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA283AA8BF
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 03:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbhFQBqY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Jun 2021 21:46:24 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20274 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbhFQBqX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jun 2021 21:46:23 -0400
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 15H1huVf009347;
        Thu, 17 Jun 2021 10:43:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 15H1huVf009347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1623894237;
        bh=wjle6ONnIAord5cqRzKuWQUDNDJxzTYVAbaSXw18SKs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qU6uBj2X7Hnfapm7LiTzm1euiOSK+bL4VVZnJ7KVTn/i5DahMqcuYZu53QEIWy3Td
         szDZjRxMEbGVeye0BDWsFQ3KwUWiIMEY7gZOyiv+b5zi7WgC/q/4rV+8PpkwJbYFBo
         ukreAtJk5gasEwCXa12unM/azjyYYuv8yyw0Or6wjdaZY3CUg6CnYoLM1Mq+rDFTMP
         O4eqMzijOQMk3c46xMw12PDvOaT9y4/9Je0ewRfnBHjb3u8MY8JxI9vd5C7FtfMbyG
         S1gjnLpE4xTSh4HTSqbr7XJ+qVOG6Iog+ZeuvYC8KoKw9ZOfEJrQODMkBFGy27BYzj
         cna8L74KOZEiw==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id g6so3703525pfq.1;
        Wed, 16 Jun 2021 18:43:57 -0700 (PDT)
X-Gm-Message-State: AOAM5336ZK6b3HXOdm3fJUJBKEEnMJQuJNhu5FT6guawJe29HWOYVELr
        lFLpQz+Z8EAmM5GxL1zk53VVGkKZ1BH/+EmmX/A=
X-Google-Smtp-Source: ABdhPJw3BCV6PVCg+sScvyPLQpDO0KODxRfAFcRXVfUn4JyQ6ZXE4MGMIGXTbKinAUO4r+NNuSOGF9iVELFEzBlofTU=
X-Received: by 2002:aa7:962f:0:b029:2ed:cf:1f90 with SMTP id
 r15-20020aa7962f0000b02902ed00cf1f90mr2761373pfg.76.1623894236332; Wed, 16
 Jun 2021 18:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210612141838.1073085-1-maennich@google.com> <CAK7LNAQkoqTG540EOER27G83z+DO5fkeHi-in-vRYkrbX-o0cg@mail.gmail.com>
In-Reply-To: <CAK7LNAQkoqTG540EOER27G83z+DO5fkeHi-in-vRYkrbX-o0cg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 17 Jun 2021 10:43:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=Fwzio6CQqDOYQJj9tYrf5a_-sYQ+Yr2=Qt5cYq8wOA@mail.gmail.com>
Message-ID: <CAK7LNAR=Fwzio6CQqDOYQJj9tYrf5a_-sYQ+Yr2=Qt5cYq8wOA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: mkcompile_h: consider timestamp if
 KBUILD_BUILD_TIMESTAMP is set
To:     Matthias Maennich <maennich@google.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 17, 2021 at 10:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Jun 12, 2021 at 11:18 PM Matthias Maennich <maennich@google.com> wrote:
> >
> > To avoid unnecessary recompilations, mkcompile_h does not regenerate
> > compile.h if just the timestamp changed.
> > Though, if KBUILD_BUILD_TIMESTAMP is set, an explicit timestamp for the
> > build was requested, in which case we should not ignore it.
> >
> > If a user follows the documentation for reproducible builds [1] and
> > defines KBUILD_BUILD_TIMESTAMP as the git commit timestamp, a clean
> > build will have the correct timestamp. A subsequent cherry-pick (or
> > amend) changes the commit timestamp and if an incremental build is done
> > with a different KBUILD_BUILD_TIMESTAMP now, that new value is not taken
> > into consideration. But it should for reproducibility.
> >
> > Hence, whenever KBUILD_BUILD_TIMESTAMP is explicitly set, do not ignore
> > UTS_VERSION when making a decision about whether the regenerated version
> > of compile.h should be moved into place.
> >
> > [1] https://www.kernel.org/doc/html/latest/kbuild/reproducible-builds.html
> >
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Matthias Maennich <maennich@google.com>
> > ---
>
>
> Applied to linux-kbuild. Thanks.
>

This may not be a big deal, but when KBUILD_BUILD_TIMESTAMP is unset,
the timestamp is not updated.  It still has a user-specified string.




-- 
Best Regards
Masahiro Yamada
