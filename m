Return-Path: <linux-kbuild+bounces-331-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B96A380DDD1
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 23:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D70C61C20DBE
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Dec 2023 22:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359D855774;
	Mon, 11 Dec 2023 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5uaWQmv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90D89C
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 14:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702332252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FCxm2ZNk4xG6rdSANJGBUV8Z7ODrKWPtn4AqES4irEA=;
	b=K5uaWQmvfNDeOfyyS03m06gIuq73TKyC6kwWSJbTSBCZCguXXSk3O2x9SNqlT5sE/W3/wk
	T61Ki9A0WVxEBnccpUzv15abwGT+0RTfJTFzfjKtSM2qoR0VtXzoPIjKWLIEhOYSbn5uUK
	xHWt1OZXUqgMd+8hFG5fQPi44fe2wAE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-9IMhtF6nMsSxE_24GDI_lQ-1; Mon, 11 Dec 2023 17:04:10 -0500
X-MC-Unique: 9IMhtF6nMsSxE_24GDI_lQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d03b873765so34613205ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Dec 2023 14:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702332249; x=1702937049;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FCxm2ZNk4xG6rdSANJGBUV8Z7ODrKWPtn4AqES4irEA=;
        b=DUo6vUAWr/sgLthQ/MqhgUpEZrx2aYsxgr5Zv8S4bu7A+A8UhCqJVUKgbqltpYatVR
         GxdvbU05wjg4QP9IPaObH5x2kiaHYwGny54IDTkk7Ka3jz0dULKocXdbk9hZiB2zb2E/
         L4sgnqAq9XSmoUp0QxFIBJFqmBChcgThsPL7Ing675cKr/ptMKjdsrUe5g4spm5P1nCQ
         Q9H6sPemNefZH/nWEVbhBBY3NzFARGf0uEO6I/AqvwnucJuPiWx3UygWEngOk0hrCV+7
         +dRP+BUfBHBkIOwvOwTdKgazFpBDpAVMuCUwBmPGR+Ed6s9/Q8yRLJgXpuBQ3QyiInTV
         nL1A==
X-Gm-Message-State: AOJu0YzUTt9L1qIUb8FnUAHR/d4YO8aFNDJVftdQf6Xc9mbWt4b5Q77x
	OnvobkVcJQvW0hBsr4p/PZ1zUcdzdDRkItOc0A+TbeeQU21RJC2UsjqXIvt4rELDMz119mz5VE8
	JQTUN852omfzEjVfhTMs00lz6
X-Received: by 2002:a17:903:22ca:b0:1d0:700b:3f7b with SMTP id y10-20020a17090322ca00b001d0700b3f7bmr7952127plg.53.1702332249187;
        Mon, 11 Dec 2023 14:04:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEukaZOlkPqR1TXFO85wGFwXddVUVGVhPviVyN2FuBWvTB40MsESc1PRlfh8WNSzgylWaLcog==
X-Received: by 2002:a17:903:22ca:b0:1d0:700b:3f7b with SMTP id y10-20020a17090322ca00b001d0700b3f7bmr7952106plg.53.1702332248841;
        Mon, 11 Dec 2023 14:04:08 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:3102:945e:6f76:fb73:6512])
        by smtp.gmail.com with ESMTPSA id c21-20020a170902b69500b001d1d1ef8be6sm7133768pls.267.2023.12.11.14.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 14:04:08 -0800 (PST)
From: lsoaresp@redhat.com
X-Google-Original-From: masahiroy@kernel.org
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	lsoaresp@redhat.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v5 1/1] scripts: Introduce a default git.orderFile
Date: Mon, 11 Dec 2023 19:03:50 -0300
Message-ID: <ZXeHRmTIMmIqeNxn@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAK7LNARUYBS3Nd83M7uEtPt_GjUGK2jDGEJk9SBBedUKgb911g@mail.gmail.com>
References: <20231208181802.88528-3-leobras@redhat.com> <CAK7LNAQk3Nm53qf95p7yQbSQ_M3phD_n5OMGxFWorGg_4fpQZg@mail.gmail.com> <ZXcLEKSBg9Bd1qEu@LeoBras> <CAK7LNARUYBS3Nd83M7uEtPt_GjUGK2jDGEJk9SBBedUKgb911g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

From: Leonardo Bras <leobras@redhat.com>

On Tue, Dec 12, 2023 at 03:05:38AM +0900, Masahiro Yamada wrote:
> On Mon, Dec 11, 2023 at 10:14 PM <lsoaresp@redhat.com> wrote:
> >
> > From: Leonardo Bras <masahiroy@kernel.org>
> >
> > On Sun, Dec 10, 2023 at 04:13:54AM +0900, Masahiro Yamada wrote:
> > > On Sat, Dec 9, 2023 at 3:19 AM Leonardo Bras <leobras@redhat.com> wrote:
> > > >
> > > > When reviewing patches, it looks much nicer to have some changes shown
> > > > before others, which allow better understanding of the patch before the
> > > > the .c files reviewing.
> > > >
> > > > Introduce a default git.orderFile, in order to help developers getting the
> > > > best ordering easier.
> > > >
> > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > > >
> > > > ---
> > > > Changes since RFCv4:
> > > > - Added scripts/* into "build system" section
> > > > - Added "git-specific" section with this script and .gitignore
> > > > - Thanks for this feedback Nicolas!
> > > >
> > > > Changes since RFCv3:
> > > > - Added "*types.h" matching so type headers appear before regular headers
> > > > - Removed line ends ($) in patterns: they previously provided a
> > > >   false-positive
> > > > - Fixed build patterns to allow matching Kconfig, Kbuild & Makefile
> > > >   in any subdirectory
> > > >
> > > > Changes since RFCv2:
> > > > - Fixed licence comment to from /**/ to #
> > > > - Fixed filename in how-to comment
> > > > - Fix build order: Kconfig -> Kbuild -> Makefile
> > > > - Add *.mk extension
> > > > - Add line-ends ($) to make sure and get the correct extensions
> > > > - Thanks Masahiro Yamada for above suggestions!
> > > > - 1 Ack, thanks Randy!
> > > >
> > > > Changes since RFCv1:
> > > > - Added Kconfig* (thanks Randy Dunlap!)
> > > > - Changed Kbuild to Kbuild* (improve matching)
> > > >
> > > >
> > > >  scripts/git.orderFile | 39 +++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 39 insertions(+)
> > > >  create mode 100644 scripts/git.orderFile
> > > >
> > > > diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> > > > new file mode 100644
> > > > index 0000000000000..31649ff53d22c
> > > > --- /dev/null
> > > > +++ b/scripts/git.orderFile
> > > > @@ -0,0 +1,39 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +# order file for git, to produce patches which are easier to review
> > > > +# by diffing the important stuff like header changes first.
> > > > +#
> > > > +# one-off usage:
> > > > +#   git diff -O scripts/git.orderFile ...
> > > > +#
> > > > +# add to git config:
> > > > +#   git config diff.orderFile scripts/git.orderFile
> > > > +#
> > > > +
> > > > +MAINTAINERS
> > > > +
> > > > +# Documentation
> > > > +Documentation/*
> > > > +*.rst
> > > > +
> > > > +# git-specific
> > > > +.gitignore
> > > > +scripts/git.orderFile
> > >
> >
> > Hello Masahiro, thanks for the feedback!
> >
> > >
> > >
> > > I think scripts/git.orderFile should be part of
> > > "scripts/*" below.
> > >
> > >
> > >
> > >
> > >
> > >
> > > > +
> > > > +# build system
> > > > +*Kconfig*
> > > > +*Kbuild*
> > > > +*Makefile*
> > >
> > > I do not like this because "foo-Makefile-bar"
> > > is not a Makefile, but would match "*Makefile*".
> >
> > That makes sense.
> >
> > >
> > >
> > > If you do not use wildcard at all, 'Makefile'
> > > will match to the root-dir and sub-directories.
> >
> > I tried a quick test here changing an mm/*.c file and mm/Makefile, and the
> > above will print the .c file changes first in any situation here, so it
> > won't have the desired behavior.
> 
> 
> 
> Hmm, you are right.
> 
> 
> OK, your suggestion below looks good.
> 
> 
> Thanks.

Thank you for this feedback!

I will send a v6 shortly.

Thank you!
Leo

> 
> 
> 
> 
> 
> 
> >
> > But if we want to achieve the above we can do so with a slight change in
> > the suggestion:
> >
> > >
> >>
> > > Kconfig
> > > */Kconfig*
> > > Kbuild
> > > Makefile
> > */Makefile
> > > *.mak
> > > *.mk
> > > scripts/*
> > >
> > >
> > > may satisfy your needs mostly.
> > >
> >
> > I have tried the following in the Kernel root:
> >
> > $ find . |grep Makefile |grep -v Makefile$
> > ./arch/arm/mach-s3c/Makefile.s3c64xx
> > ./arch/mips/Makefile.postlink
> > ./arch/powerpc/Makefile.postlink
> > ./arch/um/Makefile-os-Linux
> > ./arch/um/Makefile-skas
> > ./arch/um/scripts/Makefile.rules
> > ./arch/x86/Makefile_32.cpu
> > ./arch/x86/Makefile.um
> > ./arch/x86/Makefile.postlink
> > ./arch/riscv/Makefile.postlink
> > ./drivers/firmware/efi/libstub/Makefile.zboot
> > ./drivers/usb/serial/Makefile-keyspan_pda_fw
> > [...]
> >
> > $ find . |grep Kbuild |grep -v Kbuild$
> > ./arch/mips/Kbuild.platforms
> > ./scripts/Kbuild.include
> >
> > Which leads to an honest question:
> > Don't we want to show changes on those files before C files, for example?
> >
> > If so, we need something like:
> >
> > # build system
> > Kconfig*
> > */Kconfig*
> > Kbuild*
> > */Kbuild*
> > Makefile*
> > */Makefile*
> > *.mak
> > *.mk
> > scripts/*
> >
> > It would get rid of "foo-Makefile-bar" case but still match
> > "Makefile-bar" case, which seems to be used around.
> >
> > Is that ok?
> >
> > Thanks!
> > Leo
> >
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 


