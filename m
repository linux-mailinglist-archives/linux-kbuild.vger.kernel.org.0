Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C05B6BE76F
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Mar 2023 11:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCQK7e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Mar 2023 06:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCQK7c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Mar 2023 06:59:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6E47ED0;
        Fri, 17 Mar 2023 03:59:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3FA2B824C8;
        Fri, 17 Mar 2023 10:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FB7C4339E;
        Fri, 17 Mar 2023 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679050767;
        bh=hvl5wAQ8fjtCV5r8Eb4nA33ZzI1gUz6AM8Y2rzqbrEc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QChWfRxLL2T3GZSOO7muxlUvKyUHW/vFccWhx8jum00KZefZCqCLrnfUStUL/zWJj
         QVW4lNfHlk2SrYR250XHGwAzu+9FMisYsb+pL6k8nVmmpCZwaURmfJH4io2Hqkgm/s
         ewd4wa/tSX/1aSiFO2OYFsthShLFvdSWyUBupKlF+dBUXWUh4At8YlFHnsgJny4gmO
         mdZEKDSqwvYsH2cZPTORchETvwyZFtjTZTwfJVDNtmsoUFWKcZXHRK4jY/kZxPDF9+
         zHTXtazccpUOSPTEzybsdtPXZYAh70Is3Uy3BLp47XE2fksaZ39iTCMho3mdwYGVp1
         Or+NVD97ery/Q==
Received: by mail-ot1-f54.google.com with SMTP id v2-20020a056830090200b0069c6952f4d3so2605374ott.7;
        Fri, 17 Mar 2023 03:59:27 -0700 (PDT)
X-Gm-Message-State: AO0yUKXbFqXKJ+A2sGzv9vrhtpDhXBckYTdw+ke+nKXS5MChX5vH60WE
        1CMeP/c3Hxj2clVc+ZoJQKETIAnor2Sz9EOM7ek=
X-Google-Smtp-Source: AK7set/FKKlfJ+Rwp8G2L6kEgMMTvQAm47BATNJVddgUHqRXcqdTbMOkViohy7v6djiBCK7o/kE8eCoHeUKaE06pA6I=
X-Received: by 2002:a9d:64a:0:b0:69a:7f40:3fb9 with SMTP id
 68-20020a9d064a000000b0069a7f403fb9mr1079453otn.3.1679050766795; Fri, 17 Mar
 2023 03:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
 <patch-2.thread-d13b6c.git-d13b6c96fb5f.your-ad-here.call-01656331067-ext-4899@work.hours>
 <705ce64c-5f73-2ec8-e4bc-dd48c85f0498@kernel.org>
In-Reply-To: <705ce64c-5f73-2ec8-e4bc-dd48c85f0498@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 17 Mar 2023 19:58:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNATEn98O+53MvbgfEy3fk2bBxn8bu_L0hbrrtAh0LXpCKw@mail.gmail.com>
Message-ID: <CAK7LNATEn98O+53MvbgfEy3fk2bBxn8bu_L0hbrrtAh0LXpCKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] s390/nospec: remove unneeded header includes
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 16, 2023 at 8:14=E2=80=AFPM Jiri Slaby <jirislaby@kernel.org> w=
rote:
>
> On 27. 06. 22, 14:50, Vasily Gorbik wrote:
> > Commit 4efd417f298b ("s390: raise minimum supported machine generation
> > to z10") removed the usage of alternatives and lowcore in expolines
> > macros. Remove unneeded header includes as well.
> >
> > With that, expoline.S doesn't require asm-offsets.h and
> > expoline_prepare target dependency could be removed.
> >
> > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
> > ---
> >   arch/s390/Makefile                  | 2 +-
> >   arch/s390/include/asm/nospec-insn.h | 2 --
> >   2 files changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> > index fc72a35a1f07..4cb5d17e7ead 100644
> > --- a/arch/s390/Makefile
> > +++ b/arch/s390/Makefile
> > @@ -166,7 +166,7 @@ vdso_prepare: prepare0
> >
> >   ifdef CONFIG_EXPOLINE_EXTERN
> >   modules_prepare: expoline_prepare
> > -expoline_prepare: prepare0
> > +expoline_prepare:
>
> Hi,
>
> this likely broke s390 build as expolines still depend on
> scripts/basic/fixdep. And build of expolines can now race with fixdep bui=
ld:
>       make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
>       /bin/sh: line 1: scripts/basic/fixdep: Permission denied
>       make[1]: *** [../scripts/Makefile.build:385:
> arch/s390/lib/expoline/expoline.o] Error 126
>       make: *** [../arch/s390/Makefile:166: expoline_prepare] Error 2


Indeed. This is a race.


> I returned there:
>    expoline_prepare: prepare0
> and it looks good so far. Maybe even:
>    expoline_prepare: scripts
> would be enough.
>
> Opinions?
>

Technically, 'scripts' might be enough, but
it is difficult to predict whether
arch/s390/lib/expoline/expoline.S
includes generated headers or not.

The chain of header inclusion changes all the time.

--=20
Best Regards
Masahiro Yamada
