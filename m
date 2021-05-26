Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA91391A2F
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 16:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234777AbhEZObX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 May 2021 10:31:23 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:64178 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234565AbhEZObW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 May 2021 10:31:22 -0400
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 14QETcpJ028716;
        Wed, 26 May 2021 23:29:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 14QETcpJ028716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622039378;
        bh=k3AOqkACZJ55p4SyCyjPRmOrpxdWbZM8/3kG+Y7tAoY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NhWZF8ezHICu6k0BtnszKwKo7gYYKaY3ME9WvMPJg7TCay5DTSH/UKoMl5/k81m06
         kNq95ZQvB6XAnP5tnxgArPhR7pGINUBdGhreysedjDYwbOhVEKWFwxSky6hrIqhoNz
         sJOb3rWiTJq7I/aKOTz30uUJKBptIVj5hSUs3LczQ1cBuCFXozj1b8Q7HNCzgVPPx3
         c57NJ9vYdjsBZzTFYm4Bfs3z33CPQmJFdEZcOJt3huo8uwYnX/AHdE51WUvqJKoAMY
         Wv+QesMTHUWPx36zS7tFHqrfwg4wuM8YmJuz/MfydftRfI97cRxyuISwgMXy/6Tihp
         nRelj7ECNsL7A==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id ne24-20020a17090b3758b029015f2dafecb0so444142pjb.4;
        Wed, 26 May 2021 07:29:38 -0700 (PDT)
X-Gm-Message-State: AOAM531DlMmhgAvwLhUmhwxcKGL4Wz93OvUdRep8cbNxQokXD/B2vBOB
        sg7lDdrDTwT2XuRnsZLp1AFHck11mTekm6Nfmz0=
X-Google-Smtp-Source: ABdhPJxwLpq4utAS17p5IoyMP5rgbvbWa7ILEIIy0wW9213ArybIwI/iPO0sT+djLt47d3znEbODhPstvEneelUXEtg=
X-Received: by 2002:a17:902:541:b029:f0:3187:409b with SMTP id
 59-20020a1709020541b02900f03187409bmr36233882plf.47.1622039377857; Wed, 26
 May 2021 07:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210523031428.164186-1-masahiroy@kernel.org> <YKoIz2NEIwtRZIZ1@kroah.com>
In-Reply-To: <YKoIz2NEIwtRZIZ1@kroah.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 May 2021 23:29:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATsgfVV+ynHeHZZOC4=L55hxUmMH5t9E27=Y803zeVwCg@mail.gmail.com>
Message-ID: <CAK7LNATsgfVV+ynHeHZZOC4=L55hxUmMH5t9E27=Y803zeVwCg@mail.gmail.com>
Subject: Re: [PATCH 1/5] scripts/setlocalversion: remove mercurial, svn and
 git-svn supports
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nico Schottelius <nico-linuxsetlocalversion@schottelius.org>,
        Matthias Maennich <maennich@google.com>,
        Matthieu Baerts <matthieu.baerts@tessares.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, May 23, 2021 at 4:48 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, May 23, 2021 at 12:14:24PM +0900, Masahiro Yamada wrote:
> > The mercurial, svn, git-svn supports were added by the following commits
> > without explaining why they are useful for the kernel source tree.
> >
> >  - 3dce174cfcba ("kbuild: support mercurial in setlocalversion")
> >
> >  - ba3d05fb6369 ("kbuild: add svn revision information to setlocalversion")
> >
> >  - ff80aa97c9b4 ("setlocalversion: add git-svn support")
> >
> > Let's revert all of them, and see if somebody will complain about it.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
>
> For all 5 in this series:
>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>


Applied to linux-kbuild.

-- 
Best Regards
Masahiro Yamada
