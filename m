Return-Path: <linux-kbuild+bounces-330-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 371E180D4EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 19:06:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6538C1C208F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 18:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114D94F20D;
	Mon, 11 Dec 2023 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLYPcqxG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CA54F205
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 18:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637F1C433CC;
	Mon, 11 Dec 2023 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702317975;
	bh=BuNKuEYimtFsnC+d0fYe5xVzG5VtzDF/Hpu4INevUFQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dLYPcqxGJ13e6yGw5URBmdy7roCSwGX/5U4K1FIx7qr0KgR27JCRmFJE2W9NuL4HX
	 /M3KJDcGp/3DjlsftKlqBLjF43NTFQ5gx2ptiLsvk7whBKGxAY6jaQew3bNke017s1
	 ioXEsdjC7ttfp0naouoOj3HnRzl1HLIK7uPhlh73bbEV6xN9aH1cwyk57iU/tUjssj
	 IWLR/JE98fRKDBB2RMd/G1ZTFLxaKOydNNHa2bb3ZWhci5zLcSWA3nLxVBwOxZ62bz
	 isnkux1aYH5p3wirzQr1QIgr1V60P4JJXB+sTA+/F1KI0V/o11btRvch5oEQS6ybqj
	 LpaKAq3PJ3rHw==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1eb39505ba4so2871081fac.0;
        Mon, 11 Dec 2023 10:06:15 -0800 (PST)
X-Gm-Message-State: AOJu0Yw8PGP/Z4jGm5O2Bmb5P2MgkyfNoavRs9OiFGh3gkU5j75MgzKT
	oF04bvUZ+tV6PvBhUnKdQy6gfAslyncV4wL7Hr0=
X-Google-Smtp-Source: AGHT+IEnmW3IeOYXl+S2MP/iBK/5qYhRfcerMVGLupCQg6sJo4cyNRBO+W30721hORW+UW6IIsRbodQqtL/y3NtNvjQ=
X-Received: by 2002:a05:6871:7990:b0:1fb:75b:999f with SMTP id
 pb16-20020a056871799000b001fb075b999fmr5873381oac.78.1702317974698; Mon, 11
 Dec 2023 10:06:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208181802.88528-3-leobras@redhat.com> <CAK7LNAQk3Nm53qf95p7yQbSQ_M3phD_n5OMGxFWorGg_4fpQZg@mail.gmail.com>
 <ZXcLEKSBg9Bd1qEu@LeoBras>
In-Reply-To: <ZXcLEKSBg9Bd1qEu@LeoBras>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 12 Dec 2023 03:05:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNARUYBS3Nd83M7uEtPt_GjUGK2jDGEJk9SBBedUKgb911g@mail.gmail.com>
Message-ID: <CAK7LNARUYBS3Nd83M7uEtPt_GjUGK2jDGEJk9SBBedUKgb911g@mail.gmail.com>
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
To: lsoaresp@redhat.com
Cc: Leonardo Bras <leobras@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 10:14=E2=80=AFPM <lsoaresp@redhat.com> wrote:
>
> From: Leonardo Bras <masahiroy@kernel.org>
>
> On Sun, Dec 10, 2023 at 04:13:54AM +0900, Masahiro Yamada wrote:
> > On Sat, Dec 9, 2023 at 3:19=E2=80=AFAM Leonardo Bras <leobras@redhat.co=
m> wrote:
> > >
> > > When reviewing patches, it looks much nicer to have some changes show=
n
> > > before others, which allow better understanding of the patch before t=
he
> > > the .c files reviewing.
> > >
> > > Introduce a default git.orderFile, in order to help developers gettin=
g the
> > > best ordering easier.
> > >
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > >
> > > ---
> > > Changes since RFCv4:
> > > - Added scripts/* into "build system" section
> > > - Added "git-specific" section with this script and .gitignore
> > > - Thanks for this feedback Nicolas!
> > >
> > > Changes since RFCv3:
> > > - Added "*types.h" matching so type headers appear before regular hea=
ders
> > > - Removed line ends ($) in patterns: they previously provided a
> > >   false-positive
> > > - Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
> > >   in any subdirectory
> > >
> > > Changes since RFCv2:
> > > - Fixed licence comment to from /**/ to #
> > > - Fixed filename in how-to comment
> > > - Fix build order: Kconfig -> Kbuild -> Makefile
> > > - Add *.mk extension
> > > - Add line-ends ($) to make sure and get the correct extensions
> > > - Thanks Masahiro Yamada for above suggestions!
> > > - 1 Ack, thanks Randy!
> > >
> > > Changes since RFCv1:
> > > - Added Kconfig* (thanks Randy Dunlap!)
> > > - Changed Kbuild to Kbuild* (improve matching)
> > >
> > >
> > >  scripts/git.orderFile | 39 +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 39 insertions(+)
> > >  create mode 100644 scripts/git.orderFile
> > >
> > > diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> > > new file mode 100644
> > > index 0000000000000..31649ff53d22c
> > > --- /dev/null
> > > +++ b/scripts/git.orderFile
> > > @@ -0,0 +1,39 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +# order file for git, to produce patches which are easier to review
> > > +# by diffing the important stuff like header changes first.
> > > +#
> > > +# one-off usage:
> > > +#   git diff -O scripts/git.orderFile ...
> > > +#
> > > +# add to git config:
> > > +#   git config diff.orderFile scripts/git.orderFile
> > > +#
> > > +
> > > +MAINTAINERS
> > > +
> > > +# Documentation
> > > +Documentation/*
> > > +*.rst
> > > +
> > > +# git-specific
> > > +.gitignore
> > > +scripts/git.orderFile
> >
>
> Hello Masahiro, thanks for the feedback!
>
> >
> >
> > I think scripts/git.orderFile should be part of
> > "scripts/*" below.
> >
> >
> >
> >
> >
> >
> > > +
> > > +# build system
> > > +*Kconfig*
> > > +*Kbuild*
> > > +*Makefile*
> >
> > I do not like this because "foo-Makefile-bar"
> > is not a Makefile, but would match "*Makefile*".
>
> That makes sense.
>
> >
> >
> > If you do not use wildcard at all, 'Makefile'
> > will match to the root-dir and sub-directories.
>
> I tried a quick test here changing an mm/*.c file and mm/Makefile, and th=
e
> above will print the .c file changes first in any situation here, so it
> won't have the desired behavior.



Hmm, you are right.


OK, your suggestion below looks good.


Thanks.






>
> But if we want to achieve the above we can do so with a slight change in
> the suggestion:
>
> >
> >
> > Kconfig
> > */Kconfig*
> > Kbuild
> > Makefile
> */Makefile
> > *.mak
> > *.mk
> > scripts/*
> >
> >
> > may satisfy your needs mostly.
> >
>
> I have tried the following in the Kernel root:
>
> $ find . |grep Makefile |grep -v Makefile$
> ./arch/arm/mach-s3c/Makefile.s3c64xx
> ./arch/mips/Makefile.postlink
> ./arch/powerpc/Makefile.postlink
> ./arch/um/Makefile-os-Linux
> ./arch/um/Makefile-skas
> ./arch/um/scripts/Makefile.rules
> ./arch/x86/Makefile_32.cpu
> ./arch/x86/Makefile.um
> ./arch/x86/Makefile.postlink
> ./arch/riscv/Makefile.postlink
> ./drivers/firmware/efi/libstub/Makefile.zboot
> ./drivers/usb/serial/Makefile-keyspan_pda_fw
> [...]
>
> $ find . |grep Kbuild |grep -v Kbuild$
> ./arch/mips/Kbuild.platforms
> ./scripts/Kbuild.include
>
> Which leads to an honest question:
> Don't we want to show changes on those files before C files, for example?
>
> If so, we need something like:
>
> # build system
> Kconfig*
> */Kconfig*
> Kbuild*
> */Kbuild*
> Makefile*
> */Makefile*
> *.mak
> *.mk
> scripts/*
>
> It would get rid of "foo-Makefile-bar" case but still match
> "Makefile-bar" case, which seems to be used around.
>
> Is that ok?
>
> Thanks!
> Leo
>
>


--=20
Best Regards
Masahiro Yamada

