Return-Path: <linux-kbuild+bounces-8194-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F95B12A1B
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 12:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CA857A41A9
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 10:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B5E223BF91;
	Sat, 26 Jul 2025 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or2hqRl9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E4341A8F;
	Sat, 26 Jul 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753526099; cv=none; b=dMVdc+Wv67Z8GbXoou4NzBXzOWhQiwQbygkRw7k/ZepYTFce1c04J/VJWvG9SaB7MCXLNOnEGGUFtU6tyZCjSu8YyMlham40YVUGs99YmJAOb48WvYhKtMwgCbZohcaKCo8Evv1D/KcfauArLIM3Erm31IvttY6UgIzOhPKjyXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753526099; c=relaxed/simple;
	bh=xNGjY7zU23UbtC8TnC551ilI9jqtO3VI+NHk902JKk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ls2MOforLvESRY9CfhKN+TuFzFPZIQY6t9Ym5Zq1NpnYq4cpinLvihfZ3cK0v0rAZT7ixQ9oJwxQsx87Y5Wb2dw17dCZhE1VvuI4eQQUkIvuXLDaVZLOuaODlVbEWOD8ss6iDkRyZLsgSaCw/bhsbv1/gxsXhO2/WDAHFYIZ/dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Or2hqRl9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747C5C4CEED;
	Sat, 26 Jul 2025 10:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753526098;
	bh=xNGjY7zU23UbtC8TnC551ilI9jqtO3VI+NHk902JKk8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Or2hqRl9yZcKsa1GSuKwG7BerSt7Rd4Zf8Tp/qLlf+KGedU8GL2+ntNaIp+RMsSCA
	 FQ50f6SJZKSdjgfhWMBDHSedu1JTXEdopqu5L16Tmv/KBQ+QROsvQkaHDpCl/RxbaJ
	 naGAlzDzZxcEMKMjZDr5+41aVASnG2bV868r9efecPaLyAePSmmAaejMqmfDe/Aquo
	 q2RQWQJ7QE5gpPBwKTifxDf/rm78SfTojgRdh1ZqGzYGBWCBrFCTXTH6ExnCS1Lvtr
	 OFth5edf4xvZhtoW+aBDTgC8uep2a8mIgi0/tJtqMFsWZjV8cgTpPLb9YlBwSTtT5h
	 EPKVTLCKceAlQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553dceb342fso2329165e87.0;
        Sat, 26 Jul 2025 03:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQNKydWskCoB0oDOkh1sqCqBf9PNUfR1pi6mYr//3NS+qKY1EzuE7xcTU7AiKoPZ3OalfXDDi8RXLqfKE=@vger.kernel.org, AJvYcCViR6SIRY9XUZseOrbS5pEvYsFd7s9CB5sHn6jtXI0srevO8LYSVmA2hl1eXvF7HO4z2d+cKoYi@vger.kernel.org, AJvYcCXDx0pgZyi6o611Ebqppc5l2P446zV1DG1mor2bRGnu8ZqDxNQ3idXV5kxcjOHhcegJZfaDrUdbP2coMQzg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4qUTEF+XAka3niO4MDKBFYL/6m5OdSg6F3wRiSWir6FdrD8M4
	mp07lA8lDl0TQXQ/Q53rDn1S6eFm93zwsDBhs5Cs818FVN7RjOc0B3ldlRz10zn5ez8+xjgC0ro
	AIDmJhJ9MdDTPXeLiZwCjweIl5VREy5Y=
X-Google-Smtp-Source: AGHT+IF1qeYoFT4OjYGATbmZIjWNXodWICSJVv+du8pwTXC6Gp5H8S9vF4KVq2EeZo0NuT5CuJeu/dQr1g5dUXrLrOw=
X-Received: by 2002:a05:6512:3d15:b0:553:ad9b:cfb1 with SMTP id
 2adb3069b0e04-55b5f3d1378mr1321534e87.9.1753526097121; Sat, 26 Jul 2025
 03:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724-userprogs-clang-gnu-ld-v1-1-3d3d071e53a7@linutronix.de>
 <20250724231025.GA3620641@ax162> <20250725122604-44874f95-859c-4c0a-b3b0-14b30e00b796@linutronix.de>
In-Reply-To: <20250725122604-44874f95-859c-4c0a-b3b0-14b30e00b796@linutronix.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 26 Jul 2025 19:34:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARp77d+rti7j=1ABbreTxYbVsEOHqQCurkt0t+JzKUKvg@mail.gmail.com>
X-Gm-Features: Ac12FXyIJ1uldhwd9j611VlxM1KojWYI0LWyidbubjvuMvwAijjyoU2rtNbzTEA
Message-ID: <CAK7LNARp77d+rti7j=1ABbreTxYbVsEOHqQCurkt0t+JzKUKvg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: userprogs: use correct linker when mixing clang
 and GNU ld
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 7:36=E2=80=AFPM Thomas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de> wrote:
>
> On Thu, Jul 24, 2025 at 04:10:25PM -0700, Nathan Chancellor wrote:
> > On Thu, Jul 24, 2025 at 10:32:45AM +0200, Thomas Wei=C3=9Fschuh wrote:
> > > The userprogs infrastructure does not expect clang being used with GN=
U ld
> > > and in that case uses /usr/bin/ld for linking, not the configured $(L=
D).
> > > This fallback is problematic as it will break when cross-compiling.
> > > Mixing clang and GNU ld is used for example when building for SPARC64=
,
> > > as ld.lld is not sufficient; see Documentation/kbuild/llvm.rst.
> > >
> > > Relax the check around --ld-path so it gets used for all linkers.
> > >
> > > Fixes: dfc1b168a8c4 ("kbuild: userprogs: use correct lld when linking=
 through clang")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de=
>
> > > ---
> > > Nathan, you originally proposed the check for $(CONFIG_LD_IS_LLD) [0]=
,
> > > could you take a look at this?
> >
> > I would expect this to be okay but I have not explicitly tested it. I
> > had not considered the case of GNU ld being used since aside from
> > sparc64, there is not another architecture that supports clang but not
> > ld.lld.
>
> FWIW some architectures use GNU ld implicitly with clang because they als=
o link
> through $(CC) but do not use --ld-path. One example is UML, where the vDS=
O and
> vmlinux are linked this way. But linking vmlinux of UML with ld.lld will
> require changes to at least the linker script. Something for the ClangBui=
ltLinux
> TODO? There were more examples, but I don't remember them right now.
>
> Longterm --ld-path should probably be added to the global KBUILD_CFLAGS, =
too.
>
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Thanks!
>
> > > ---
> > >  Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index c09766beb7eff4780574682b8ea44475fc0a5188..e300c6546c845c300edb5=
f0033719963c7da8f9b 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1134,7 +1134,7 @@ KBUILD_USERCFLAGS  +=3D $(filter -m32 -m64 --ta=
rget=3D%, $(KBUILD_CPPFLAGS) $(KBUILD
> > >  KBUILD_USERLDFLAGS +=3D $(filter -m32 -m64 --target=3D%, $(KBUILD_CP=
PFLAGS) $(KBUILD_CFLAGS))
> >
> > Does KBUILD_USERCFLAGS respect LLVM_IAS? sparc64 does not use the
> > integrated assembler yet (as far as I am aware) so I think we probably
> > need to filter '--prefix=3D' and '-fno-integrated-as' to avoid further
> > issues with assembling?
>
> No, it isn't respected. On the other hand I didn't yet run into any issue=
s.
> Do we want to fix it proactively?
>
> > >  # userspace programs are linked via the compiler, use the correct li=
nker
> > > -ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
> > > +ifneq ($(CONFIG_CC_IS_CLANG),)
> >
> > At this point, I think this can just become
> >
> >   ifdef CONFIG_CC_IS_CLANG
>
> Absolutetly. The existing conditional above this hunk uses the ifneq
> pattern, so I tried to keep it consistent.
> But the one above uses plain ifdef again...
> Personally I don't care one way or another.


Could you use "ifdef CONFIG_CC_IS_CLANG" please?



--=20
Best Regards
Masahiro Yamada

