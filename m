Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD6BA3D081E
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 07:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232900AbhGUEcp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Jul 2021 00:32:45 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51943 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232616AbhGUEcn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jul 2021 00:32:43 -0400
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 16L5D055008461;
        Wed, 21 Jul 2021 14:13:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 16L5D055008461
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626844381;
        bh=3xx/KdE6CtGmtNN/L+TIdcy1e+9LgHIW8BuUFAscNmg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GFgnK6g6+r0QRE4QG0eo3yO1zerMqcZ7OckDP+uJIok1uKhmZwMj9J8OGpjZq7jaZ
         trXv/4Qt0CrUp/pVuMJYMm1SdT3T0dUeI3uqxt3BmWx86QY+8OSDkHZv5YcWw2AOjG
         TswefaiTJGK5BSbEu7BzpxALtGHxnT3gsmya58P3FRgjNRIG4lKpwVwVvgm6ysJbSN
         /P4XrGyv0Wifm0WIe+1rK7COcP0O40SwGaDDi20mDqYF0VCCzdCo++ZNjAbr4lWuBG
         Jf1pmGBQaLJ4evRkEaQSS9f9s6iWErepVYxszzEMdA7Ci+FKfdZW8phKakGFtk4AxJ
         5K1MB3f5W97dA==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id o201so1374499pfd.1;
        Tue, 20 Jul 2021 22:13:01 -0700 (PDT)
X-Gm-Message-State: AOAM530CZAue9BwGXPLA1K9r6cYeOUe5n/zA7CNLTjeJZ6UN1XTDXPy4
        Q8uhiVZXxqjFip8OUiDb2VR/MAeZxBC4C9VEDhc=
X-Google-Smtp-Source: ABdhPJzGcRQrkB41PoKaGV95KmcWhuCzOWZ0/Xn6gUMiVmgy3gEPga8Ar0Ai0mdgL7N3y2ZR1YLRh2OGvbhlJKIQseQ=
X-Received: by 2002:a62:1d84:0:b029:304:5af1:65f6 with SMTP id
 d126-20020a621d840000b02903045af165f6mr34202636pfd.80.1626844380426; Tue, 20
 Jul 2021 22:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAKwvOdkvju7heeNpk87brsjkhXHbdKFsUgf63KWhXox9rDkQsA@mail.gmail.com>
 <CAHk-=wiZe2FuiAOwhbKR_VMmFBKekz0NFREm4fvik25PEdcK_g@mail.gmail.com> <CAHk-=whS1zBU=uhDTk2M1LwkqG7AKLsR0_+XG+saY_s2FHZr-A@mail.gmail.com>
In-Reply-To: <CAHk-=whS1zBU=uhDTk2M1LwkqG7AKLsR0_+XG+saY_s2FHZr-A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Jul 2021 14:12:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAROLTHfz7d93xNx-MWj1-dsxD+7=OFGd8z078kdSRigPA@mail.gmail.com>
Message-ID: <CAK7LNAROLTHfz7d93xNx-MWj1-dsxD+7=OFGd8z078kdSRigPA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 21, 2021 at 8:20 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Jul 20, 2021 at 2:54 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > But there are other things that stick around. In particular, I have
> > considered simply using git config variables for that.
> >
> > Something like this in the main Makefile:
>
> A slightly more fleshed-out patch to do this just to see if somebody
> wants to work on something like this.
>
> It really would seem to make it very easy to set up any random build
> environment, and not have to remember it once it's done.
>
> There are probably better ways to do this, I normally try to avoid
> doing Makefile magic, since others have taken it over. Masahiro?


The patch would uglify the Makefile.

If git is not installed, $(shell git config  ...)
will spit an error message, so '2>/dev/null' is needed.

Actually, I believe we should be able to build the kernel
from a source tarball without relying on git in any way.

In fact, we rely on git in some places, for example,
scripts/setlocalversion can add commit hash to the release
string, but I want to minimize the git-dependent code.








>              Linus
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAHk-%3DwhS1zBU%3DuhDTk2M1LwkqG7AKLsR0_%2BXG%2BsaY_s2FHZr-A%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
