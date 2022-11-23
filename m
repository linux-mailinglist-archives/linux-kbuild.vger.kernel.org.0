Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDE80636567
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Nov 2022 17:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238866AbiKWQIi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Nov 2022 11:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238815AbiKWQIe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Nov 2022 11:08:34 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FCF67116
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 08:08:27 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id q71so17115644pgq.8
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PzpBnYoBJZ8modkjYcR69swnVjm40muUxC7mF8yb+SI=;
        b=ievgugMaGI+FicBltLS/68RcQ2dmfozxgRmKLni/D7KmEt21tUhGOA3ugiOoKxVoH5
         d56njqEVOqUnqFtjl8NgsGYcXqIn6lVOIgvMkPD4s8pSDAbI9z52MwUV+HYLSM1JXyGO
         PtJMwMJPCvFCXH/BZz2rooVrj6pvyBksOKyio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzpBnYoBJZ8modkjYcR69swnVjm40muUxC7mF8yb+SI=;
        b=g15oPZuqOe4zS/YcJJ+VyjQX68dRjAj5XOuIgDxmKLPkS4bSfklIZMyOnN0/C4dEPn
         x7gdF6a1Jr7nviVjKie3lbwCy942kMN1wcd0tWjeIs0ZF68g9V3f7Xqa+R9HP5T2e3FW
         IwF0TeumSFNSevBpc84PNrc1zjOMA60OVTPx6T1IvT+Hidb/DdGRrC3q0KbuP326M60g
         t5NSNw60K2e5GnWhQboktMFyG4cTtXHUaZanyj85zGV85hg5IqI/mDNDROFUVixh1T9q
         +w4I/R+CLcZadrn4mEezZtNDNBRLXaEy2jNxmnfD+Gmf4LKfLeQqw7QfYA38ampstOl2
         vj/A==
X-Gm-Message-State: ANoB5pl6xByuqD/s3/3jLt5iRHvPnL28lkrnwgJijabSisR9jtglvR8a
        eKc/Y1kcSMXhYBXZ7valfR04LCZd/59uC75+
X-Google-Smtp-Source: AA0mqf4cWO9TB2PEH3RbWjav6tkw638z2Mvzyk+V9fiv9q4gzEsQHGB6teGVok9Mvi98IXvXui3GxQ==
X-Received: by 2002:a63:4c4b:0:b0:46f:f112:e782 with SMTP id m11-20020a634c4b000000b0046ff112e782mr7970126pgl.219.1669219706712;
        Wed, 23 Nov 2022 08:08:26 -0800 (PST)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com. [209.85.214.174])
        by smtp.gmail.com with ESMTPSA id q12-20020a17090311cc00b001888cadf8f6sm14615301plh.49.2022.11.23.08.08.26
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 08:08:26 -0800 (PST)
Sender: Justin Forbes <jmforbes@linuxtx.org>
Received: by mail-pl1-f174.google.com with SMTP id jn7so15195082plb.13
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Nov 2022 08:08:26 -0800 (PST)
X-Received: by 2002:a17:902:f68a:b0:176:71be:cc64 with SMTP id
 l10-20020a170902f68a00b0017671becc64mr11133179plg.141.1669219705789; Wed, 23
 Nov 2022 08:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20221123153202.1814324-1-dzickus@redhat.com> <CAK7LNASW1=P8DKQD=pD8U2B5spTgjdxSOxqh559h-NCehUh5DQ@mail.gmail.com>
In-Reply-To: <CAK7LNASW1=P8DKQD=pD8U2B5spTgjdxSOxqh559h-NCehUh5DQ@mail.gmail.com>
From:   Justin Forbes <jforbes@fedoraproject.org>
Date:   Wed, 23 Nov 2022 10:08:14 -0600
X-Gmail-Original-Message-ID: <CAFbkSA2ERW3ASZOW1Swwxej3UrKDN7UJEsBY+k2fmHL=89-EaQ@mail.gmail.com>
Message-ID: <CAFbkSA2ERW3ASZOW1Swwxej3UrKDN7UJEsBY+k2fmHL=89-EaQ@mail.gmail.com>
Subject: Re: [OS-BUILD PATCH] Adding support for distro targets in Makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Don Zickus <dzickus@redhat.com>, linux-kbuild@vger.kernel.org,
        prarit@redhat.com, scweaver@redhat.com, ptalbert@redhat.com,
        herton@redhat.com, jtoppins@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Nov 23, 2022 at 9:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Nov 24, 2022 at 12:32 AM Don Zickus <dzickus@redhat.com> wrote:
> >
> > Fedora adds a directory to its source git tree to provide packaging
> > information[1] specific for its distro.  We would like to propagate our
> > 'help' section to the toplevel to be seen by 'make help' as it isn't
> > obvious to users to use 'make dist-help'[2].
> >
> > Instead of keeping Fedora changes local, I am proposing a generic
> > mechanism for other distros to use if they would like.  The change looks
> > for a distro directory and leverages that Makefile if it exists.
> > Otherwise it is ignored.
> >
> > [1] - https://gitlab.com/cki-project/kernel-ark/-/tree/os-build/redhat
> > [2] - https://gitlab.com/cki-project/kernel-ark/-/blob/os-build/redhat/Makefile#L809
> >
> > Signed-off-by: Jonathan Toppins <jtoppins@redhat.com>
> > Signed-off-by: Don Zickus <dzickus@redhat.com>
> >
> > ----
> > This patch is more of a conversation starter than anything.
> >
> > I think other distros might find this useful and examples of what we would
> > populate the directory with can be found in [1].
> >
> > Thoughts?
>
> I do not like to merge any code that is irrelevant to the upstream.


While not directly relevant to the upstream tree, it is very relevant
to the way the tree is being used. More importantly, it allows a
"distro agnostic" mechanism without requiring distributions or other
developers/users with their own additional make targets to avoid
carrying a patch to make it all work.

Justin

>
> > ---
> >  Makefile | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 6f846b1f2618f..45fdb18dde46f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1635,6 +1635,16 @@ distclean: mrproper
> >  %pkg: include/config/kernel.release FORCE
> >         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
> >
> > +# Distribution of the kernel
> > +# ---------------------------------------------------------------------------
> > +
> > +dist%: FORCE
> > +       @if ! test -f $(srctree)/distro/Makefile; then \
> > +               echo 'No distribution targets defined'; \
> > +               exit 1; \
> > +       fi
> > +       $(Q)$(MAKE) -C $(srctree)/distro $@
> > +
> >  # Brief documentation of the typical targets used
> >  # ---------------------------------------------------------------------------
> >
> > @@ -1732,6 +1742,11 @@ help:
> >         @echo  ''
> >         @echo  'Kernel packaging:'
> >         @$(MAKE) -f $(srctree)/scripts/Makefile.package help
> > +       @if test -f $(srctree)/distro/Makefile; then \
> > +               echo ''; \
> > +               echo 'Distro targets:'; \
> > +               $(MAKE) -C $(srctree)/distro dist-help; \
> > +       fi
> >         @echo  ''
> >         @echo  'Documentation targets:'
> >         @$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
> > --
> > 2.38.1
> >
>
>
> --
> Best Regards
> Masahiro Yamada
>
