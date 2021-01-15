Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4873E2F6FF6
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Jan 2021 02:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbhAOB04 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 20:26:56 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:32482 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbhAOB0z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 20:26:55 -0500
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 10F1Psc1004710;
        Fri, 15 Jan 2021 10:25:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 10F1Psc1004710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610673955;
        bh=LIljr1P6iCBWA5zG5KVb7+x3iDad2gv902xOCN8W3X4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T4+JPlmsXW/rV33sZqCuMML8oT78soshLGgzoVDnu068HKvD2xjyNiEVjIb0d2Fvl
         HbX8Bag1dv4n+Nr2jdSg7Dv2/tQg2XONLY7EUUjv5Y9MgGvbkZWzbATOdSsCkyN8na
         8Ixs14QfiHNZdb90ZJo3sy0Ne14zcKG3MNjJTg7bu92zIjI/Et+SCBSwe42wZGSgmx
         2SiCaYfxj4mF7gGfpmyjHP/DELIiAXhgH8BbizBdfczacnHcMysv4mp7pLo31k4Ln4
         BdFO5ySh9+xS+Asp+u6I9ZmkfzoXGZBB7Grcmu1HhY2TBMdtCJNoIcjRaXi/7h8Gsk
         H8MJsDUn0ZzfQ==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id m5so4254818pjv.5;
        Thu, 14 Jan 2021 17:25:54 -0800 (PST)
X-Gm-Message-State: AOAM532wlX12evdOvGZvA/RPupLV84qGQVn4qAaC+ol+JOjJqzjK719/
        2OvTaTVcYFVxQOyPmdaP1QBwUm8vLtTnVur7kpo=
X-Google-Smtp-Source: ABdhPJx0tVmxZaFqtRy0eHjurPh24Wt0zrqjSjO0MbfRdJlc6jJYMpxtOLDBnWhAT/HD1UYbc87yZqkae5+aQqZIY0c=
X-Received: by 2002:a17:90b:1b50:: with SMTP id nv16mr3346586pjb.153.1610673954067;
 Thu, 14 Jan 2021 17:25:54 -0800 (PST)
MIME-Version: 1.0
References: <1610500731-30960-2-git-send-email-jjohnson@codeaurora.org>
 <1610660990-18812-1-git-send-email-jjohnson@codeaurora.org> <CAKwvOdnfm9XvKsgn30HSUYoCSibHND-JSTqNH0yU7bfpYog_3w@mail.gmail.com>
In-Reply-To: <CAKwvOdnfm9XvKsgn30HSUYoCSibHND-JSTqNH0yU7bfpYog_3w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 15 Jan 2021 10:25:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGOwGyZMw=bfBEPRS9K6DbCOgVzhgP1K6mMfOBLHN_bA@mail.gmail.com>
Message-ID: <CAK7LNARGOwGyZMw=bfBEPRS9K6DbCOgVzhgP1K6mMfOBLHN_bA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: handle excessively long argument lists
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jeff Johnson <jjohnson@codeaurora.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Prasad Sodagudi <psodagud@quicinc.com>,
        Elliot Berman <eberman@quicinc.com>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Michal Marek <michal.lkml@markovi.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 15, 2021 at 10:01 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jan 14, 2021 at 1:50 PM Jeff Johnson <jjohnson@codeaurora.org> wrote:
> >
> > From: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
> >
> > Modules with a large number of compilation units may be
> > exceeding AR and LD command argument list. Handle this gracefully by
> > writing the long argument list in a file. The command line options
> > read from file are inserted in place of the original @file option.
> >
> > The usage is well documented at
> > https://www.gnu.org/software/make/manual/html_node/File-Function.html
> >
> > Signed-off-by: Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>
> > Signed-off-by: Jeff Johnson <jjohnson@codeaurora.org>
> > ---
> >
> > Changes in v2:
> >   - Remove spurious endif
> >
> > scripts/Makefile.build | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 252b7d2..787dca2 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -425,7 +425,10 @@ $(obj)/lib.a: $(lib-y) FORCE
> >  # module is turned into a multi object module, $^ will contain header file
> >  # dependencies recorded in the .*.cmd file.
> >  quiet_cmd_link_multi-m = LD [M]  $@
> > -      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
> > +      cmd_link_multi-m =                                       \
> > +       $(file >$@.in,$(filter %.o,$^))                         \
> > +       $(LD) $(ld_flags) -r -o $@ @$@.in;                      \
> > +       rm -f $@.in
>
> The GNU Make docs linked above use an `@` before the invocation of
> `rm`. I don't know what that's about, but that or even this patch
> doesn't affect my ability to build negatively. LGTM


See this:

https://www.gnu.org/software/make/manual/html_node/Echoing.html#Echoing




> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> >
> >  $(multi-used-m): FORCE
> >         $(call if_changed,link_multi-m)
> > --
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
