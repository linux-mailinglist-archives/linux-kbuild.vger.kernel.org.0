Return-Path: <linux-kbuild+bounces-3471-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB39705EB
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 11:03:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 278FE1F21F0C
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 09:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45277136344;
	Sun,  8 Sep 2024 09:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="msrOKWhQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025D856B8C;
	Sun,  8 Sep 2024 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725786224; cv=none; b=Zl0/zGtOOZV6f+w0lzqSKlD8QPIrVKeOXuKhoXhxjo7Oh+6FjKkyWRFBDlGqc+47lnAmw9YXDWm6r7NrgoTGHyG08UGmOE8KcaZRIvNBWZ89+bcp0zmKjhSIpWwnQJHsrjmQKN6NNu2IeX74SASjacyitgogwdbvVnJ7zXmBPPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725786224; c=relaxed/simple;
	bh=iaWBGRY0Ga/QyUiWnGcCNwe6GvY+ter/ioZNDc3NI98=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asbCa9rj+5t3QscoLXMTgRUWigwXTWnVEz5yeecmAmfNEy33HPqvzryUaKmanS2XuqkPsPSFEAFaF5WveGiJshWnAGZ/6MjtVHL7sAKqCWoSV/s8vENKJ5D8JewDglzw3QtXCPiALTnW142SRp7x079sTRKRVoEHEwIzY9mV3wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=msrOKWhQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B215C4CEC3;
	Sun,  8 Sep 2024 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725786223;
	bh=iaWBGRY0Ga/QyUiWnGcCNwe6GvY+ter/ioZNDc3NI98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=msrOKWhQM0NPDWGVtAJ5zBEdnKCnebFP9yaFEL1mSerelkJzG94ySzSfD6m0E4ojc
	 kjMQh/ag+VyC/d780XoBD3PFZknFPAaFuYrxlcv/7ehW/GnvHaXFX6vSxvK6izDxeT
	 1aT8e43zs2q3ex2vaR4U5q7VCLRR17De16EZEcUEMrm6e/Ihnzg7IC+Z3iUYdB/LSl
	 oDcnllCDJdMTn71NrJDIl+KUsuiipPjrCpjpyr+ARjQTJ57aC6uYZR+FfbtZC+MKA/
	 lRKaWi8C3AchITgoKamTtMqoTINB1JW/Ckv5nWk919r8jMsGBxedp0p7u2Dy37tp1T
	 Gwnf0KlvbKv3Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1snDpa-00AcmB-1V;
	Sun, 08 Sep 2024 10:03:38 +0100
Date: Sun, 08 Sep 2024 10:03:36 +0100
Message-ID: <86cylev7o7.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: "Daniel Gomez (Samsung)" <d+samsung@kruces.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,	da.gomez@samsung.com,	Nathan
 Chancellor <nathan@kernel.org>,	Nicolas Schier <nicolas@fjasle.eu>,	Lucas
 De Marchi <lucas.demarchi@intel.com>,	Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>,	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Maxime Ripard
 <mripard@kernel.org>,	Thomas Zimmermann <tzimmermann@suse.de>,	David Airlie
 <airlied@gmail.com>,	William Hubbs <w.d.hubbs@gmail.com>,	Chris Brannon
 <chris@the-brannons.com>,	Kirk Reiser <kirk@reisers.ca>,	Samuel Thibault
 <samuel.thibault@ens-lyon.org>,	Paul Moore <paul@paul-moore.com>,	Stephen
 Smalley <stephen.smalley.work@gmail.com>,	Ondrej Mosnacek
 <omosnace@redhat.com>,	Catalin Marinas <catalin.marinas@arm.com>,	Will
 Deacon <will@kernel.org>,	Oliver Upton <oliver.upton@linux.dev>,	James
 Morse <james.morse@arm.com>,	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,	Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,	Jiri Slaby <jirislaby@kernel.org>,	Nick
 Desaulniers <ndesaulniers@google.com>,	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,	Simona Vetter
 <simona.vetter@ffwll.ch>,	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,	speakup@linux-speakup.org,
	selinux@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,	linux-serial@vger.kernel.org,	llvm@lists.linux.dev,
	Finn Behrens <me@kloenk.dev>,	gost.dev@samsung.com
Subject: Re: [PATCH v2 8/8] Documentation: add howto build in macos
In-Reply-To: <CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
References: <20240906-macos-build-support-v2-0-06beff418848@samsung.com>
	<20240906-macos-build-support-v2-8-06beff418848@samsung.com>
	<CAK7LNASpWSXbjF_7n0MhosNism=BpvHOnKsa344RPM_wmC9dGA@mail.gmail.com>
	<CABj0suBQCc8=0tLng=OWW=K1hjFuLFZWhbjsqHtz2FzZt4i0sw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: d+samsung@kruces.com, masahiroy@kernel.org, da.gomez@samsung.com, nathan@kernel.org, nicolas@fjasle.eu, lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, w.d.hubbs@gmail.com, chris@the-brannons.com, kirk@reisers.ca, samuel.thibault@ens-lyon.org, paul@paul-moore.com, stephen.smalley.work@gmail.com, omosnace@redhat.com, catalin.marinas@arm.com, will@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, simona.vetter@ffwll.ch, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, speakup@linux-speakup.org, selinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-serial@vger
 .kernel.org, llvm@lists.linux.dev, me@kloenk.dev, gost.dev@samsung.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On Sat, 07 Sep 2024 10:32:20 +0100,
"Daniel Gomez (Samsung)" <d+samsung@kruces.com> wrote:
>=20
> On Sat, Sep 7, 2024 at 10:33=E2=80=AFAM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Fri, Sep 6, 2024 at 8:01=E2=80=AFPM Daniel Gomez via B4 Relay
> > <devnull+da.gomez.samsung.com@kernel.org> wrote:
> > >
> > > From: Daniel Gomez <da.gomez@samsung.com>
> > >
> > > Add documentation under kbuild/llvm to inform about the experimental
> > > support for building the Linux kernel in macOS hosts environments.
> > >
> > > Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
> >
> >
> > Instead, you can add this instruction to:
> >
> > https://github.com/bee-headers/homebrew-bee-headers/blob/main/README.md
>=20
> Sure, that can be done as well. But the effort here is to have this
> integrated. So, I think documentation should be in-tree.

I think this ship sailed the moment you ended-up with an external
dependency.

Having looked at this series (and in particular patch #4 which falls
under my remit), I can't help but think that the whole thing should
simply live as a wrapper around the pristine build system instead of
hacking things inside of it. You already pull external dependencies
(the include files). Just add a script that sets things up
(environment variables that already exist) and calls 'make' in the
kernel tree.

I also dislike that this is forcing "native" developers to cater for
an operating system they are unlikely to have access to. If I break
this hack tomorrow by adding a new dependency that MacOS doesn't
provide, how do I fix it? Should I drop my changes on the floor?

As an alternative, and since you already have to create a special
file-system to contain your kernel tree, you may as well run Linux in
a VM, which I am told works pretty well (QEMU supports HVF, and there
are plenty of corporate-friendly alternatives). This would solve your
problem once and for all.

Please don't take the above the wrong way. I'm sympathetic to what you
are trying to do. But this is IMO going in the wrong direction.

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.

