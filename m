Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E781C3D7092
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jul 2021 09:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235675AbhG0Ht1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Jul 2021 03:49:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235629AbhG0Ht1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Jul 2021 03:49:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68F27611F0;
        Tue, 27 Jul 2021 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627372167;
        bh=QErEz9cDaZuK4R17Cv2G9FNBxlQuSRnxn4Ssqo8BRJk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KQG8FJrSITBjn7TCNzSXab17Gk0H4rzExwKajpagsiMZa/Vv+1VY7ihcLZt8yyI+r
         scpFBLQ4Ms7KYxNImh33ytcLO/VfGfDE1Z0zZtNnF+wwx+2eZgSNMemKbODzV3cfZ2
         QGd3uCsPtQojKiWAuuzXwafyWv3nzkcVyTbxDmVziCr4LmOqmDT7yvUSozdynetI6s
         reby5Vnzw4FetC5+6wgSmewQHkBSlAMpEWeRr6DCcu70q6JNhy0vsaDEn/JWh0vuto
         iUI0GsnJr2dFo1zhjRh38+Nz/lmnlVzo0q+GsSsUiLr39XKi9/4JA7hSh1LrN81ANg
         bJwOI/dfjigAg==
Received: by mail-wr1-f48.google.com with SMTP id c16so4166686wrp.13;
        Tue, 27 Jul 2021 00:49:27 -0700 (PDT)
X-Gm-Message-State: AOAM5331RuXbYs1cgVipN2ejxv9hQGnZTKtXhNi5xC3ZCzVkQWacLRP4
        /7wAcaqH5SiJAFoqFjI2jhpoRzT92umkP1QVdLo=
X-Google-Smtp-Source: ABdhPJynBy6bPr27KjChBnlz4w4gwJ+lx/To9VdDCaDyrm3SlxUmCp6oNLZ/mnNe1WR1I0AIBIOwC4ci4Iya9zLqf0I=
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr14268753wrr.286.1627372166012;
 Tue, 27 Jul 2021 00:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAK8P3a3=JBQow-Ws6tt81k93aw+OCV5C2CtSWxASkv=iQZPGUw@mail.gmail.com>
 <CAK7LNATLy2F-2zkHm4ENSufBT_o5p=9jc5k1K-xOV8cQf7kKDw@mail.gmail.com>
 <87r1fkizxl.fsf@disp2133> <CAMuHMdVzNFqAdxK+QTp7ub7LyhDL_3GbVMoAah_s3nGuJ5JN_Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVzNFqAdxK+QTp7ub7LyhDL_3GbVMoAah_s3nGuJ5JN_Q@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 27 Jul 2021 09:49:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2kb2Zzgd1wvi4m2fJeHWA9aONXUriEVfnsOfYTquJ3eA@mail.gmail.com>
Message-ID: <CAK8P3a2kb2Zzgd1wvi4m2fJeHWA9aONXUriEVfnsOfYTquJ3eA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 27, 2021 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Jul 26, 2021 at 10:27 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> > Masahiro Yamada <masahiroy@kernel.org> writes:
> > > On Wed, Jul 21, 2021 at 4:58 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > Does anyone have any ideas?
> >
> > Something so we don't have to specify all of these variables on the make
> > command line would be nice.
>
> Just including the main Makefile does not work.
> That's why I went with the more convoluted solution in
> https://lore.kernel.org/linux-kbuild/CAMuHMdXJBqrpzaSNDJgic14ESiHV6cCcb_5E-st6iniXdmm9_g@mail.gmail.com/

This is roughly what I use as well, but it does have the downside that
it confuses
the inner 'make' when you build multiple targets in parallel, e.g.

make -skj30 kernel/ mm/ init/

works with the normal Makefile, but fails spectacularly with my nested
GNUmakefile because it starts multiple sub-processes that each try to
build the same preparation files (I did not try your version).

What I had in mind was to use something like (but not exactly)

-include $(O)/Makefile.cross

to conditionally include another file from the top-level Makefile before
doing anything else.

          Arnd
