Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 893ED2FF1EE
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 18:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731791AbhAUR2e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 12:28:34 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:37704 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388426AbhAUR2I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 12:28:08 -0500
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10LHQtq4012691;
        Fri, 22 Jan 2021 02:26:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10LHQtq4012691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611250016;
        bh=o/g6QDTxEay9heg2+A4lesF7Relum8HJDPSF7wKHZiU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Cof4QTbiXebSo/fE21iLkmLX6HTlc5q5IJ+nKF9JYRb9mkX5YgMYYpDlXsArXzBeU
         Z/RUhZy33qeb4DqX352cFfmNCmSpOyQvzLlZIynkCPLArcGvHDI8SuJSlKUiGFtXLG
         wV+o6SBHutlGMgpVx1qQVwIENxCwB8pylPoZ8oo/QAiLhL4rrKf/TGuQhJALkE0zh+
         AWQXEdyG/BKL98+0+52FMTIeKdEo5w1cIt/Y6BXemhpOyNoK6PXzzvrgUv/CO5xQcY
         yOi7QM1qTmt5goukbvelfboUP0RkgqR2B+70bV91Ulx82y8g03HmbwcY4zcv+rK95o
         HRZTIMyHiVS6A==
X-Nifty-SrcIP: [209.85.167.45]
Received: by mail-lf1-f45.google.com with SMTP id q8so3597289lfm.10;
        Thu, 21 Jan 2021 09:26:56 -0800 (PST)
X-Gm-Message-State: AOAM5313de695GlJ83J+5enXLh33/qxXW159MQ8H5BmbVRtCf1iz4tXg
        nU6h0Hv/X9FjOHlXggJGRMeSyU9ICWnUiznP2oo=
X-Google-Smtp-Source: ABdhPJyXMM+E1YlvQyKE1IftMIlUjbhsTwQEOU8dmg8SCdVLqTlOChmpB/jWu0f/YShwXX6g7k5JQ7dYunCzmmo5M90=
X-Received: by 2002:a19:5e5b:: with SMTP id z27mr111567lfi.143.1611250014405;
 Thu, 21 Jan 2021 09:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com> <20210121161640.GA1101379@ubuntu-m3-large-x86>
In-Reply-To: <20210121161640.GA1101379@ubuntu-m3-large-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 22 Jan 2021 02:26:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGR=f6G_QXSgjLCKukELHyT9fg3O3c_UC=PR5Oqv4XDA@mail.gmail.com>
Message-ID: <CAK7LNAQGR=f6G_QXSgjLCKukELHyT9fg3O3c_UC=PR5Oqv4XDA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 22, 2021 at 1:16 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Jan 21, 2021 at 05:01:15PM +0100, Lukas Bulwahn wrote:
> > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > ./scripts/cc-version.sh.
> >
> > Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches    F:    scripts/clang-version.sh
> >
> > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > changes in ./scripts/clang-version.sh; as the file is removed, track
> > changes in ./scripts/cc-version.sh instead now.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210121
> >
> > Masahiro-san, please pick this quick fix-up patch.
>
> Masahiro cannot pick this up because the patch to add clang-version.sh
> to MAINTAINERS is in mmotm.
>
> I think the better solution is for Andrew to drop the current version of
>
> maintainers-add-a-couple-more-files-to-the-clang-llvm-section.patch
>
> and pick up the second one I sent, which allows us to deal with this:
>
> https://lore.kernel.org/lkml/20210114171629.592007-1-natechancellor@gmail.com/


I agree.


> I am not sure it is right for us to maintain cc-version.sh but I am open
> to it if Masahiro agrees.

I am not sure either.


The part in cc-version.sh maintained by Clang folks
will be this single line:

clang_min_version=10.0.1


You can add cc-version.sh to the coverage if you want.

Or, the following line in MAINTAINERS might be
enough to catch the clang version change.


K:      \b(?i:clang|llvm)\b



I will leave up to you guys.



>
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e5d7cf38ec82..aafbea806a82 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4355,8 +4355,8 @@ B:      https://github.com/ClangBuiltLinux/linux/issues
> >  C:   irc://chat.freenode.net/clangbuiltlinux
> >  F:   Documentation/kbuild/llvm.rst
> >  F:   include/linux/compiler-clang.h
> > +F:   scripts/cc-version.sh
> >  F:   scripts/clang-tools/
> > -F:   scripts/clang-version.sh
> >  F:   scripts/lld-version.sh
> >  K:   \b(?i:clang|llvm)\b
> >
> > --
> > 2.17.1
> >
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210121161640.GA1101379%40ubuntu-m3-large-x86.



-- 
Best Regards
Masahiro Yamada
