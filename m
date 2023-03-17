Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB2D96BF694
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Mar 2023 00:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjCQXiV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Mar 2023 19:38:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjCQXhs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Mar 2023 19:37:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336725BD9E;
        Fri, 17 Mar 2023 16:37:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AE9E260CEB;
        Fri, 17 Mar 2023 23:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22904C433A0;
        Fri, 17 Mar 2023 23:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679096228;
        bh=vMq03a3JbeVFSSlVgYs85X6OE1Krd5hPLg0X5SggYVw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TS/S1beWQVpPue6v0T+FG5/NO4eKDtGGgy6/LenXB89OTh+P6rU5Kn8kA4lHBhXA7
         fQ6DP9WSxZqhTnLKXrwAyLbqibJdbVNbttdxGeR0t+K8x4crB/DvePh7tZhjfSl0q8
         VcNtq913ABt9f63eHUhVav2aHxZR+roAyWeW48Q7GQZKkGW0YOFpKzh+dIYLr+U+ty
         zQ0WnEnwZrJjJbVo6JufjTzaQ2FhNcp6edMlgUb98w94bgPCUQ0t9mTp/k0kV0PT6p
         n9qOis6theNHGfEtuE4+4Dxrr8V5u6gd0YE1C+oTvz0SNDFduxT8wD5C6InzGgYUOi
         /xChlwv+ssIGg==
Received: by mail-lf1-f47.google.com with SMTP id s8so8085159lfr.8;
        Fri, 17 Mar 2023 16:37:08 -0700 (PDT)
X-Gm-Message-State: AO0yUKXYNGKbHPcFh1Dr8edJJJswjE38J6pN9bxDtsriTp4z/4iF7SLg
        /jqiK0PbzlToGxGNohpgGdtIgUR7WNtDtEm8ezI=
X-Google-Smtp-Source: AK7set/iP6jeOWU3i9Pg+nk1i4HEeVR6d6Xe9mlEOeoayOuMdm9FaVunDNA3vB0v9seZVlOokwwS8n2UwQTyaJmdHAE=
X-Received: by 2002:ac2:4ac1:0:b0:4dc:807a:d14a with SMTP id
 m1-20020ac24ac1000000b004dc807ad14amr4874647lfp.9.1679096226311; Fri, 17 Mar
 2023 16:37:06 -0700 (PDT)
MIME-Version: 1.0
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
 <patch-2.thread-d13b6c.git-d13b6c96fb5f.your-ad-here.call-01656331067-ext-4899@work.hours>
 <705ce64c-5f73-2ec8-e4bc-dd48c85f0498@kernel.org> <your-ad-here.call-01679051845-ext-2019@work.hours>
In-Reply-To: <your-ad-here.call-01679051845-ext-2019@work.hours>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 18 Mar 2023 08:36:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNATWTfsbhjp0z6JgXWPT8vogsOF=o09gQJzBsHWf9b7HcA@mail.gmail.com>
Message-ID: <CAK7LNATWTfsbhjp0z6JgXWPT8vogsOF=o09gQJzBsHWf9b7HcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] s390/nospec: remove unneeded header includes
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Joe Lawrence <joe.lawrence@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 17, 2023 at 8:17=E2=80=AFPM Vasily Gorbik <gor@linux.ibm.com> w=
rote:
>
> On Thu, Mar 16, 2023 at 12:14:27PM +0100, Jiri Slaby wrote:
> > On 27. 06. 22, 14:50, Vasily Gorbik wrote:
> > > With that, expoline.S doesn't require asm-offsets.h and
> > > expoline_prepare target dependency could be removed.
> > >
> > > +++ b/arch/s390/Makefile
> > > @@ -166,7 +166,7 @@ vdso_prepare: prepare0
> > >   ifdef CONFIG_EXPOLINE_EXTERN
> > >   modules_prepare: expoline_prepare
> > > -expoline_prepare: prepare0
> > > +expoline_prepare:
> >
> > this likely broke s390 build as expolines still depend on
> > scripts/basic/fixdep. And build of expolines can now race with fixdep b=
uild:
> >      make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
> >      /bin/sh: line 1: scripts/basic/fixdep: Permission denied
> >      make[1]: *** [../scripts/Makefile.build:385:
> > arch/s390/lib/expoline/expoline.o] Error 126
> >      make: *** [../arch/s390/Makefile:166: expoline_prepare] Error 2
> >
> > I returned there:
> >   expoline_prepare: prepare0
> > and it looks good so far. Maybe even:
> >   expoline_prepare: scripts
> > would be enough.
>
> Hi Jiri, thanks for looking into this!
>
> Probably even scripts_basic would be enough to add explicit dependency
> to fixdep. But I just couldn't reproduce missing scripts/basic/fixdep
> neither with modules_prepare nor expoline_prepare targets.
>
> With which specific build command were you able to get those error
> messages? I wonder where
>         make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
> is coming from. Could it be smth like?
>
> make ARCH=3Ds390 CROSS_COMPILE=3Ds390x-12.2.0- -j64 arch/s390/lib/expolin=
e/expoline.o
>
> Playing around with this build target I found it is broken:
>
>   AS      arch/s390/lib/expoline/expoline.o
>   AS      arch/s390/lib/expoline/expoline.o
> fixdep: error opening file: arch/s390/lib/expoline/.expoline.o.d: No such=
 file or directory
> make[3]: *** [scripts/Makefile.build:374: arch/s390/lib/expoline/expoline=
.o] Error 2
> make[3]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
> make[2]: *** [scripts/Makefile.build:494: arch/s390/lib/expoline] Error 2
> make[1]: *** [scripts/Makefile.build:494: arch/s390/lib] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:2028: .] Error 2
>
> Notice dup AS call, which is probably causing this:
> make[3]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
>
> But that would be a different issue from the one you are trying to fix.


Kbuild is able to build a single object that is built
in a normal descending.


Since you built arch/s390/lib/expoline/expoline.o
from the special target 'expoline_prepare',
two different threads simultaneously built
arch/s390/lib/expoline/expoline.o
(one from the normal descending, the other
from 'expoline_prepare')

That's why.




--
Best Regards
Masahiro Yamada
