Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678081662D2
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2020 17:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgBTQ35 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Feb 2020 11:29:57 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39293 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgBTQ35 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 11:29:57 -0500
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 01KGTiiE007836;
        Fri, 21 Feb 2020 01:29:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01KGTiiE007836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582216185;
        bh=4JUspooC+NZxkKFY0nYPp/gx6LLrbQ4SDK0Yfj3PlZ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kx+c9ZAtqOKgbKaQvaRWRc6sfstjEFfXNZjzqArSIfoFWs3mPtsyQj7vFMg5d+Np3
         DlCGQUocakiYIYTYemrRBU7oNQCRy1vvABXuNJXBTPMMXdY45FlfqH68MMMNRJClzW
         VcWbnyB2bie/AxK8UW4zjOUVWSfhNJTtgmB5X5HVjk1Zww0nL3m+v8c6yMMjJpqFMk
         vVeLtNWv//KEURh0J5fDmnlUTn9bzmnfwroizoOR9WJWYrCBjF6K2NcKIcm5FBa6vm
         gqJRCJBjPr9McvrBAEqUCKelqOSvtJOLFKMDsuzozBTLVhzLuFO84G260Wykx8RrQi
         86TszsXy/1P2g==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id p2so1779017uao.9;
        Thu, 20 Feb 2020 08:29:44 -0800 (PST)
X-Gm-Message-State: APjAAAU2DiFh0/D9X15mgUIxogsFoIXIVHKI0MAG9YZ03r9apg6wS29U
        JuGSieBercgc2hJL1cG5k4GH+FIxPsG9rzLg7X0=
X-Google-Smtp-Source: APXvYqxpbu2HWc1p2HMTZMytzt9kyUBZzySB7o969hlLofl2kTAqxkM+xDa2q4wwUr0lXUyHK49/B9YBgWtsUuc7sSw=
X-Received: by 2002:ab0:2881:: with SMTP id s1mr16564013uap.95.1582216183578;
 Thu, 20 Feb 2020 08:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20200215075020.10426-1-masahiroy@kernel.org>
In-Reply-To: <20200215075020.10426-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 21 Feb 2020 01:29:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCoR_KrVA-7+HOTkgFSx-hZbboYbtMPfN1GdookT8DUw@mail.gmail.com>
Message-ID: <CAK7LNASCoR_KrVA-7+HOTkgFSx-hZbboYbtMPfN1GdookT8DUw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove the owner check in mkcompile_h
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 15, 2020 at 4:50 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This reverts a very old commit, which dates back to the pre-git era:
>
> |commit 5d1cfb5b12f72145d30ba0f53c9f238144b122b8
> |Author: Kai Germaschewski <kai@tp1.ruhr-uni-bochum.de>
> |Date:   Sat Jul 27 02:53:19 2002 -0500
> |
> |    kbuild: Fix compiling/installing as different users
> |
> |    "make bzImage && sudo make install" had the problem that during
> |    the "sudo make install" the build system would notice that the information
> |    in include/linux/compile.h is not accurate (it says "compiled by <user>",
> |    but we are root), thus causing compile.h to be updated and leading to
> |    some recompiles.
> |
> |    We now only update "compile.h" if the current user is the owner of
> |    include/linux/autoconf.h, i.e. the user who did the "make *config". So the
> |    above sequence will correctly state "compiled by <user>".
> |
> |diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> |index 6313db96172..cd956380978 100755
> |--- a/scripts/mkcompile_h
> |+++ b/scripts/mkcompile_h
> |@@ -3,6 +3,17 @@ ARCH=$2
> | SMP=$3
> | CC=$4
> |
> |+# If compile.h exists already and we don't own autoconf.h
> |+# (i.e. we're not the same user who did make *config), don't
> |+# modify compile.h
> |+# So "sudo make install" won't change the "compiled by <user>"
> |+# do "compiled by root"
> |+
> |+if [ -r $TARGET -a ! -O ../include/linux/autoconf.h ]; then
> |+  echo ' (not modified)'
> |+  exit 0
> |+fi
> |+
> | if [ -r ../.version ]; then
> |   VERSION=`cat ../.version`
> | else
>
> The 'make bzImage && sudo make install' problem no longer happens
> because commit 1648e4f80506 ("x86, kbuild: make "make install" not
> depend on vmlinux") fixed the root cause.
>
> Commit 19514fc665ff ("arm, kbuild: make "make install" not depend on
> vmlinux") fixed the similar issue on ARM, with detailed explanation.
>
> So, the rule is that the installation targets should never trigger
> the builds of any build artifact. By following it, this check is
> unneeded.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Applied to linux-kbuild.


> ---
>
>  scripts/mkcompile_h | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 3a5a4b210c86..3ff26e5b2eac 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -10,17 +10,6 @@ CC=$6
>
>  vecho() { [ "${quiet}" = "silent_" ] || echo "$@" ; }
>
> -# If compile.h exists already and we don't own autoconf.h
> -# (i.e. we're not the same user who did make *config), don't
> -# modify compile.h
> -# So "sudo make install" won't change the "compiled by <user>"
> -# do "compiled by root"
> -
> -if [ -r $TARGET -a ! -O include/generated/autoconf.h ]; then
> -  vecho "  SKIPPED $TARGET"
> -  exit 0
> -fi
> -
>  # Do not expand names
>  set -f
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
