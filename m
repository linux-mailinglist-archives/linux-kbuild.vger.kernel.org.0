Return-Path: <linux-kbuild+bounces-6543-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C29DDA82AD2
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 17:43:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A888A154B
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Apr 2025 15:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24E069D2B;
	Wed,  9 Apr 2025 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="J4L4zPC9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C7625D908;
	Wed,  9 Apr 2025 15:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744212512; cv=none; b=TfgvmjvQ6dMHZ+kgp3VMn/3lQPJ/QQ7RBGcdhCrkaeU2JqflnB4fNuWRBONiPru865eHindXOSHm/lazjT2/vhbdkESLxcgRfdlFbhEQlxjSwzdRMAMDX1Xj1yXPA+fHG4DiCMSum70/cxybfOBs/WrJ/Gs7qpV+AgGXM8UzOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744212512; c=relaxed/simple;
	bh=JUpuLDrQsBbAyEnzfTiJdm6RT9EuxKA6WeNKvP7wQk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BzDaZ1HfqtDi5f2v4YwjhYflG2/p7QUlRtv5zSqiwyyjEf6z807DOXOJBML3Usjpet5Phbta6CM3pEkRPafBWBLhV3to8Ti14Gj89y/HUPPR0VxrioxQ/w3Z2ICzBD11SMXLBPxft+m+p3k61ZMV2Mh6pIEbPbexyPRTJWHBu+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=fail (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=J4L4zPC9 reason="signature verification failed"; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B01A040E021E;
	Wed,  9 Apr 2025 15:28:26 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cAyvBZkWXJMb; Wed,  9 Apr 2025 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744212501; bh=dRCxKjyqgnmXYuuFNex01cDz8Wuo2RzWjgAbdXwxoa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4L4zPC9Xu4jZQMftuIBSysMM8dPz5agqKRGPyAUoXgZExu2X7rnrLD/XFbx006dV
	 tHr0BCYIaLmuyUIvl7GhwfREGAWi0vRdGu2lm6PWNJW+0JO9KckDtut2zDVUZuXL4k
	 AK2M8b4I4X3ZDOKf301o0qH7695owWvKG9x9UiPlWym1qMPpb0nEtgwa9jAUuz9cUn
	 xTzZOukStF0gvFVeYimF3QlUaMYU03aneGZdr9tUG3dV+C3bTF9vQc2WXpBSa4yALR
	 TMWgSYDu0xGQG/fAH0G1VQwpWxncPjNPl75hmKDY+eruiPVsb/79eekGuVVARgph4L
	 q5tV7rVnLK463esCAHn54Eqx2vd2CsjJ60JcxBx9/H394VmG4mJI9TNZMsmP6VYltY
	 D27lYE5hnaEfIHPiKJHWd4/80wTWeMmBaBt4KuBpk7ZHEoUXyiDgeRGm6aJpFKjQq5
	 8aCh1Zan3SJiX6C6EFNbeMtqre2eHlW2DjkUX+dcVHUFH8r77S1fjJZPXnGyKqKr1x
	 HxY02+zcymM5u1Oiyw8GqdM/LI/bLCkJg1wQdtICx5A1cwXDpaKlRwX51QXXlIck/C
	 CDAsk/YbEsBv7c4j4ggGjvudDac1d+DbLJNYu7isMjduB+7Y+U4PoHTfNwFzLRDRz0
	 CYwslDqWU9saWz4e7726G7TU=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0DEF740E019F;
	Wed,  9 Apr 2025 15:28:12 +0000 (UTC)
Date: Wed, 9 Apr 2025 17:28:12 +0200
From: Borislav Petkov <bp@alien8.de>
To: Uros Bizjak <ubizjak@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] compiler.h: Avoid the usage of __typeof_unqual__() when
 __GENKSYMS__ is defined
Message-ID: <20250409152812.GGZ_aSDEaLEOVUf3YX@fat_crate.local>
References: <20250404102535.705090-1-ubizjak@gmail.com>
 <CAK7LNATO1RfACvWhHJuLi-FYWMnSn6+Tp67-EZtVWNk+RCSTVQ@mail.gmail.com>
 <CAFULd4bx9BGKo_4kn14rsVr44otpdjpjn_o6=zMp8iu98f9Upg@mail.gmail.com>
 <CAK7LNATnactfA2U0CB2VcoE1eDc+bj=Jjye-Khsc3xG-iZ2XVQ@mail.gmail.com>
 <CAFULd4b25r5wf31DJputSOZhhMTrejQ_3-2P5rpeOL8H=4_mcA@mail.gmail.com>
 <CAK7LNAQVbwnnX5TJLmEShtmUtLCwr=rnZgwX9NoAke+PqzsqiA@mail.gmail.com>
 <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFULd4b2azU-oBOTTXgQ6ahkVeYWHTJrnmJ97vtLm3P6jMOeug@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 06, 2025 at 05:36:13PM +0200, Uros Bizjak wrote:
> On Fri, Apr 4, 2025 at 9:14=E2=80=AFPM Masahiro Yamada <masahiroy@kerne=
l.org> wrote:
> >
> > On Fri, Apr 4, 2025 at 11:37=E2=80=AFPM Uros Bizjak <ubizjak@gmail.co=
m> wrote:
> > >
> > > On Fri, Apr 4, 2025 at 4:06=E2=80=AFPM Masahiro Yamada <masahiroy@k=
ernel.org> wrote:
> > >
> > > > > > > Current version of genksyms doesn't know anything about __t=
ypeof_unqual__()
> > > > > > > operator.  Avoid the usage of __typeof_unqual__() with genk=
syms to prevent
> > > > > > > errors when symbols are versioned.
> > > > > > >
> > > > > > > There were no problems with gendwarfksyms.
> > > > > > >
> > > > > > > Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> > > > > > > Fixes: ac053946f5c40 ("compiler.h: introduce TYPEOF_UNQUAL(=
) macro")
> > > > > > > Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> > > > > > > Closes: https://lore.kernel.org/lkml/81a25a60-de78-43fb-b56=
a-131151e1c035@molgen.mpg.de/
> > > > > > > Cc: Sami Tolvanen <samitolvanen@google.com>
> > > > > > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > > > > > ---
> > > > > >
> > > > > >
> > > > > > Why don't you add it to the genksyms keyword table?
> > > > >
> > > > > It doesn't work, even if I patch it with an even more elaborate=
 patch
> > > > > (attached).
> > > > >
> > > > > I guess some more surgery will be needed, but for now a fallbac=
k works
> > > > > as expected.
> > > > >
> > > > > Uros.
> > > >
> > > > The attached patch looks good to me.
> > >
> > > FAOD - do you refer to the submitted one for compiler.h or to the o=
ne
> > > for scripts/genksyms/keywords.c? (The latter doesn't fix the warnin=
g,
> > > though).
> >
> >
> >
> > You are still seeing the warnings because __typeof_unqual__
> > is not only the issue.
> >
> > Hint:
> >
> > $ make -s KCFLAGS=3D-D__GENKSYMS__  arch/x86/kernel/setup_percpu.i
> > $ grep  'this_cpu_off;'  arch/x86/kernel/setup_percpu.i
>=20
> I see.
>=20
> With my workaround, this_cpu_off is declared as:
>=20
> extern __attribute__((section(".data..percpu" "..hot.."
> "this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;
>=20
> while without workaround, the same variable is declared as:
>=20
> extern __seg_gs __attribute__((section(".data..percpu" "..hot.."
> "this_cpu_off"))) __typeof__(unsigned long) this_cpu_off;
>=20
> It looks that genksyms should be extended to handle (or ignore)
> __seg_gs/__seg_fs named address prefix. Somewhat surprising, because
> genksyms can process:
>=20
> extern __attribute__((section(".data..percpu" "..hot.."
> "const_current_task"))) __typeof__(struct task_struct * const
> __seg_gs) const_current_task
>=20
> without problems.
>=20
> I'm sorry, but I'm not able to extend genksyms with a new keyword by my=
self...

Well, we need a fix here because this fires a lot by now - triggers on my
machines now too.

So either take a fix or we'll need to revert until it is fixed properly.

Thx.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

