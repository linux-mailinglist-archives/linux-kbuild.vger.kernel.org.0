Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25793F0F82
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234706AbhHSAjJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:39:09 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:26598 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234523AbhHSAjJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:39:09 -0400
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 17J0cGMP008276;
        Thu, 19 Aug 2021 09:38:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 17J0cGMP008276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629333497;
        bh=4ROc88QJM0QKYideQbh4G4anJq335Qa4CulZAcIQfpI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GCvHq0xw/czvUMMv1ixS8rJqd+KymJhchfizw7zCVL9iO7srMfB7euWPGWriJSxey
         Hhbiu/0Zm6f815kcswePgCPe2xJhFGy/P/8UNGWf9BkkWDFCImsfYKXYTO6MR3SMW5
         sx1pT73RdZ52AdUzIxKFZsh3Usmd7OPLOl18Aw6/2+0N4bfMVRlCiCt+bLEIjRMD11
         25cY67x0bs07scxSXd9i0QPXtDmt/NDxX5l/hl/NKONxLee2UMC5d5GOhyLGLDXB9o
         MFs1O5Xkm7VQFoRl6dRywiXsJfEpYB/1w1TwTNaYtZ11WjeDxoaaXMNCxEbrEmAXkq
         9UGrBTtqAzByA==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id n5so3793838pjt.4;
        Wed, 18 Aug 2021 17:38:17 -0700 (PDT)
X-Gm-Message-State: AOAM5316+mTOP58lftnAGpOFzr4+YfRqOB3XzTKB0dXA8Npwn+1Wkw5l
        ovqvHneq3SA+ht90PBwz7O5iAGTzWpltjH7uMjE=
X-Google-Smtp-Source: ABdhPJyU/StYHyKPcY/ewEeBfxgGrRwPMBHM9J5/GMbkKDcWCcM8Ue3/01tGZMz5U61xtLCMMUxyOuKrzCWQBPZsg1E=
X-Received: by 2002:a17:90a:c506:: with SMTP id k6mr12002627pjt.198.1629333496517;
 Wed, 18 Aug 2021 17:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210813063005.1739278-1-masahiroy@kernel.org>
 <20210813063005.1739278-2-masahiroy@kernel.org> <YRtyc1poEhr8YHYp@deb-nschier.ads.avm.de>
In-Reply-To: <YRtyc1poEhr8YHYp@deb-nschier.ads.avm.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 19 Aug 2021 09:37:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5CpXU_Yn=pyqLA_2spiRh9qXQyRuy6KR=nWxqN_NKgQ@mail.gmail.com>
Message-ID: <CAK7LNAT5CpXU_Yn=pyqLA_2spiRh9qXQyRuy6KR=nWxqN_NKgQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: warn if FORCE is missing for
 if_changed(_dep,_rule) and filechk
To:     Nicolas Schier <n.schier@avm.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 5:25 PM Nicolas Schier <n.schier@avm.de> wrote:
>
> On Friday, 2021-08-13 Masahiro Yamada wrote:
> > if_changed, if_changed_dep, and if_changed_rule must have FORCE as a
> > prerequisite so the command line change is detected.
> >
> > Documentation/kbuild/makefiles.rst clearly explains it:
> >
> >   Note: It is a typical mistake to forget the FORCE prerequisite.
> >
> > However, not all people read the document, or understand what is written
> > in it.
> >
> > People repeated this mistake over again, and I determined a compelling
> > force is needed.
> >
> > Show a warning if FORCE is missing in the prerequisite of if_changed
> > and friends. Same for filechk.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/Kbuild.include | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> > index c3c975a92318..dd48e68965f8 100644
> > --- a/scripts/Kbuild.include
> > +++ b/scripts/Kbuild.include
> > @@ -57,6 +57,7 @@ kecho := $($(quiet)kecho)
> >  # - If the content differ the new file is used
> >  # - If they are equal no change, and no timestamp update
> >  define filechk
> > +     $(check-FORCE)
> >       $(Q)set -e;                                             \
> >       mkdir -p $(dir $@);                                     \
> >       trap "rm -f $(dot-target).tmp" EXIT;                    \
> > @@ -130,7 +131,11 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
> >  # PHONY targets skipped in both cases.
> >  newer-prereqs = $(filter-out $(PHONY),$?)
> >
> > -if-changed-cond = $(newer-prereqs)$(cmd-check)
> > +# It is a typical mistake to forget the FORCE prerequisite. Check it here so
>
> prerequsite -> prerequisite?

Thanks for catching it.

Applied with the typo fixed.



> Successfully found the missing FORCE in arch/x86/entry/vdso/Makefile:135.
>
> Tested-by: Nicolas Schier <n.schier@avm.de>
>
> > +# no more breakage will slip in.
> > +check-FORCE = $(if $(filter FORCE, $^),,$(warning FORCE prerequsite is missing))
> > +
> > +if-changed-cond = $(newer-prereqs)$(cmd-check)$(check-FORCE)
> >
> >  # Execute command if command has changed or prerequisite(s) are updated.
> >  if_changed = $(if $(if-changed-cond),                                        \
> > --
> > 2.30.2
> >
>


-- 
Best Regards
Masahiro Yamada
