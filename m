Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8D73198E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 04:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229467AbhBLDl6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 22:41:58 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28402 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhBLDl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 22:41:56 -0500
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 11C3ekF1021377;
        Fri, 12 Feb 2021 12:40:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11C3ekF1021377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613101247;
        bh=pG/OJzM59r3vLQTzd4X/NaxClE5gYa5IX5eP29F4sOY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eKQ6QFiXY3t1NhEJqy5vKxVE6ykBDbNz9kmZxYJ52UJ8aPUOVRfLB82J2hwyu2BcK
         7FljOGnwAWvYj2Potml01bEIHSpILyvxrJ5rmACLMW3IDr0WII1ewihS0k/b1CPGXT
         /mukVhlmfJxOBTTxw+f/5hshX5PaTG79fFrjnhYHYMI6Mcq1dKdCNn4xmZB4FYjB8S
         DhPmGgcKFBjDJzizw2HhthulqeMK4D8yPEMfGQEWz3ZM5Mo8BfLZL12CDCpJcdIfuF
         MBktEyiuvZ4dY6eKYhZ7xxe36ZaQ411BW+tf+Dilpbd/2pNwDtcZ8cIqZap078ImqV
         GXXUW26fphbqQ==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id x9so4433451plb.5;
        Thu, 11 Feb 2021 19:40:47 -0800 (PST)
X-Gm-Message-State: AOAM530bncAWxT7C3BwYXw3wx0Ugolw5PBc/P6lzoqgVBH7inGx582pk
        i3TYse7Ka8JacfNELEe2vDH/EJ2sJad3cg6Y5Yw=
X-Google-Smtp-Source: ABdhPJyZzI+cht22tb75Ymef8K/ASjRMA6GacsO2qgDIi6jcH7B5gKcwtBZRyKHIgpo0kln+GV5V/4lEE95volBbi0M=
X-Received: by 2002:a17:902:8687:b029:e1:601e:bd29 with SMTP id
 g7-20020a1709028687b02900e1601ebd29mr1144608plo.47.1613101246499; Thu, 11 Feb
 2021 19:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20210207161352.2044572-1-sashal@kernel.org> <20210208175007.GA1501867@infradead.org>
 <20210208182001.GA4035784@sasha-vm> <CAK7LNAQtQTwGt4SCK88a=y4ydASXoR30cCCmcFFdsUk=WY7tfA@mail.gmail.com>
In-Reply-To: <CAK7LNAQtQTwGt4SCK88a=y4ydASXoR30cCCmcFFdsUk=WY7tfA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 12 Feb 2021 12:40:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASo2i_NT8acBCJ2gYeLE_rjyncSteyqD_mrMMR5Wf261g@mail.gmail.com>
Message-ID: <CAK7LNASo2i_NT8acBCJ2gYeLE_rjyncSteyqD_mrMMR5Wf261g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
To:     Sasha Levin <sashal@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 12, 2021 at 5:18 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Feb 9, 2021 at 3:20 AM Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Mon, Feb 08, 2021 at 05:50:07PM +0000, Christoph Hellwig wrote:
> > >On Sun, Feb 07, 2021 at 11:13:52AM -0500, Sasha Levin wrote:
> > >> +            (u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
> > >> +            (u16)(LINUX_VERSION_SUBLEVEL));
> > >
> > >No need for the casts and braces.
> > >
>
>
> I agree.
>
> Shall I remove the casts when I apply this?
>
>
>
>
> > >Otherwise this looks good, but please also kill off KERNEL_VERSION
> > >and LINUX_KERNEL_VERSION entirely while you're at it.
> >
> > I don't think there are in-tree users left?
> >
> > We can't remove it completely because userspace is still using it, so if
> > we drop those userspace will be sad.
>
>
> Right.
> Once we export a macros to userspace, we cannot remove it.
>
>
>
>
>
> > --
> > Thanks,
> > Sasha
>
>
>
> --
> Best Regards
> Masahiro Yamada





Wait, this patch does not work.
None of the submitter or reviewers
tested this patch... Sigh.


masahiro@grover:~/workspace/linux-kbuild$ make
Makefile:1249: *** missing 'endef', unterminated 'define'.  Stop.







diff --git a/Makefile b/Makefile
index ef81c8895abf..1fdd44fe1659 100644
--- a/Makefile
+++ b/Makefile
@@ -1258,7 +1258,7 @@ define filechk_version.h
        ((c) > 255 ? 255 : (c)))';                                       \
        echo \#define LINUX_VERSION_MAJOR $(VERSION);                    \
        echo \#define LINUX_VERSION_PATCHLEVEL $(PATCHLEVEL);            \
-       echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL);                \
+       echo \#define LINUX_VERSION_SUBLEVEL $(SUBLEVEL)
 endef

 $(version_h): FORCE





-- 
Best Regards
Masahiro Yamada
