Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524A03D8534
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jul 2021 03:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233654AbhG1BEv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 21:04:51 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40084 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233118AbhG1BEu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 21:04:50 -0400
X-Greylist: delayed 33857 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Jul 2021 21:04:50 EDT
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 16S14YgX006779;
        Wed, 28 Jul 2021 10:04:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 16S14YgX006779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627434274;
        bh=yDN/9OCKinq2MFj0x4rcClHgXoJJbc1xUOy8iD5RPZU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fSAqCJS9XSgUstk2RU7Vu85Zv0q6GFMJcYYXu9xKGFUItOdeUJ+7X/NQhTA7N2dM7
         kAL65qQkbSvHrZK2NUI/Vywjcd4ioUnBoLCSd5+tN4pwAerMIVAHXM4prmWRenxJHk
         ppX9ouuxoi2dD+86m+jdqlw3x8oBO9YGkhZ7CazIDP5ZN3RHeclKqtkjugBsQZzDi6
         u8h/6LZyd1C9G5q/HOFS+gDEDf+PASlooYwim2UnGW7iIUnsiCMIytFmNL1jla/+JW
         M/NAGggRJ2SA9EdHRxSgmFRvasHCJWTfX1yvnhjwhjJW2gxPX34ysa/imTrs1vM5qg
         us/taG8N5FQSg==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so1975620pjd.0;
        Tue, 27 Jul 2021 18:04:34 -0700 (PDT)
X-Gm-Message-State: AOAM531d5S6RvLrGPDcBtoXlglVMLVNCm3zHViMnIyTdm4AcekIMTgrJ
        pDuvRZJS+tH3NPwNVsXBACHJOQU860NymYmtD2E=
X-Google-Smtp-Source: ABdhPJzgdbOIho3ytX7bJKc52YJ2gk1DFQyIBRpkxje/mwkGDiSkPFyYQQBOTqV3w2MxdEnqsdP0NBwH4XjNuN8kSAI=
X-Received: by 2002:a63:dd51:: with SMTP id g17mr2151312pgj.47.1627434273622;
 Tue, 27 Jul 2021 18:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210727153924.79473-1-masahiroy@kernel.org> <YQAsth0TA3AwtxvK@kroah.com>
In-Reply-To: <YQAsth0TA3AwtxvK@kroah.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 28 Jul 2021 10:03:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQM2WzfHdJhukiaeq=qYtJ7U8UbMZdFWSuAJG86bBVHnA@mail.gmail.com>
Message-ID: <CAK7LNAQM2WzfHdJhukiaeq=qYtJ7U8UbMZdFWSuAJG86bBVHnA@mail.gmail.com>
Subject: Re: [PATCH] scripts: make some scripts executable
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 12:56 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 28, 2021 at 12:39:24AM +0900, Masahiro Yamada wrote:
> > Set the x bit to some scripts to make them directly executable.
> >
> > Especially, scripts/checkdeclares.pl is not hooked by anyone.
> > It should be executable since it is tedious to type
> > 'perl scripts/checkdeclares.pl'.
> >
> > The original patch [1] set the x bit properly, but it was lost when
> > it was merged as commit 21917bded72c ("scripts: a new script for
> > checking duplicate struct declaration").
> >
> > [1] https://lore.kernel.org/lkml/20210401110943.1010796-1-wanjiabing@vivo.com/
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/checkdeclares.pl               | 0
> >  scripts/gcc-plugins/gen-random-seed.sh | 0
> >  scripts/syscallnr.sh                   | 0
> >  scripts/xen-hypercalls.sh              | 0
> >  4 files changed, 0 insertions(+), 0 deletions(-)
> >  mode change 100644 => 100755 scripts/checkdeclares.pl
> >  mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
> >  mode change 100644 => 100755 scripts/syscallnr.sh
> >  mode change 100644 => 100755 scripts/xen-hypercalls.sh
>
> Please no, as other tools (i.e. patch), can not set mode bits, and some
> people still rely on patch in places.
>
> If these need to be called by other parts of the build, we should
> execute them properly, not rely on the mode settings.
>
> thanks,
>
> greg k-h


I believe tools should be executable.

If the x bit were missing in scripts/checkpatch.pl
for example, we would need to run 'perl scripts/checkpatch.pl'
instead of 'scripts/checkpatch.pl'. That is annoying.


Most of the scripts under the scripts/ directory
are already executable, and we rely on that fact.
Some of them are run directly, and I do not hear
from anyone who complains about that.




BTW, my 'patch' command on Ubuntu can handle the
x bit.  Doesn't it work on your 'patch' ?


masahiro@grover:~/x-bit-test$ ls -l test.sh
-rw-rw-r-- 1 masahiro masahiro 7 Jul 28 09:50 test.sh
masahiro@grover:~/x-bit-test$ cat set-x.patch
diff --git a/test.sh b/test.sh
old mode 100644
new mode 100755
masahiro@grover:~/x-bit-test$ patch -p1 < set-x.patch
patching file test.sh
masahiro@grover:~/x-bit-test$ ls -l test.sh
-rwxr-xr-x 1 masahiro masahiro 7 Jul 28 09:51 test.sh



Even if it did not work on somebody's tools,
the diff files are provided for bug-fix
releases (for example, 5.13.x), not the entire source.

Developers (except Andrew Morton) use git
to merge patches like this, so I see no issue
on changing the mode.

-- 
Best Regards
Masahiro Yamada
