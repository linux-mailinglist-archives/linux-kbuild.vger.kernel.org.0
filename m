Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C69403D6E
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 18:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244084AbhIHQO7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Sep 2021 12:14:59 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54553 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237223AbhIHQO7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Sep 2021 12:14:59 -0400
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 188GDMLn005223;
        Thu, 9 Sep 2021 01:13:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 188GDMLn005223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631117603;
        bh=GeoJfu9VzrOcwmMmfHoNFG8Q7Y6TysUiEZUa7Yh76hM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HQfbYqnm1mdEmOwRDTlMbgL7NWqx0YjtIAAZoG+FMtM/3wezswpnhbyAnTy9i2IB7
         7wIsqfjvpG46+RrXX4NaDlLZKNW16bDQDOVWXN0VdpQIOpeDPMAJSdl5U7IFDOYtXs
         FJapMf3Iyc9D7IbuFj5dSH2mxR8ORrKXY0GsKD4eoOt3IiLx1Ab/h8kGUAwcClHDpW
         zU0sSdERzk/tHqH/ED0li7m+lQw67a9sYxh8HSmEs4Ps4zFCtlMvpMVj87s+MHAUtg
         VIDwmVVhYyubZioKluugndZCbvdO2xrg7blJT/ajgzm4/Fu9Hn+WemkDsirS3ab+HE
         J7sbrvnExGgyQ==
X-Nifty-SrcIP: [209.85.210.170]
Received: by mail-pf1-f170.google.com with SMTP id x19so2475144pfu.4;
        Wed, 08 Sep 2021 09:13:23 -0700 (PDT)
X-Gm-Message-State: AOAM532MpRzQ4ObjyKTcVzlg/8dZjn8ELWQrqq3zQUJQs6eDtJjXh5wS
        RiockiQNK+SeZ9uQsk92bZIpTIXJ//Sy4J2cC+o=
X-Google-Smtp-Source: ABdhPJwqG+I6Nwp5ZizwgLF/rOn19ikLOvLQW+llgL6w0HwZyvvIivlHeXvnkkPtW/1XQwBO3VLD/x8CDG+sjv6AbA4=
X-Received: by 2002:a63:9313:: with SMTP id b19mr4421474pge.128.1631117602216;
 Wed, 08 Sep 2021 09:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-4-masahiroy@kernel.org> <20210904180434.qkdbs27i5f2vtoxv@treble>
 <20210904184530.k6nwfesugx2su2hy@treble>
In-Reply-To: <20210904184530.k6nwfesugx2su2hy@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 9 Sep 2021 01:12:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT64yiN2GG2R9hQXg8wPzL4D4WgWikLNxcp_TYzZ3ijqg@mail.gmail.com>
Message-ID: <CAK7LNAT64yiN2GG2R9hQXg8wPzL4D4WgWikLNxcp_TYzZ3ijqg@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] kbuild: store the objtool command in *.cmd files
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Sep 5, 2021 at 3:45 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Sat, Sep 04, 2021 at 11:04:37AM -0700, Josh Poimboeuf wrote:
> > On Tue, Aug 31, 2021 at 04:39:54PM +0900, Masahiro Yamada wrote:
> > > objtool_dep includes include/config/{ORC_UNWINDER,STACK_VALIDATION}
> > > so that all the objects are rebuilt when any of CONFIG_ORC_UNWINDER
> > > and CONFIG_STACK_VALIDATION is toggled.
> > >
> > > As you can see in 'objtool_args', there are more CONFIG options
> > > that affect the objtool command line.
> > >
> > > Adding more and more include/config/* is ugly and unmaintainable.
> > >
> > > Another issue is that non-standard objects are needlessly rebuilt.
> > > Objects specified as OBJECT_FILES_NON_STANDARD is not processed by
> > > objtool, but they are rebuilt anyway when CONFIG_ORC_UNWINDER or
> > > CONFIG_STACK_VALIDATION is toggled. This is not a big deal, but
> > > better to fix.
> > >
> > > A cleaner and more precise fix is to include the objtool command in
> > > *.cmd files so any command change is naturally detected by if_change.
> >
> > Nice improvement, thanks!
> >
> > s/CONFIG_ORC_UNWINDER/CONFIG_UNWINDER_ORC/g
> >
> > And yes, this means the original ORC unwinder dependency didn't
> > work:
> >
> > > -objtool_dep = $(objtool_obj)                                       \
> > > -         $(wildcard include/config/ORC_UNWINDER            \
> > > -                    include/config/STACK_VALIDATION)
>
> With the typos fixed, and this dependency bug mentioned in the commit
> log:


Ah, nice catch.



commit 11af847446ed0d131cf24d16a7ef3d5ea7a49554
missed to adjust the dependency part.

I will update the commit log
and mention this breakage.







> Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
>
> --
> Josh
>


-- 
Best Regards
Masahiro Yamada
