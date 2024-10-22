Return-Path: <linux-kbuild+bounces-4237-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CDC9AB68B
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 21:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1F7DB21E08
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Oct 2024 19:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492C31CB30C;
	Tue, 22 Oct 2024 19:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NsUgvTTC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192591CB309;
	Tue, 22 Oct 2024 19:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729624464; cv=none; b=cE+xGAtnYf1depKaFrF5WEfxYPQO860WT9AUQdf9jbPFe8NT8UAHdLR+q0OqmguOveW6R9PUgOH2BblcYUF8pt0DqjkcgEUOnrX3w5lY+OxsWANstrGTlwh1i3ZV7mkUXmPZc3/FN3AFglDICIXUkgqdRNm6FxORUitQwbT6IUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729624464; c=relaxed/simple;
	bh=uHUamMLNZya/Dg5wH7xYKJbw/Ck5LzicPdJXaoU8low=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GUcmblApth9uv/twETTEVL9lKuc8l7q/x5TMfVBn+llHOGPca4IzJdB/3EzSIEGqfillaVi1R33lrQsS+KB4opwcjNDz+n/7ybINRt1mQemoRht5qq7O+qmSBfQqu7/zOHQjlUL/lviM/G8F+vWsve5aj2LkOqggXxA+0DUUmxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NsUgvTTC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D0CC4CEE8;
	Tue, 22 Oct 2024 19:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729624463;
	bh=uHUamMLNZya/Dg5wH7xYKJbw/Ck5LzicPdJXaoU8low=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NsUgvTTCHLbANbl+TT5iIgdKG1GIHJkja5034hLOhbs6BXQKCfY/rkBc+xptGU/MK
	 C/NCk1PuS4BpO7eBg8rYxB/IcDNwqtSDqVXahGUt50HRalpkqpQe1MoRnfcxFQneVI
	 lBbBQetDgbaj30vDd9qphqVKUh/3/zTHl9mvo2RBic121oo+L2Ut4B/CVc40Fud/nJ
	 rvMud6q7Z/93qBBGogO6OTb+I+pZamDY9/6Qnt9C4ZrjIlbTPHFnUIYYZ99Xdm+boI
	 Lh8gUVLBPXHXB9bhJ40Uied6K4mrNoXSMVMhWYF1iVDnJjsAwZG1vr4UCLbaf+ed1f
	 c3qed+BxQJshA==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539fbbadf83so7936555e87.0;
        Tue, 22 Oct 2024 12:14:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1prG18t+Jz+9cJSXBAvph3q8+moSFMq0ujpABWUZjQ3e2ArVoY1r9mO7p+mY192n+IVFERFAkh4ACnDvp@vger.kernel.org, AJvYcCVUqvqS0bysBAPNPAaUupPPRki/hmBvNPWzuSIB49JbysIe2pmfOoSgkoIXcBjBmjfxOYg5xtH3M0hp3bA=@vger.kernel.org, AJvYcCWzI281aukvP37KjEkhtIoOOg4rSsVuC/YysvoVPAbvQyxcbHFHidudZgp0RqabMitg4XbNTAgpecSoVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEoF7KQsR+ldFDVkeIZCyd3t3+sbdVRfispSNJ15qCrUyx+MUt
	Ewgw8hfIE4KTWi78EBGW4KJr8km0n9kujZFzKEfy5HNAxLTsQ+ppRidgvrL/x5w3dymuTM+NYAX
	uz8rALyiG/0rD2VDT2HRzwoLtGwM=
X-Google-Smtp-Source: AGHT+IG8GFGPMnQ0zL12TLGQaMyKF6buZv4x4/vPq9J6jmYsFg+ueGY9PqEVyfuEQIGDLomCDJcErvFiJY70CZ1EL6E=
X-Received: by 2002:a05:6512:b8f:b0:539:f4c1:71d3 with SMTP id
 2adb3069b0e04-53b13a04029mr2197034e87.29.1729624462430; Tue, 22 Oct 2024
 12:14:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-sparc-cflags-v2-0-259407e6eb5f@protonmail.com> <20241021201657.GA898643@thelio-3990X>
In-Reply-To: <20241021201657.GA898643@thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 23 Oct 2024 04:13:45 +0900
X-Gmail-Original-Message-ID: <CAK7LNASaCqbOXaw2AhEuXCwt8M9dwbX=GthHL8XzbenOhGpe8g@mail.gmail.com>
Message-ID: <CAK7LNASaCqbOXaw2AhEuXCwt8M9dwbX=GthHL8XzbenOhGpe8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] sparc/build: Rework CFLAGS for clang compatibility
To: Nathan Chancellor <nathan@kernel.org>
Cc: Koakuma <koachan@protonmail.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, glaubitz@physik.fu-berlin.de, 
	Nicolas Schier <nicolas@fjasle.eu>, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 5:17=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Andreas,
>
> On Wed, Jul 17, 2024 at 11:10:14PM +0700, Koakuma wrote:
> > This changes the CFLAGS for building the SPARC kernel so that it can be
> > built with clang, as a follow up from the discussion in this thread:
> >
> > https://lore.kernel.org/lkml/JAYB7uS-EdLABTR4iWZdtFOVa5MvlKosIrD_cKTzge=
ozCOGRM7lhxeLigFB1g3exX445I_W5VKB-tAzl2_G1zCVJRQjp67ODfsSqiZWOZ9o=3D@proton=
mail.com/T/#u
> ...
> > Building with these changes still result in a working kernel,
> > at least for Sun T5120, Oracle T4-1, and qemu virtual machines.
> >
> > On the LLVM side, the effort for building Linux/SPARC is tracked here:
> > https://github.com/llvm/llvm-project/issues/40792
> >
> > Signed-off-by: Koakuma <koachan@protonmail.com>
> > ---
> > Changes in v2:
> > - Remove the -mv8plus change; it will be handled on clang side:
> >   https://github.com/llvm/llvm-project/pull/98713
> > - Add CLANG_TARGET_FLAGS as suggested in v1 review.
> > - Link to v1: https://lore.kernel.org/r/20240620-sparc-cflags-v1-1-bba7=
d0ff7d42@protonmail.com
> >
> > ---
> > Koakuma (2):
> >       sparc/build: Remove all usage of -fcall-used* flags
> >       sparc/build: Add SPARC target flags for compiling with clang
> >
> >  arch/sparc/Makefile      | 4 ++--
> >  arch/sparc/vdso/Makefile | 2 +-
> >  scripts/Makefile.clang   | 1 +
> >  3 files changed, 4 insertions(+), 3 deletions(-)
>
> Would you be able to help move this series [1] and its companion patch
> for the vDSO [2] along to Linus for 6.13? If you are not able to for
> whatever reason but the changes look reasonable to you, would you be
> able to provide an Ack so it can be chauffeured by someone else, such as
> Masahiro/Kbuild or Andrew/-mm?
>
> For the record, I retested these three changes on top of 6.12-rc4, where
> they still apply cleanly. Now that the LLVM PR linked above (98713) has
> been merged into LLVM main, a clang built straight from llvm-project.git
> can build the kernel with this series (I tested at dca43a1c82f1).
>
> [1]: https://lore.kernel.org/all/20240717-sparc-cflags-v2-0-259407e6eb5f@=
protonmail.com/
> [2]: https://lore.kernel.org/all/20240808-sparc-shr64-v2-1-fd18f1b2cea9@p=
rotonmail.com/
>
> Cheers,
> Nathan


2/2 should update the "Supported Architectures"
of Documentation/kbuild/llvm.rst if this is adding a new architecture suppo=
rt.




--
Best Regards
Masahiro Yamada

