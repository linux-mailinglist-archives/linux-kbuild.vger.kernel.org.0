Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B58413EF951
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 06:29:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237386AbhHREaW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 00:30:22 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33353 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237378AbhHREaV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 00:30:21 -0400
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 17I4TNtQ027267;
        Wed, 18 Aug 2021 13:29:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 17I4TNtQ027267
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629260964;
        bh=PpMGCNaWd4BEDbC0/8VA91QAy4TmkP9+B95/axi+84Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JotFhWbOC8xwA/rAWyc/1iToeGbCUruGQoK531vV5UcNJ5xXFRzsdpT0I0+/v3qcr
         JLYN7czdb/7w9IZihhyV5GMhAFohRkSMgBlAnoOnO37jQ8djOt5e1L1lapLmcHU2Iy
         MrAjpWlizKUSlrgVkAO49oXCFX/METEu3xQHGDFVj051+pgGAQXbep/Bf6Wu0haNIS
         veuT8tk4DTYtLQQZaPJQozYOgrnEi9O6/AN9Fz/RvKD/+GdlOfliiPcRAJxqhReHrW
         q/lF4HdXWFfoQ44/fTVZ1RMEC9rcWgAUREepfFv3iRSG3PqUQmNWNq4l5i34+JEgCM
         3SV7JGaSOBw0Q==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id r2so937318pgl.10;
        Tue, 17 Aug 2021 21:29:24 -0700 (PDT)
X-Gm-Message-State: AOAM530poIUtApbaewCi5zyM5zRbDByOxnPBM25AHsy/DwjmcmTR9+sM
        4f99bJc04DTykFLL08TvyqMTutdn2heY7V86650=
X-Google-Smtp-Source: ABdhPJyMR3ZRIGDNqW3+MuvaOJXaNBSklUp2QU7ZI9rq3fO8xoXmD6qX6AZTdU1BCUg194aW9/cex+2OOepxaMNFrLU=
X-Received: by 2002:aa7:8e56:0:b029:3cd:c2ec:6c1c with SMTP id
 d22-20020aa78e560000b02903cdc2ec6c1cmr7043311pfr.80.1629260963273; Tue, 17
 Aug 2021 21:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210814234102.2315551-1-masahiroy@kernel.org>
 <3afe5054-8129-fe42-b5a4-00bd091b1a0c@kernel.org> <CAFP8O3JtOpb368h4PBbYnR4fsqRYkX_TKuCKrS-Csu=dMMNiKA@mail.gmail.com>
In-Reply-To: <CAFP8O3JtOpb368h4PBbYnR4fsqRYkX_TKuCKrS-Csu=dMMNiKA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Aug 2021 13:28:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNAStyrVnrc4GQ7MNQizBpKbRk-1WmNQEw5mzAp2+LYUiyA@mail.gmail.com>
Message-ID: <CAK7LNAStyrVnrc4GQ7MNQizBpKbRk-1WmNQEw5mzAp2+LYUiyA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
To:     =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 15, 2021 at 12:18 PM F=C4=81ng-ru=C3=AC S=C3=B2ng <maskray@goog=
le.com> wrote:
>
> On Sat, Aug 14, 2021 at 6:15 PM Nathan Chancellor <nathan@kernel.org> wro=
te:
> >
> > On 8/14/2021 4:41 PM, Masahiro Yamada wrote:
> > > When CONFIG_TRIM_UNUSED_KSYMS is enabled, I see some warnings like th=
is:
> > >
> > >    nm: arch/x86/entry/vdso/vdso32/note.o: no symbols
> > >
> > > $NM (both GNU nm and llvm-nm) warns when no symbol is found in the
> > > object. Suppress the stderr.
> > >
> > > Fixes: bbda5ec671d3 ("kbuild: simplify dependency generation for CONF=
IG_TRIM_UNUSED_KSYMS")
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> LGTM.
>
> FWIW binutils>=3D2.37 `nm -q` can be used to suppress "no symbols"
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D27408
>
> llvm-nm>=3D13.0.0 supports -q as well.


Thanks for the info.
Perhaps, I can note the future migration to -q
in a comment.






--=20
Best Regards
Masahiro Yamada
