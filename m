Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE28B3FF803
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Sep 2021 01:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345788AbhIBXod (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Sep 2021 19:44:33 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:53417 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345767AbhIBXod (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Sep 2021 19:44:33 -0400
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 182NhGBM002354;
        Fri, 3 Sep 2021 08:43:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 182NhGBM002354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630626197;
        bh=CgOu7BX9iv37SF0xKSnHydEjRylYWO03h6ffcdcVd0k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SbyppZezlbDIbjPj8zAqQbKQbbcY8jbwf2jwS4N9SS1QZ+HFqk3/Nb2oVjkkYjYp4
         11sdasa9LDGYV1M3pS5Yl9piBCrBNWuVVQhNpKmzLFOawE6SpaoVCSfeRfvYndXlyQ
         BV299vPM2Pd/9Fr+WL+mts4zzWPLjNC4mxcUuQLzh++5Wwjp1mMsXHDQ5HA+h8+wej
         l0spYT0bjfn2921/RQ6lOmnNgvlea8v3Rtcc63UF1y/X6xFD2ENUwjkeGoqWBaTBKP
         +gM+vJXk64SGyPXbb3a9um+5sfZRh6mTAyzy2gtWH0V4DQ/FtUe4Hsvzse1/OLt/0p
         c1I1I5WXyQk2w==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id c5so1300352plz.2;
        Thu, 02 Sep 2021 16:43:17 -0700 (PDT)
X-Gm-Message-State: AOAM533lbxmUPeJPGccl+VEc8tnlf1A2bdgyZ/3wNj7sBvh+ht7RXahH
        PLRQWnyOGRB9k9zgfgd62pWi1wOy1k+Xhs94cMw=
X-Google-Smtp-Source: ABdhPJx8yOcv4vLxTqdEA1damqUdEXGLfoErCyqMlNmqUeixlsYRrdRjkIVpY2cbYFEmUffPru6+oEHOUatXkbmhS+k=
X-Received: by 2002:a17:90a:19da:: with SMTP id 26mr6670037pjj.198.1630626196620;
 Thu, 02 Sep 2021 16:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-6-masahiroy@kernel.org> <CAKwvOdmsnuv6qa5USKqqhg419FGD55U2zGw_KngmBcz_UDOOcg@mail.gmail.com>
In-Reply-To: <CAKwvOdmsnuv6qa5USKqqhg419FGD55U2zGw_KngmBcz_UDOOcg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Sep 2021 08:42:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQeYJJuKTsYxyXV-_7bKfwWgS+Pa8FTadg_p-XHb0NPLg@mail.gmail.com>
Message-ID: <CAK7LNAQeYJJuKTsYxyXV-_7bKfwWgS+Pa8FTadg_p-XHb0NPLg@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] kbuild: detect objtool update without using .SECONDEXPANSION
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 1, 2021 at 2:33 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Tue, Aug 31, 2021 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Redo commit 8852c5524029 ("kbuild: Fix objtool dependency for
> > 'OBJECT_FILES_NON_STANDARD_<obj> := n'") to add the objtool
> > dependency in a cleaner way.
> >
> > Using .SECONDEXPANSION ends up with unreadable code due to escaped
> > dollars. Also, it is not efficient because the second half of
> > Makefile.build is parsed twice every time.
> >
> > Append the objtool dependency to the *.cmd files at the build time.
> >
> > This is what fixdep and gen_ksymdeps.sh already do. So, following the
> > same pattern seems a natural solution.
> >
> > This allows us to drop $$(objtool_deps) entirely.
>
> s/objtool_deps/objtool_dep/
>
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> You and Josh should be cc'ing each other explicitly on these kind of changes.
>


FWIW, this is the entire patch set if Josh is interested:

https://patchwork.kernel.org/project/linux-kbuild/list/?series=539621


--
Best Regards
Masahiro Yamada
