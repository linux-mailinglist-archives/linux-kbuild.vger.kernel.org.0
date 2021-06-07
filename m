Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9D939D913
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 11:50:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbhFGJwn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 05:52:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:51806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230173AbhFGJwn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 05:52:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28DFD611BE;
        Mon,  7 Jun 2021 09:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623059452;
        bh=JE9YmLu1XcCh2IdiKUhtfnOei95qmgTeBXzlr2OSs5U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DfpEj+7Jk2U92sWwP3npSY4c5Up9o6rqkZHAdIDdytRl6i4N+gby7GRq/smungUVO
         0vhwLULcopfuk/WqYIcGYUBavLNLrRMQ5xooklERJjzzypO/GUcpVOA9KFha9zO3nA
         QPat5j1no34Vch7tvNC+2/PEojw8p0VMLS19KqySapcSkJmoUtaK0zzgVExj7LI3K1
         zAVqGwAYNRPL9J7cbL5gO/8s1twL1RNlWRatR3Jn6LH2jFS006a3hGXspLzFbfjTkl
         S5hA1Rpllhszmu8M46JCoQJGhrlzIB98REL/dT1bXnyFnO/lSG2xoCrg2E8Gfx0QQc
         J6UsQh7JOTJ4w==
Received: by mail-ot1-f47.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso16093040otu.10;
        Mon, 07 Jun 2021 02:50:52 -0700 (PDT)
X-Gm-Message-State: AOAM5307Njk2NkpvZCuOqOHV3qNoJz2XuSALBELwUYyWcxXiPaByrext
        6D61yhCPyY47yKbqpE71xk6pHft9PtIpOCRq1Kk=
X-Google-Smtp-Source: ABdhPJwBcZO3+EJo10iM+TtSxwhwjmCAV3817RPdz1/FU9dXzT2GEqhh9BNYlRt6h/snGjjy0s4uCKxjFa8oCQ/sXzQ=
X-Received: by 2002:a9d:6d0e:: with SMTP id o14mr6760139otp.90.1623059451515;
 Mon, 07 Jun 2021 02:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210607074258.32322-1-mark-pk.tsai@mediatek.com> <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20210607080626.32612-1-mark-pk.tsai@mediatek.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Mon, 7 Jun 2021 11:50:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
Message-ID: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-toolchains@vger.kernel.org
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matt Helsley <mhelsley@vmware.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Sami Tolvanen <samitolvanen@google.com>, yj.chiang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 7 Jun 2021 at 10:06, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> > > On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > >
> > > > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > >
> > > > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > > > >
> > > > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > > > >
> > > > > > Section Headers:
> > > > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > > > >
> > > > >
> > > > > A RELA section's r_info field points to the section to which it
> > > > > applies. This is why in the example above section #65522 points to
> > > > > section #65521. This has nothing to do with the numerical value of
> > > > > SHN_ABS.
> > > >
> > > > If the r_info of RELA section is 65521(0xfff1),
> >
> > Oh sorry, I mean sh_info here.
> >
> > > > find_secsym_ndx() will use it to find the base symbol.
> > > >
> > >
> > > But what does that have to do with the sh_info field of the RELA
> > > section's Elf_Shdr struct? IOW, what is the relevance of section
> > > #65521 here?
> > >
> >
> > So what I mean is the problem occur if the sh_info of a RELA section
> > is #65521.
>
> Actually the problem occur if the sh_info of a RELA section is in
> the special section index range(SHN_LORESERVE ~ SHN_HIRESERVE).
> Maybe I should add a is_shndx_special() to check this like
> scripts/mod/modpost.h did?
>

So if I understand all of this correctly, we are running into a
fundamental issue here, where the linker emits more sections than the
sh_info field can describe, overflowing into the reserved range.

I don't think papering over it like this is going to be maintainable
going forward.



> >
> > > > And in the symbol search loop in find_secsym_ndx(), get_symindex will
> > > > return 0xfff1 if the symbol is in ABS section.
> > > >
> > > > In this case, find_secsym_ndx() will return a absolute symbol as
> > > > base, which won't be relocate, if an ABS symbol is found before the
> > > > real symbol in section 65521.
> > > >
> > >
> > > I see your point here.
> > >
> > > > >
> > > > > > find_secsym_ndx, which use r_info in rela section to find the reference
> >
> > sh_info.
> >
> > > > > > symbol, may take ABS symbol as base.
> > > > > >
> > > > > > Symbol table '.symtab' contains 453285 entries:
> > > > > >    Num:    Value          Size Type    Bind   Vis       Ndx Name
> > > > > >      6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count
> > > > > >
> > > > > > Which cause an invalid address in __mcount_loc.
> > > > > >
> > > > >
> > > > > Could you give a better account of the error you are trying to address?
> > > > >
> > > > > Also, arm64 no longer defines a section_count symbol (since v5.11), so
> > > > > please make sure that the diagnostics of the issue you are addressing
> > > > > are accurate for mainline.
> > > > >
> > > >
> > > > My kernel version is 5.4.61.
> > > > But as I explained, I suppose mainline also have this issue.
> > > >
> > >
> > > Mainline is what we work on. So please base your changes (and your
> > > commit log) on mainline.
> > >
> >
> > I understand it.
> > But the platform I can reproduce the problem is only support to 5.4 LTS now.
> > And port it to the latest mainline kernel have much more work to do, can I just
> > keep this commit log? Or just remove the example I posted in the commit messsage?
> >
> > >
> > > > >
> > > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > > ---
> > > > > >  scripts/recordmcount.h | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > > > > > index f9b19524da11..9b69167fb7ff 100644
> > > > > > --- a/scripts/recordmcount.h
> > > > > > +++ b/scripts/recordmcount.h
> > > > > > @@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
> > > > > >         for (symp = sym0, t = nsym; t; --t, ++symp) {
> > > > > >                 unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
> > > > > >
> > > > > > +               /* avoid absolute symbols */
> > > > > > +               if (symp->st_shndx == SHN_ABS)
> > > > > > +                       continue;
> > > > > > +
> > > > > >                 if (txtndx == get_symindex(symp, symtab, symtab_shndx)
> > > > > >                         /* avoid STB_WEAK */
> > > > > >                     && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
> >
