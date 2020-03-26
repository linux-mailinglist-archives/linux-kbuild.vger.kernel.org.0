Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE8891938F2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 07:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgCZGtu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 02:49:50 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22701 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727869AbgCZGtu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 02:49:50 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02Q6nXBS030299;
        Thu, 26 Mar 2020 15:49:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02Q6nXBS030299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585205374;
        bh=yJri4nG4GdtQpimGA+3UpQX1sQISx5nzCRM7PAOAuwY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jT7Bi9Da0EzCLH/o9xLiT8xvAZULpzWNIMVZvw4484HvYgbiIO7K02JEFQaxhUXCN
         jOoXLfoGtygn3Ch+onLoE3AUAh1Dn9LUzAmOP8yJ2Vu6A2Kd281W3h/8EI8Mfzn+97
         Lu4z6Xc2D/tiQMk27LEitULFHXQRERUJQYm+oYNZYL++V5i4jHrqtgYrH0LFGS+9ev
         Rsj6lMUP46aeHUcoTS/C+/tmR9hj9Auc2F02XOBwWZ5/RRUCYzDu/hLFqrXKxOl6VD
         HGHlbr6rZuLXOBaex0hsdKj501V4SDVL9n2GmVhrlgFhPsKWiwfvBbqXE007YXhjWm
         OdG8JXOPvVcMw==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id s10so3169542vsi.9;
        Wed, 25 Mar 2020 23:49:34 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3LEqcwOXzU2Bss48KNEUpucjw3KdwNqf/wG4i6PmjXd31Sxdn/
        sTn0+gonkrG+8snYt8bAjjTDBuQJf4FC5PpHiSc=
X-Google-Smtp-Source: ADFU+vs89T9hOkuWHMz+1BIobf1TLDKTGR9RZQc/Y/Ci/C0MWWZ0/xu9K46o1tb+UA+2xgUpob3pyVu4keWIot/9odQ=
X-Received: by 2002:a67:6542:: with SMTP id z63mr3012217vsb.179.1585205372803;
 Wed, 25 Mar 2020 23:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-2-masahiroy@kernel.org>
 <CAKwvOd=AXnAjoa0iOhPc4S49ZpDDX9BYB-BZQc=6Z0dygVYLPA@mail.gmail.com>
In-Reply-To: <CAKwvOd=AXnAjoa0iOhPc4S49ZpDDX9BYB-BZQc=6Z0dygVYLPA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 26 Mar 2020 15:48:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNATXz=x7M-HOfWLf1fc_km5qBYa5u1i3Bj30C7aoJPGjSA@mail.gmail.com>
Message-ID: <CAK7LNATXz=x7M-HOfWLf1fc_km5qBYa5u1i3Bj30C7aoJPGjSA@mail.gmail.com>
Subject: Re: [PATCH 01/16] lib/raid6/test: fix build on distros whose /bin/sh
 is not bash
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        NeilBrown <neilb@suse.de>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 25, 2020 at 1:36 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Mar 24, 2020 at 1:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > You can test raid6 library code from user-space, like this:
> >
> >   $ cd lib/raid6/test
> >   $ make
> >
> > The command in $(shell ...) function is evaluated by /bin/sh by default.
> > (or, you can change the default shell by setting 'SHELL' in Makefile)
> >
> > Currently '>&/dev/null' is used to sink both stdout and stderr. Because
> > this code is bash-ism, it only works when /bin/sh is a symbolic link to
> > bash (this is the case on RHEL etc.)
> >
> > This does not work on Ubuntu where /bin/sh is a symbolic link to dash.
> >
> > I see lots of
> >
> >   /bin/sh: 1: Syntax error: Bad fd number
> >
> > and
> >
> >   warning "your version of binutils lacks ... support"
> >
> > Replace it with portable '>/dev/null 2>&1'.
> >
> > Fixes: 4f8c55c5ad49 ("lib/raid6: build proper files on corresponding arch")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> > ---
> >
> >  lib/raid6/test/Makefile | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
> > index 3ab8720aa2f8..b9e6c3648be1 100644
> > --- a/lib/raid6/test/Makefile
> > +++ b/lib/raid6/test/Makefile
> > @@ -35,13 +35,13 @@ endif
> >  ifeq ($(IS_X86),yes)
> >          OBJS   += mmx.o sse1.o sse2.o avx2.o recov_ssse3.o recov_avx2.o avx512.o recov_avx512.o
> >          CFLAGS += $(shell echo "pshufb %xmm0, %xmm0" |         \
> > -                    gcc -c -x assembler - >&/dev/null &&       \
> > +                    gcc -c -x assembler - >/dev/null 2>&1 &&   \
> >                      rm ./-.o && echo -DCONFIG_AS_SSSE3=1)
> >          CFLAGS += $(shell echo "vpbroadcastb %xmm0, %ymm1" |   \
> > -                    gcc -c -x assembler - >&/dev/null &&       \
> > +                    gcc -c -x assembler - >/dev/null 2>&1 &&   \
> >                      rm ./-.o && echo -DCONFIG_AS_AVX2=1)
> >         CFLAGS += $(shell echo "vpmovm2b %k1, %zmm5" |          \
> > -                   gcc -c -x assembler - >&/dev/null &&        \
> > +                   gcc -c -x assembler - >/dev/null 2>&1 &&    \
>
> These should all use $(CC) rather than hardcode gcc.


Right, I had noticed this.

We often fall between
"let's fix this too while we are here"
vs
"do not do multiple things in a single patch"


If we replace gcc -> $(CC),
we also need to touch line 51 for consistency:

       gcc -c -x c - >/dev/null && rm ./-.o && echo yes)

..., which is not our main interest now.

So, I leave it to a follow-up patch
if somebody has interest in it.


-- 
Best Regards
Masahiro Yamada
