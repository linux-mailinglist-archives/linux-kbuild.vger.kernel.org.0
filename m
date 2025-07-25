Return-Path: <linux-kbuild+bounces-8164-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1963B11C98
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 12:37:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D775116C46C
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Jul 2025 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FFF2E0400;
	Fri, 25 Jul 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nhwhZOAc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Azssg3zo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854202DE71E;
	Fri, 25 Jul 2025 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753439800; cv=none; b=IRsajDV3xCX32x8g53M07L5jTsUNDYD+02U8/Crx7VsHvGHfxRCIH/50WvFM2s0FYqNRlymrrt2ygbdqypdjt6cumc2gnP9fl77JRPkSPu8eHW6h5AewnFfIk7IDAtuCToPUEv5aGfgjLwKXkHajQD6jSuMieJpg/KXU8AtmH8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753439800; c=relaxed/simple;
	bh=/Jd08J9EVwiLu3246KvZ8LuOKEUNrkCntG+atu5i7Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJLGQ+sMoDGbIwwa7jwxu51WrcH8PmaxBEIDL0uTF2WaDaYlUTf2yf5XXObrl1SB0n3AHCzQdvHwDY4vCfSSUinAIxwHh4veojFxqObvaetbfMvmIkn92T2yqSQQF5YD15JIM9xZVaPTc1wUMH3n7R3ZxPyaQldEqiQ5O2wJH78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nhwhZOAc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Azssg3zo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 25 Jul 2025 12:36:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753439796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWa6XDwZlrI75pGJEl2FOxaQVgtHaB/1blTqyZ0nVRI=;
	b=nhwhZOAcJ+ZDcPLBedCjJyyS3BB4JP1IdK5mFlQWiOV46SuSAF7yeSKh9ldvnw46kIQ8ND
	CTlKX2Xoq/VGfLdq07OAPvWIc9j649yJ8VSSkt2x9R/AO/rCOPo3MYi/AYw3b4duYU91RU
	rzmhuJdlbvJyAGuvzCs/X6fqVCf6e5qcM2247hQj+sukc7Sj36pCt1bMA6UbXlqrHLsOti
	FbpuO6GkJS6QmzGQV+9ZeV4CmgYclTY2Wd59eTg846NSgdR+n6P3mE7b24w+doctP6PmG5
	yicel8XdJVnCbYsAukxuQKOVdyiO0+5GxW3J01a7SmjqLdgp/lesZAP0UrdXGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753439796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GWa6XDwZlrI75pGJEl2FOxaQVgtHaB/1blTqyZ0nVRI=;
	b=Azssg3zoBERw+p0wPFhhTIjUk5B3/RwZjzSp3dyxeJSednSA8IzlQG3PZRk3OGazInQ4wH
	b0F3v6qFcQm4UyDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH] kbuild: userprogs: use correct linker when mixing clang
 and GNU ld
Message-ID: <20250725122604-44874f95-859c-4c0a-b3b0-14b30e00b796@linutronix.de>
References: <20250724-userprogs-clang-gnu-ld-v1-1-3d3d071e53a7@linutronix.de>
 <20250724231025.GA3620641@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724231025.GA3620641@ax162>

On Thu, Jul 24, 2025 at 04:10:25PM -0700, Nathan Chancellor wrote:
> On Thu, Jul 24, 2025 at 10:32:45AM +0200, Thomas Weiﬂschuh wrote:
> > The userprogs infrastructure does not expect clang being used with GNU ld
> > and in that case uses /usr/bin/ld for linking, not the configured $(LD).
> > This fallback is problematic as it will break when cross-compiling.
> > Mixing clang and GNU ld is used for example when building for SPARC64,
> > as ld.lld is not sufficient; see Documentation/kbuild/llvm.rst.
> > 
> > Relax the check around --ld-path so it gets used for all linkers.
> > 
> > Fixes: dfc1b168a8c4 ("kbuild: userprogs: use correct lld when linking through clang")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > ---
> > Nathan, you originally proposed the check for $(CONFIG_LD_IS_LLD) [0],
> > could you take a look at this?
> 
> I would expect this to be okay but I have not explicitly tested it. I
> had not considered the case of GNU ld being used since aside from
> sparc64, there is not another architecture that supports clang but not
> ld.lld.

FWIW some architectures use GNU ld implicitly with clang because they also link
through $(CC) but do not use --ld-path. One example is UML, where the vDSO and
vmlinux are linked this way. But linking vmlinux of UML with ld.lld will
require changes to at least the linker script. Something for the ClangBuiltLinux
TODO? There were more examples, but I don't remember them right now.

Longterm --ld-path should probably be added to the global KBUILD_CFLAGS, too.

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index c09766beb7eff4780574682b8ea44475fc0a5188..e300c6546c845c300edb5f0033719963c7da8f9b 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1134,7 +1134,7 @@ KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD
> >  KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
> 
> Does KBUILD_USERCFLAGS respect LLVM_IAS? sparc64 does not use the
> integrated assembler yet (as far as I am aware) so I think we probably
> need to filter '--prefix=' and '-fno-integrated-as' to avoid further
> issues with assembling?

No, it isn't respected. On the other hand I didn't yet run into any issues.
Do we want to fix it proactively?

> >  # userspace programs are linked via the compiler, use the correct linker
> > -ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
> > +ifneq ($(CONFIG_CC_IS_CLANG),)
> 
> At this point, I think this can just become
> 
>   ifdef CONFIG_CC_IS_CLANG

Absolutetly. The existing conditional above this hunk uses the ifneq
pattern, so I tried to keep it consistent.
But the one above uses plain ifdef again...
Personally I don't care one way or another.

> >  KBUILD_USERLDFLAGS += --ld-path=$(LD)
> >  endif
> >  
> > 
> > ---
> > base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> > change-id: 20250723-userprogs-clang-gnu-ld-7a1c16fc852d
> > 
> > Best regards,
> > -- 
> > Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > 

