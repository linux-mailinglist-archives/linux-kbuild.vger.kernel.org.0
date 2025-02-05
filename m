Return-Path: <linux-kbuild+bounces-5633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3AEA29336
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 16:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56C3A1670F4
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 15:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1A41D86F6;
	Wed,  5 Feb 2025 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NVd0UY3+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3041D8A12;
	Wed,  5 Feb 2025 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767679; cv=none; b=UujXmq60OdRd8MrylUKcLm7+A9yIjginzMFMQaRBul+xGVuOroUNIBVxbH7dM+qfGPL7BXOQBGJqkfY2RHmKfRsg9LQGY4n+hiqnquyCtc2afXFAL491SpjvS/U7WPO6DnLI1B0v2CqKnWUEZZujpKYGk7GJ7XcV00t8e0MOT1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767679; c=relaxed/simple;
	bh=jI6mFqZXpNqzB11L+dcLlQT43GiVzIhoAANt38o1ASM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLPQZomDXylChbRNOuKsa8cMKRQL1mAM1wDlrPQuYrqjsEQ0ZZ9g1KAN8KDJ4FX8yNWOfcJmFv05oxO24duJgTYLNP8RKLIJHgscU3ooO+H3/V2izk4Sy18SYq9taM17JsWyIUEiXgDnqUN535Ps7AHs11fHlifMJ+sZMYnu62Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NVd0UY3+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF12C4AF0B;
	Wed,  5 Feb 2025 15:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738767679;
	bh=jI6mFqZXpNqzB11L+dcLlQT43GiVzIhoAANt38o1ASM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NVd0UY3+SrUhP8KgM3yRrdrtn1tWhqHD/cFREgSGQlPF/3Ys0S/cLD0aCArpKzhRz
	 xb6NGh384cqts0ey+Lxdu8p/V5qbNY/eF8qxJvHvym3bAKwMddKcE6ya2BTexqPaHh
	 tfMG5lXUapCDPpetS4iNgFTdKtGmgwEpcnIzSrVKLAcoTIOEgv+BOWPE4uuUyVDhQY
	 dTf1rsfRRdObkpx3aeHmoA4rwjMpeoWbup+MV1VDlejZu5sKVJQeFoPsw5HP30Xvth
	 q/7pyfODXPaJLIWxdQ6j+hk2Turhsj/Gqnw2xYCJ8OMn5mi4mB58+tm3Em2IKQAuJk
	 Ra2LKVKwiSsaA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30036310158so51296061fa.0;
        Wed, 05 Feb 2025 07:01:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVF91waEY/C2vZWsrDa/Psf4374Bk+2Css5WIEtDUF2r5UEpzPthwh8C/Ey7Do/rndPpl3gq1Nf/w1xZ10=@vger.kernel.org, AJvYcCWtGaEKYWbsUUyGd++H3NBCptfeOCQlybuA359aW352yc/OfPFm4QKXxb8lLKYN93ZHmphPeAPr1Q8aWpZ8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7N94j9PCgEYtpQ/LrHG3l3EQFdwL73ayJNHyAHJXZFaScPFnv
	EKHSGBjkQLp5cXziuMgE09OZwG3HUuczUXQFI848ROdxv5+UyZeEMitUK9CG4Zd6nyxShE7uYLx
	A7zsZVTNqRDD86aSwo9Gwk3I7Eyc=
X-Google-Smtp-Source: AGHT+IHBb3ZeLGy1cAwth78pTANNFx2IuQ0g1ShCCMr1SOasPwPJY8/Avdj1h8ZJ4TvLE0Z8RjKtTm/R4F0rwync+j4=
X-Received: by 2002:a05:651c:154f:b0:300:33b1:f0e7 with SMTP id
 38308e7fff4ca-307cf31470cmr12662021fa.10.1738767677437; Wed, 05 Feb 2025
 07:01:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162> <Z5xzkwwZAWRRLCdj@ghost> <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
 <Z51BpVEkmVCg7gTX@ghost> <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
 <Z6JcgeDmt63MupyW@ghost>
In-Reply-To: <Z6JcgeDmt63MupyW@ghost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Feb 2025 00:00:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5RVtm078rLFJNxQwPf+1VH+zf12dQJ1Xh-Wc4_qFGTw@mail.gmail.com>
X-Gm-Features: AWEUYZmvR9oI4SL8wPTQkoUvSwnAMEleZny79O5YuUFBaIkgVaSJ3j7KI_kBm2s
Message-ID: <CAK7LNAS5RVtm078rLFJNxQwPf+1VH+zf12dQJ1Xh-Wc4_qFGTw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 3:29=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.co=
m> wrote:
>
> On Tue, Feb 04, 2025 at 01:04:26PM +0900, Masahiro Yamada wrote:
> > On Sat, Feb 1, 2025 at 6:33=E2=80=AFAM Charlie Jenkins <charlie@rivosin=
c.com> wrote:
> > >
> > > On Sat, Feb 01, 2025 at 12:10:02AM +0900, Masahiro Yamada wrote:
> > > > On Fri, Jan 31, 2025 at 3:54=E2=80=AFPM Charlie Jenkins <charlie@ri=
vosinc.com> wrote:
> > > > >
> > > > > On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote=
:
> > > > > > On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote=
:
> > > > > > > On riscv, kernel modules end up with a significant number of =
local
> > > > > > > symbols. This becomes apparent when compiling modules with de=
bug symbols
> > > > > > > enabled. Using amdgpu.ko as an example of a large module, on =
riscv the
> > > > > > > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > > > > > > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping)=
, 21MB
> > > > > > > (--strip-debug), and 20MB (--strip-unneeded).
> > > > > > >
> > > > > > > Use --strip-unneeded instead of --strip-debug to strip module=
s so
> > > > > > > decrease the size of the resulting modules. This is particula=
rly
> > > > > > > relevant for riscv, but also marginally aids other architectu=
res.
> > > > > > >
> > > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > > >
> > > > > > Is there any sort of regression risk with this patch? If so, an=
other
> > > > > > option may be to give another level to INSTALL_MOD_STRIP like 2=
 so that
> > > > > > INSTALL_MOD_STRIP=3D1 continues to behave as before but people =
can easily
> > > > > > opt into this option. No strong opinion because I am not sure b=
ut was
> > > > > > not sure if it was considered.
> > > > >
> > > > > I do not believe this would cause regressions. The description on=
 gnu
> > > > > strip is:
> > > > >
> > > > > "Remove all symbols that are not needed for relocation processing=
 in
> > > > > addition to debugging symbols and sections stripped by --strip-de=
bug."
> > > > >
> > > > > The description on llvm-strip is:
> > > > >
> > > > > "Remove from the output all local or undefined symbols that are n=
ot
> > > > > required by relocations. Also remove all debug sections."
> > > > >
> > > > > gnu strip --strip-unneeded strips slightly more aggressively but =
it does
> > > > > not appear this causes any issues.
> > > > >
> > > > > >
> > > > > > Regardless:
> > > > > >
> > > > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > > >
> > > > > Thanks!
> > > > >
> > > >
> > > >
> > > > It is true --strip-unneeded drops a lot of compiler-generated symbo=
ls, but
> > > > it also drops real symbols that originate in the source code.
> > > >
> > > > So, this would give user-visible changes for kallsyms at least.
> > >
> > > Adding INSTALL_MOD_STRIP=3D"--strip-unneeded" would be sufficient for
> > > riscv. However, this has the downside that riscv will require differe=
nt
> > > flags than other architectures to get reasonably sized modules.
> >
> > You can use INSTALL_MOD_STRIP=3D--strip-unneeded for all architecture i=
f you like.
> >
> > I assume this is a riscv issue. Specifically, riscv gcc.
> > With LLVM=3D1, I see much smaller riscv modules using INSTALL_MOD_STRIP=
=3D1.
> >
> > --strip-unneeded is needlessly aggressive for other architectures,
> > and I do not see a good reason to change the default.
>
> Yes it is primarily an issue with riscv GCC. I was hoping for something
> more standardized so that other people using riscv GCC wouldn't
> encounter this. Would it be reasonable to add this flag by default only
> for the riscv architecture, or do you think it's just better to leave it
> up to the user's choice?

The latter.

INSTALL_MOD_STRIP=3D1 passes --strip-debug.
This is clearly documented in Documentation/kbuild/makefiles.rst
and it has worked like that for many years, with no exception.

If users want it to work differently, the flexibility is already there.

If INSTALL_MOD_STRIP=3D1 worked differently, silently only for riscv,
I would regard it as insane behavior.


--=20
Best Regards
Masahiro Yamada

