Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6A739D9B8
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jun 2021 12:32:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhFGKei (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Jun 2021 06:34:38 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:50358 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230252AbhFGKei (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Jun 2021 06:34:38 -0400
X-UUID: 21e3b4fb671b435886c741f4ab05c21e-20210607
X-UUID: 21e3b4fb671b435886c741f4ab05c21e-20210607
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 742128182; Mon, 07 Jun 2021 18:32:44 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 18:32:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Jun 2021 18:32:42 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <ardb@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-toolchains@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
        <matthias.bgg@gmail.com>, <mhelsley@vmware.com>,
        <rostedt@goodmis.org>, <samitolvanen@google.com>,
        <yj.chiang@mediatek.com>
Subject: Re: [PATCH] recordmcount: avoid using ABS symbol as reference
Date:   Mon, 7 Jun 2021 18:32:42 +0800
Message-ID: <20210607103242.2480-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
References: <CAMj1kXGCoME4Wy4e3FNAjWLY=G56ivHzFTLrXRE0mLtnaBVEDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Mon, 7 Jun 2021 at 10:06, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> >
> > > > On Mon, 7 Jun 2021 at 08:59, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > >
> > > > > > > On Mon, 7 Jun 2021 at 04:42, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
> > > > > > >
> > > > > > > Avoid using ABS symbol, which won't be relocate, as reference.
> > > > > > >
> > > > > > > On arm64 platform, if there's shndx equals SHN_ABS(0xfff1).
> > > > > > >
> > > > > > > Section Headers:
> > > > > > > [Nr]    Name                         Type      Address          Off      Size   ES  Flg Lk     Inf    Al
> > > > > > > [65521] .text.n_tty_receive_buf      PROGBITS  0000000000000000 3cdab520 000054 00  AX  0      0      4
> > > > > > > [65522] .rela.text.n_tty_receive_buf RELA      0000000000000000 3cdab578 000030 18  I   152076 65521  8
> > > > > > >
> > > > > >
> > > > > > A RELA section's r_info field points to the section to which it
> > > > > > applies. This is why in the example above section #65522 points to
> > > > > > section #65521. This has nothing to do with the numerical value of
> > > > > > SHN_ABS.
> > > > >
> > > > > If the r_info of RELA section is 65521(0xfff1),
> > >
> > > Oh sorry, I mean sh_info here.
> > >
> > > > > find_secsym_ndx() will use it to find the base symbol.
> > > > >
> > > >
> > > > But what does that have to do with the sh_info field of the RELA
> > > > section's Elf_Shdr struct? IOW, what is the relevance of section
> > > > #65521 here?
> > > >
> > >
> > > So what I mean is the problem occur if the sh_info of a RELA section
> > > is #65521.
> >
> > Actually the problem occur if the sh_info of a RELA section is in
> > the special section index range(SHN_LORESERVE ~ SHN_HIRESERVE).
> > Maybe I should add a is_shndx_special() to check this like
> > scripts/mod/modpost.h did?
> >
>
> So if I understand all of this correctly, we are running into a
> fundamental issue here, where the linker emits more sections than the
> sh_info field can describe, overflowing into the reserved range.

Actually the problem is about comparing st_shndx and sh_info.

When the st_shndx is larger than SHN_LORESERVE, the linker mark
it as SHN_XINDEX, and get_symindex() will handle it.

But sh_info for a RELA section take the actual shndx which may
be in the reserved range.
So I suppose before compare the sh_info and st_shndx,
we need to do more check in find_secsym_ndx().

>
> I don't think papering over it like this is going to be maintainable
> going forward.
>

Do you have suggestion for how to deal with this problem?

>
>
> > >
> > > > > And in the symbol search loop in find_secsym_ndx(), get_symindex will
> > > > > return 0xfff1 if the symbol is in ABS section.
> > > > >
> > > > > In this case, find_secsym_ndx() will return a absolute symbol as
> > > > > base, which won't be relocate, if an ABS symbol is found before the
> > > > > real symbol in section 65521.
> > > > >
> > > >
> > > > I see your point here.
> > > >
> > > > > >
> > > > > > > find_secsym_ndx, which use r_info in rela section to find the reference
> > >
> > > sh_info.
> > >
> > > > > > > symbol, may take ABS symbol as base.
> > > > > > >
> > > > > > > Symbol table '.symtab' contains 453285 entries:
> > > > > > >    Num:    Value          Size Type    Bind   Vis       Ndx Name
> > > > > > >      6: 0000000000000002     0 NOTYPE  LOCAL  DEFAULT   ABS section_count
> > > > > > >
> > > > > > > Which cause an invalid address in __mcount_loc.
> > > > > > >
> > > > > >
> > > > > > Could you give a better account of the error you are trying to address?
> > > > > >
> > > > > > Also, arm64 no longer defines a section_count symbol (since v5.11), so
> > > > > > please make sure that the diagnostics of the issue you are addressing
> > > > > > are accurate for mainline.
> > > > > >
> > > > >
> > > > > My kernel version is 5.4.61.
> > > > > But as I explained, I suppose mainline also have this issue.
> > > > >
> > > >
> > > > Mainline is what we work on. So please base your changes (and your
> > > > commit log) on mainline.
> > > >
> > >
> > > I understand it.
> > > But the platform I can reproduce the problem is only support to 5.4 LTS now.
> > > And port it to the latest mainline kernel have much more work to do, can I just
> > > keep this commit log? Or just remove the example I posted in the commit messsage?
> > >
> > > >
> > > > > >
> > > > > > > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > > > > > > ---
> > > > > > >  scripts/recordmcount.h | 4 ++++
> > > > > > >  1 file changed, 4 insertions(+)
> > > > > > >
> > > > > > > diff --git a/scripts/recordmcount.h b/scripts/recordmcount.h
> > > > > > > index f9b19524da11..9b69167fb7ff 100644
> > > > > > > --- a/scripts/recordmcount.h
> > > > > > > +++ b/scripts/recordmcount.h
> > > > > > > @@ -526,6 +526,10 @@ static int find_secsym_ndx(unsigned const txtndx,
> > > > > > >         for (symp = sym0, t = nsym; t; --t, ++symp) {
> > > > > > >                 unsigned int const st_bind = ELF_ST_BIND(symp->st_info);
> > > > > > >
> > > > > > > +               /* avoid absolute symbols */
> > > > > > > +               if (symp->st_shndx == SHN_ABS)
> > > > > > > +                       continue;
> > > > > > > +
> > > > > > >                 if (txtndx == get_symindex(symp, symtab, symtab_shndx)
> > > > > > >                         /* avoid STB_WEAK */
> > > > > > >                     && (STB_LOCAL == st_bind || STB_GLOBAL == st_bind)) {
> > >
