Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0FC32EEE1
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 16:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhCEPdA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 10:33:00 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60571 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhCEPcd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 10:32:33 -0500
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 125FWErB020473;
        Sat, 6 Mar 2021 00:32:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 125FWErB020473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614958335;
        bh=5HGUtSQp4zdfofgIfM14OVxH7gKujR8p0/j9RGJsnCE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EEiLqv6/y6o9ESbPto9zaOSNh1jjfx+NqK2WAcdewLH79v9Ld+TLvr6wcCKqz69Xn
         E7eAQLaLxTEWMumF47EOCjRp+xJey01AsLL0MtAj5Y+YQ+/XILme1Ji6Q2D9Z/r70L
         4iaW6R5pIYLCVVYBXjKGDRYwRfsZJ/Y0aUG2gfFEnyNIcUjYSyFX4TzgwwdI0wxnRL
         ORt31NfFyfBNEHfL1JRzAlQtkNvKBzdoLX7rVDWeCRIdA7JtlEIea+X/Ou+OXU4YFq
         vdIXoGHlXKtwDaxB0siL3oIqCFfl9bVtSb15U/eFi1WJHjz+5Ha01RSzzsf+RmDTX+
         19xAcmMqJTEpw==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id cl21-20020a17090af695b02900c61ac0f0e9so2274967pjb.1;
        Fri, 05 Mar 2021 07:32:14 -0800 (PST)
X-Gm-Message-State: AOAM53073at6tA+RRMxRv7JZn78KxQdf4vbzQJy7eDK42trXzuMCTl8O
        gjBYwy3J5ZAJPXd3t2WAL1Q1JhwsOjTAasdxXNY=
X-Google-Smtp-Source: ABdhPJxd+afZFPuXcwj0Tgmr4EKvTdwpPx2qhvoB1lpDpulv2q24xPM4wTn9c8WXyx0hMPDemrWFKElw/P1kq+aEyoQ=
X-Received: by 2002:a17:90a:dc08:: with SMTP id i8mr10423104pjv.153.1614958333959;
 Fri, 05 Mar 2021 07:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble> <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble> <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble> <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble> <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
 <20210304150812.rzya7ewmerwhe4m4@treble> <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
 <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 6 Mar 2021 00:31:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARDEwyjDj3u=8Y176TehU9FD548LFTrqi3AmBR6jrnA_Q@mail.gmail.com>
Message-ID: <CAK7LNARDEwyjDj3u=8Y176TehU9FD548LFTrqi3AmBR6jrnA_Q@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 5, 2021 at 4:13 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Mar 4, 2021 at 7:36 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > All the kernel-space objects are rebuilt
> > when the compiler is upgraded.
>
> I very much NAK'ed that one. Why did that go in?


When the compiler is upgraded, all objects
should be rebuilt by the new compiler,
- this keeps Kbuild deterministic,
irrespective of whether it is a fresh build,
or incremental build.


If we do not force the full rebuild,
the banner at boot time is no point.

[    0.000000] Linux version 5.8.0-44-generic (buildd@lgw01-amd64-039)
(gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0, GNU ld (GNU Binutils for
Ubuntu) 2.35.1) #50-Ubuntu SMP Tue Feb 9 06:29:41 UTC 2021 (Ubuntu
5.8.0-44.50-generic 5.8.18)


It claims it was built by
gcc (Ubuntu 10.2.0-13ubuntu1) 10.2.0
but we would never know if it is true
for whole objects.
Some of them might have been compiled by
an older compiler.




> Or maybe I NAK'ed another version of it (I think the one I NAK'ed was
> from Josh), and didn't realize that there were multiple ones.
>
> > Linus complaint about GCC plugins not being rebuilt.
>
> Yes, and that was a separate complaint and not at all tied to the other objects.
>
> Gcc plugins aren't kernel object files at all. They are very much like
> dynamically loadable libraries to gcc itself.
>
>                Linus



-- 
Best Regards
Masahiro Yamada
