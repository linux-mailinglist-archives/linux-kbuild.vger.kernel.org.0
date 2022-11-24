Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7B3636EEB
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Nov 2022 01:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiKXAYT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Nov 2022 19:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiKXAYS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2022 19:24:18 -0500
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C735E450B2
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 16:24:16 -0800 (PST)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 2AO0NdXF009838
        for <linux-kbuild@vger.kernel.org>; Thu, 24 Nov 2022 09:23:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2AO0NdXF009838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1669249420;
        bh=r6ePAWWBzeVyaqtO5IRwzRvURt6KSOc8iQlZUbSuFVo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WRSQURVN5Ye2xRGnjHVh8aCIuW29LhcR8S1WANVH0Cww4+8SeEND2iTLadAtdFh9d
         f0dTPIaYE8pkbunfcpLQ5l7TGBNjf3thKaQH2hik47j0NDnYZYl7q/ll/4ELhemQcs
         NN+lgZaZsCOCatxDiBO4QIu0MnB1Qop/UsRFEdD2I1cNMI0t+iye4Z4UkHcWiHe0mC
         qMqJkOuprYTCWicCr7ShUKa3Vk5OmZLN79eSOXPoKeis7Pq3WtRnXw3x7US/e7+b1i
         QA1Zw1QsE17CwM9vYxxxyleA4I8Zc7YsPfycOrBlXNJWMEO3Kvafgq5PFw/VV4y4bF
         AFfLjy6p9NcYQ==
X-Nifty-SrcIP: [209.85.167.182]
Received: by mail-oi1-f182.google.com with SMTP id s206so92239oie.3
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 16:23:39 -0800 (PST)
X-Gm-Message-State: ANoB5pmo9aE7BJuC3g98PqGwy5lilRWzVtAo3NaG7cyBuK4cokBCSFJp
        noJWVIPX3inQQcDMKk5dsZ1fkfX+KME19WgbU34=
X-Google-Smtp-Source: AA0mqf45F2E+KlW81Gq2MiJ7lD86i9Vok3Us3hztRQVBA2H2j3QtXnwro+wVvLyq8nYtK/qoTXUVAR0uKNMo4c2kWcU=
X-Received: by 2002:aca:1c06:0:b0:354:28ae:23b3 with SMTP id
 c6-20020aca1c06000000b0035428ae23b3mr6821821oic.287.1669249418813; Wed, 23
 Nov 2022 16:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20221123153202.1814324-1-dzickus@redhat.com> <CAK7LNASW1=P8DKQD=pD8U2B5spTgjdxSOxqh559h-NCehUh5DQ@mail.gmail.com>
 <CAFbkSA2ERW3ASZOW1Swwxej3UrKDN7UJEsBY+k2fmHL=89-EaQ@mail.gmail.com>
In-Reply-To: <CAFbkSA2ERW3ASZOW1Swwxej3UrKDN7UJEsBY+k2fmHL=89-EaQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 24 Nov 2022 09:23:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYUntigQhJtNzit=cSxCu2sXgu2w5bKoAzk3iC2jt4jw@mail.gmail.com>
Message-ID: <CAK7LNATYUntigQhJtNzit=cSxCu2sXgu2w5bKoAzk3iC2jt4jw@mail.gmail.com>
Subject: Re: [OS-BUILD PATCH] Adding support for distro targets in Makefile
To:     Justin Forbes <jforbes@fedoraproject.org>
Cc:     Don Zickus <dzickus@redhat.com>, linux-kbuild@vger.kernel.org,
        prarit@redhat.com, scweaver@redhat.com, ptalbert@redhat.com,
        herton@redhat.com, jtoppins@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 24, 2022 at 1:08 AM Justin Forbes <jforbes@fedoraproject.org> wrote:
>
> On Wed, Nov 23, 2022 at 9:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Nov 24, 2022 at 12:32 AM Don Zickus <dzickus@redhat.com> wrote:
> > >
> > > Fedora adds a directory to its source git tree to provide packaging
> > > information[1] specific for its distro.  We would like to propagate our
> > > 'help' section to the toplevel to be seen by 'make help' as it isn't
> > > obvious to users to use 'make dist-help'[2].
> > >
> > > Instead of keeping Fedora changes local, I am proposing a generic
> > > mechanism for other distros to use if they would like.  The change looks
> > > for a distro directory and leverages that Makefile if it exists.
> > > Otherwise it is ignored.
> > >
> > > [1] - https://gitlab.com/cki-project/kernel-ark/-/tree/os-build/redhat
> > > [2] - https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/redhat/Makefile#L809
> > >
> > > Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
> > > Signed-off-by: Don Zickus <dzickus@redhat.com>
> > >
> > > ----
> > > This patch is more of a conversation starter than anything.
> > >
> > > I think other distros might find this useful and examples of what we would
> > > populate the directory with can be found in [1].
> > >
> > > Thoughts?
> >
> > I do not like to merge any code that is irrelevant to the upstream.
>
>
> While not directly relevant to the upstream tree, it is very relevant
> to the way the tree is being used. More importantly, it allows a
> "distro agnostic" mechanism without requiring distributions or other
> developers/users with their own additional make targets to avoid
> carrying a patch to make it all work.
>
> Justin



This is another contract to downstream code.

Once this is merged, it will be difficult to change it
because the upstream community never knows how it is used
in downstream.


For example,

   $(Q)$(MAKE) -C $(srctree)/distro $@

violates the rule on how Kbuild works
(in the sense of the working directory).


   $(Q)$(MAKE) -f $(srctree)/distro/Makefile $@

is more aligned with how O= build works, but
we cannot _fix_ it later since this changes the working directory.

And, I assume people will come back again, for example,
to insert another hook into "make clean" for cleaning distro artifacts.

So, it is better to not merge code like this.






> >
> > > ---
> > >  Makefile | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 6f846b1f2618f..45fdb18dde46f 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1635,6 +1635,16 @@ distclean: mrproper
> > >  %pkg: include/config/kernel.release FORCE
> > >         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
> > >
> > > +# Distribution of the kernel
> > > +# ---------------------------------------------------------------------------
> > > +
> > > +dist%: FORCE
> > > +       @if ! test -f $(srctree)/distro/Makefile; then \
> > > +               echo 'No distribution targets defined'; \
> > > +               exit 1; \
> > > +       fi
> > > +       $(Q)$(MAKE) -C $(srctree)/distro $@
> > > +
> > >  # Brief documentation of the typical targets used
> > >  # ---------------------------------------------------------------------------
> > >
> > > @@ -1732,6 +1742,11 @@ help:
> > >         @echo  ''
> > >         @echo  'Kernel packaging:'
> > >         @$(MAKE) -f $(srctree)/scripts/Makefile.package help
> > > +       @if test -f $(srctree)/distro/Makefile; then \
> > > +               echo ''; \
> > > +               echo 'Distro targets:'; \
> > > +               $(MAKE) -C $(srctree)/distro dist-help; \
> > > +       fi
> > >         @echo  ''
> > >         @echo  'Documentation targets:'
> > >         @$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
> > > --
> > > 2.38.1
> > >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
> >



-- 
Best Regards
Masahiro Yamada
