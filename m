Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B40AA17B536
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2020 05:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgCFEGw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Mar 2020 23:06:52 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47985 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgCFEGv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Mar 2020 23:06:51 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02646ecs001794
        for <linux-kbuild@vger.kernel.org>; Fri, 6 Mar 2020 13:06:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02646ecs001794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583467601;
        bh=1ncTuHIScTyMk5Taq9h+PaYHUlk1ciBILDFFXrE1EGY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AN/iyWAoAaHJzfTMA3AOJ3J+oK7YbDQoN4IIcFngK8nTHHzfeX/0CVBownZ1mLDCs
         aObsYtzo5qE7yW3XofKI5/HbCMuKndPaVRZHmocGqDxiAhC8mxCeXEQJDezHD13KC2
         sIHTgRKALwAjaw14kbBmF0/C9WNa9dFrHifTLG66dQW4ZWeSJTUz/eHb6axnhfGckC
         tz6vKR4AJ0V0T1bGXyTLdUY5cau3eWoQSG9STCWrmoi/Fh2sIM21+t2vuOu5yqyd8k
         zQlEe95Ksl6/J9YLUrEvvkIrnx6+kB8aeLUaV4l07myuxBDhF3I9AEMM7RTv9cwTTl
         q2QM25KfunLqg==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id 7so680243vsr.10
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2020 20:06:40 -0800 (PST)
X-Gm-Message-State: ANhLgQ00bblCb414zDH8zw0l4qqx/NCPN48GK1wuuWoJgM9MdfkAYX2+
        Zn4WauhBHnI/PUSU/xVbLFZxgQvWChvbjSMUu9g=
X-Google-Smtp-Source: ADFU+vuschWJHDj8euZdyGy+o4J220QDbrHnuo+M3bhxaiWSQnYbzLYxv/gCmox0lsIvqG8GQKiryVE9QJC9OGlDDK4=
X-Received: by 2002:a67:8c44:: with SMTP id o65mr983718vsd.181.1583467599524;
 Thu, 05 Mar 2020 20:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20200219000434.15872-1-mpe@ellerman.id.au> <48YT3Y2QBsz9sSs@ozlabs.org>
In-Reply-To: <48YT3Y2QBsz9sSs@ozlabs.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 6 Mar 2020 13:06:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
Message-ID: <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
To:     Michael Ellerman <patch-notifications@ellerman.id.au>
Cc:     Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 6, 2020 at 9:27 AM Michael Ellerman
<patch-notifications@ellerman.id.au> wrote:
>
> On Wed, 2020-02-19 at 00:04:34 UTC, Michael Ellerman wrote:
> > Some of our phony targets are not marked as such. This can lead to
> > confusing errors, eg:
> >
> >   $ make clean
> >   $ touch install
> >   $ make install
> >   make: 'install' is up to date.
> >   $
> >
> > Fix it by adding them to the PHONY variable which is marked phony in
> > the top-level Makefile, or in scripts/Makefile.build for the boot
> > Makefile.
> >
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Applied to powerpc next.
>
> https://git.kernel.org/powerpc/c/d42c6d0f8d004c3661dde3c376ed637e9f292c22
>

You do not have to double your Signed-off-by.



-- 
Best Regards
Masahiro Yamada
