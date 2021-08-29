Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD28B3FAF15
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Aug 2021 01:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbhH2XYa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Aug 2021 19:24:30 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25100 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhH2XYa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Aug 2021 19:24:30 -0400
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17TNNI7T002570;
        Mon, 30 Aug 2021 08:23:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17TNNI7T002570
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630279399;
        bh=2DtSTvJOOglI5huxNjXBZUxQQ+1yrflPwCKreUr+MBQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IuOWKMXDXERVu47ew/FL0427j/zqGLbfmr05iFF7utbvQhZEbpFefPEhYbpa497bV
         +hO0xe9D573iPMpSW/gDBl6OzubHiQGinxPRpiCfzmaPcNGB9L0IGZjp+du9qrW+nF
         HKGOWB+K4F4M4xgl7ZgjLAFhjAi1WgibsoPyqVehaXwqIU5aTcxwz2x6x/G9Rt8Mxd
         LVTyIbeLt60CRcXfvDqwRwUkOzF+CYQbN89FBmgL23YRBkN8GU2rS+PmyL1VqFz1Vy
         r6V5kiIL0K70ypbRIa24kSNdcAtDEa46tXzVr9xncE8rLD7hBahtMh0/2FlBSXB21g
         FieV1qdFJxoqw==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id 18so10724113pfh.9;
        Sun, 29 Aug 2021 16:23:19 -0700 (PDT)
X-Gm-Message-State: AOAM532zZs9ZGcLN8yK8kAEXc+3WsL0RP7xxtCMM1U5J/GpI8+Bk8AVD
        9vHbMVDW3H/DfqX6T+8/vYwvZYBSvxl33ZnAQZA=
X-Google-Smtp-Source: ABdhPJzUCVajjAjtIPOlHmuafkHnWx1YjOjQJXTyhDxOiW0pb1Ms5KYKdS/7nkXNOZZ0D9JhpKTTOuwsC2yhH27fee8=
X-Received: by 2002:a63:a58:: with SMTP id z24mr18994549pgk.175.1630279398215;
 Sun, 29 Aug 2021 16:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
 <20210822192205.43210-4-arielmarcovitch@gmail.com> <CAK7LNARmSmTTPRWcgcPF8kRntSFuaPkLD0A=xuz=CAp4SzxV=Q@mail.gmail.com>
 <b7f9e9a8-6854-ef3b-a20c-3b4b3d2d8440@gmail.com>
In-Reply-To: <b7f9e9a8-6854-ef3b-a20c-3b4b3d2d8440@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 30 Aug 2021 08:22:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNARehxwwKXWVLcBFTCAOu8x-MhiGzv6S3nsWV0QGz8G6iA@mail.gmail.com>
Message-ID: <CAK7LNARehxwwKXWVLcBFTCAOu8x-MhiGzv6S3nsWV0QGz8G6iA@mail.gmail.com>
Subject: Re: [PATCH 3/3] checkkconfigsymbols.py: Forbid passing 'HEAD' to --commit
To:     Ariel Marcovitch <trhtkmarco@gmail.com>
Cc:     Ariel Marcovitch <arielmarcovitch@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 29, 2021 at 10:23 PM Ariel Marcovitch <trhtkmarco@gmail.com> wrote:
>
> Hello!
>
> On 24/08/2021 16:31, Masahiro Yamada wrote:
> > On Mon, Aug 23, 2021 at 4:23 AM Ariel Marcovitch
> > <arielmarcovitch@gmail.com> wrote:
> >> As opposed to the --diff option, --commit can get ref names instead of
> >> commit hashes.
> >>
> >> When using the --commit option, the script resets the working directory
> >> to the commit before the given ref, by adding '~' to the end of the ref.
> >>
> >> However, the 'HEAD' ref is relative, and so when the working directory
> >> is reset to 'HEAD~', 'HEAD' points to what was 'HEAD~'. Then when the
> >> script resets to 'HEAD' it actually stays in the same commit. In this
> >> case, the script won't report any cases because there is no diff between
> >> the cases of the two refs.
> >>
> >> Prevent the user from using HEAD refs.
> >>
> >> A better solution might be to resolve the refs before doing the
> >> reset, but for now just disallow such refs.
> >
> > Better than doing nothing.
> > So, applied to linux-kbuild.
> >
> >
> >
> >
> >
> >> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> >> ---
> >>   scripts/checkkconfigsymbols.py | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> >> index 875e9a2c14b2..6259698e662d 100755
> >> --- a/scripts/checkkconfigsymbols.py
> >> +++ b/scripts/checkkconfigsymbols.py
> >> @@ -103,6 +103,9 @@ def parse_options():
> >>                        "continue.")
> >>
> >>       if args.commit:
> >> +        if args.commit.startswith('HEAD'):
> >> +            sys.exit("The --commit option can't get use the HEAD ref")
>
> Just realized that the message says "can't get use" which doesn't make
> much sense :)
>
> Do you want me to send a new patch to fix it?

OK, I dropped 3/3 from my tree.

Please send v2.






> >> +
> >>           args.find = False
> >>
> >>       if args.ignore:
> >> --
> >> 2.25.1
> >>
> >
> Thanks for your time :)
>
> Ariel Marcovitch
>


-- 
Best Regards
Masahiro Yamada
