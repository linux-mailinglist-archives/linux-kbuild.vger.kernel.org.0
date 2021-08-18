Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A48B33EF943
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 06:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhHREaO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 00:30:14 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30755 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhHREaO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 00:30:14 -0400
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17I4TQ5Y018802;
        Wed, 18 Aug 2021 13:29:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17I4TQ5Y018802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629260966;
        bh=kHlrdkqxRjQoDvpiz9nmAOi6Y1fmh6t3QYrglYwpvXE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E/fkK5/G5wLfUgJDgegk+M6oj/h8/Pp50c7dUdqd5Rn7R+trOegyaZXvKRaeWc0RF
         Sf/TxoA2/9DEz9250sBuogw8R45LNsJ44quLXSUApkjiLTMBPEoTA08tyru1p170z7
         R5z+5IXkqX/YMwgW96OzcUWYMNWLC+WKtvdAJ10on3F6en68QEBeh52daDGlndjumF
         6UOTJQeY8qYQOGZpToSi4WjccHHdTAfFs+t0c6JvC6i67BkNu75Y6N+YXeeu10/UJK
         +5ti5hryG2oUsAba4MZFOpuy7U8eg03eRtJH7QqyJ7c72UDittXGQcnjfrtoLZxFXI
         WpFZxgtYwc+ow==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id n12so1030580plf.4;
        Tue, 17 Aug 2021 21:29:26 -0700 (PDT)
X-Gm-Message-State: AOAM532n03LuCR5u46jY6eA/snS/ijKEMCtH7tgN6/kZqsFBYABflrnY
        hLgj2m/KQgvzzwkPU2hIqJmDPsX8H06fIpNljCw=
X-Google-Smtp-Source: ABdhPJxihjnNOhP1CbhvEkTNiabMGkxoLg+ZCJFf0bt2AZXGYeWTSbAlMePPwWgTXeBSrL3JnLQUZUYk61eVBWCvHvk=
X-Received: by 2002:a17:90a:7384:: with SMTP id j4mr7017433pjg.153.1629260965965;
 Tue, 17 Aug 2021 21:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210814234102.2315551-1-masahiroy@kernel.org> <r3rr2q2-1o70-o012-4ns1-or1qrs665753@syhkavp.arg>
In-Reply-To: <r3rr2q2-1o70-o012-4ns1-or1qrs665753@syhkavp.arg>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 18 Aug 2021 13:28:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbyotYzVDc3b8jPk7nC1dLXjc3oMeytwA5WqzsMBPjgA@mail.gmail.com>
Message-ID: <CAK7LNATbyotYzVDc3b8jPk7nC1dLXjc3oMeytwA5WqzsMBPjgA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 15, 2021 at 12:37 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Sun, 15 Aug 2021, Masahiro Yamada wrote:
>
> > When CONFIG_TRIM_UNUSED_KSYMS is enabled, I see some warnings like this:
> >
> >   nm: arch/x86/entry/vdso/vdso32/note.o: no symbols
> >
> > $NM (both GNU nm and llvm-nm) warns when no symbol is found in the
> > object. Suppress the stderr.
> >
> > Fixes: bbda5ec671d3 ("kbuild: simplify dependency generation for CONFIG_TRIM_UNUSED_KSYMS")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/gen_ksymdeps.sh | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/gen_ksymdeps.sh b/scripts/gen_ksymdeps.sh
> > index 1324986e1362..5493124e8ee6 100755
> > --- a/scripts/gen_ksymdeps.sh
> > +++ b/scripts/gen_ksymdeps.sh
> > @@ -4,7 +4,10 @@
> >  set -e
> >
> >  # List of exported symbols
> > -ksyms=$($NM $1 | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
> > +#
> > +# If the object has no symbol, $NM warns 'no symbols'.
> > +# Suppress the stdout.
> > +ksyms=$($NM $1 2>/dev/null | sed -n 's/.*__ksym_marker_\(.*\)/\1/p' | tr A-Z a-z)
>
> You mean stderr.


My bad - I will fix it in v2.
Thanks.


-- 
Best Regards
Masahiro Yamada
