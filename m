Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D744C333F89
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 14:46:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbhCJNqF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 08:46:05 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:56080 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhCJNp6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 08:45:58 -0500
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 12ADjOFo020214;
        Wed, 10 Mar 2021 22:45:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 12ADjOFo020214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615383924;
        bh=sF/ZgTt5Ww+ewJwghY8bN3q4cx/d+CRW4phq1OirHpI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=l77dZs4mDGC3lthuQHEtp4T0lCMlfJ1ahLGN/ipLvOsfz2uvLYj/6RHqHL5NCQ1wZ
         g9wcB4hAQFarSqmO1oh1xyvzgMRasJ95YUrBt/BYNTBA0SHuPS6VMcETdGUBpycRYR
         SSOXNgFfRhlHIvpxRzmU79KgekVbbaFrE/eEYkpVGBGNummPiPSMOLRuTWXhamAmOK
         4uSn/clPYKYvPP3E/1ERhQrpaa1fNKDdcLx4T2ZWQLE779DiC4zL/K/pxMXugSBjBO
         4uf+shJmzRVvndotY0EVe5T8woRcaaRpEluw1EIIlKOAXrdQUiIwZwizMbOidTDMDU
         pjUB0NwCgLvtA==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id s7so8500850plg.5;
        Wed, 10 Mar 2021 05:45:24 -0800 (PST)
X-Gm-Message-State: AOAM5316oqjtWkNPKfb6jEX0IRe8/IpowrtYSwdPvxrAvqvFmSEDYdN7
        jipjFS/64JTPZ0IqXEDzRuVOjZXWJjPDO2BjxfI=
X-Google-Smtp-Source: ABdhPJwluJLsepqLdHQ7dFnEL3YAfgbBThIc/o3OtzGX+XCmpRMegRM7Enh3dtUrTsSQ9Cngjbz7lBn+2vk8+ESyzw8=
X-Received: by 2002:a17:90a:dc08:: with SMTP id i8mr3495136pjv.153.1615383923597;
 Wed, 10 Mar 2021 05:45:23 -0800 (PST)
MIME-Version: 1.0
References: <20210304113708.215121-1-masahiroy@kernel.org> <202103041518.22EB819E@keescook>
 <CAHk-=wj6t2i1BgmWP1Zb2WVF3zZzkHvsxsALJk7VpfKm6UgLcw@mail.gmail.com>
 <20210305022500.cyi3cfwgt2t6mona@treble> <20210306012815.nfmquoln65vq6yq7@treble>
 <CAK7LNAR7E4Ud9MPy3q5VOab4EFMumr5GMHqyv=H970+gPTBrFg@mail.gmail.com>
 <20210306025059.z6dn6mi7mxyufkr2@treble> <20210309203109.2fhyf5naazgjjnch@treble>
In-Reply-To: <20210309203109.2fhyf5naazgjjnch@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 22:44:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQDbhzi5s8iaqVSV82v8n-+0a=XB3-8wg=Nu41XyRETvw@mail.gmail.com>
Message-ID: <CAK7LNAQDbhzi5s8iaqVSV82v8n-+0a=XB3-8wg=Nu41XyRETvw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rebuild GCC plugins when the compiler is upgraded
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Eigler <fche@redhat.com>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 10, 2021 at 5:31 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Fri, Mar 05, 2021 at 08:50:59PM -0600, Josh Poimboeuf wrote:
> > > Is this a bad coding contest?
> > >
> > > I am not asking you to add ugly ifeq or whatever
> > > hacks to say "this worked for me".
> > >
> > > Please feel free to do this in the fedora kernel,
> > > but do not send it to upstream.
> > >
> > > Sorry, I really do not want to see hacks like this any more.
>
> Masahiro,
>
> Ping.  Do you have a better approach for building GCC plugins in the
> external module directory?


I am not sure if building GCC plugins in the external module directory
is the right approach.


--
Best Regards
Masahiro Yamada
