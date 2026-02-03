Return-Path: <linux-kbuild+bounces-10988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFTxHWmdgWlwHwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10988-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 08:02:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E6789D5854
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 08:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0151300D71E
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 07:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EB238F955;
	Tue,  3 Feb 2026 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Y6X/tVqK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rMCKswJm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4C372B2B;
	Tue,  3 Feb 2026 07:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770102119; cv=none; b=d5s2e+vCDtCller/aofERKOmTl+EQUR5ZW8PbjXhh766qG44nvdvvmcJOqNovWEnAGLLqoogWrjNMwZcM1nF2vpeUkf5qeEuVtAxqcAMUB+BRwiCVhG07xgXj2rK7wju3DLmfnbQimoiMCl92W6YF5VUZPZAHF+cLC2BCPGaPcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770102119; c=relaxed/simple;
	bh=mgh/39skWYNypmbrN18qR4syp6oXdyNc2fm2CcaBap8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elrggwkY8BNdQv0Z4CiaKGueoQz5m1WQe7rgTR2ZsmWkgqI64jtDX6cRUg63ba33Y7hFDHPK2Z8TyxI69o1rDpBJYWAiPwvT7AhC/VbbX2Qr8oGLvC6Ely1mXC54+/RU8OBK/wGPtURskceCfRnOxb/ajQviJxjxvq31r6kEgC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Y6X/tVqK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rMCKswJm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 3 Feb 2026 08:01:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770102115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVK0dROhNrON4b+0PmAq1JrLEYoLB9gGhDZiNFwxyAg=;
	b=Y6X/tVqKR1/RuAYcnkRutTFb137noBD2s8ZHmWJkI1ERnB8pVbP2JqgeEi7ypQGchzyTj1
	113ct5tt+d5wvtnTybDcdMyRIMu24+RqQcTDbf1qX6tx9Naj2Xmq+T+lFdbiJqycvCIfXg
	PPx/qgZdXpOGALs0jRzosJqXQvb2Ohgev+MGo7px7AXjLCKHROH+Vl3c4C1GB5OtiYirec
	QLKlK36RHrFICe9HCSrr0Fzv53DrdTr+Nm5NV10S7AdufTBd1ygibdvql0Mm5d8F1B6RT5
	tWfTUMWQ0o6d63+lkuNRDQj7i+A5l9gzE3dZdExLp/Vg18EyaSYAOyt/Cgf3Hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770102115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JVK0dROhNrON4b+0PmAq1JrLEYoLB9gGhDZiNFwxyAg=;
	b=rMCKswJmZv+FpshaDrpPyLa5JjQOPUcUxyBtKqrQySL1DnMzvwr2H7Vts1yEM4YbPv4qjy
	um+3HZnTRasIDYDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Naman Jain <namjain@linux.microsoft.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Kees Cook <kees@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
Message-ID: <20260203074853-7e380585-f7d6-47e7-94b1-cf16bbfb7a08@linutronix.de>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
 <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
 <6eadf05f-21bf-47d7-abd8-e4694a21e6da@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6eadf05f-21bf-47d7-abd8-e4694a21e6da@linux.microsoft.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10988-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,goodmis.org,vger.kernel.org,lists.infradead.org,linux.microsoft.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,reproducible-builds.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E6789D5854
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 11:58:11AM +0530, Naman Jain wrote:
> On 2/2/2026 7:45 PM, Thomas Weißschuh wrote:
> > Hi Naman,
> > 
> > On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
> > > Build ID hashes include file paths, so building the same source from
> > > different directories produces different binaries. This breaks
> > > reproducible builds.
> > > 
> > > Add KBUILD_BUILD_ID variable (default: sha1) to allow overriding:
> > > 
> > >      make KBUILD_BUILD_ID=none
> > > 
> > > The variable is exported to VDSO Makefiles which also include a
> > > fallback default for standalone invocation.
> > > 
> > > Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
> > > ---
> > > Hi,
> > > Sending this change for RFC, as it is quite possible that this is a
> > > generic problem and I may be missing something.
> > > 
> > > I am trying to implement reproducible builds for one of my product
> > > kernel. I referred https://reproducible-builds.org/docs/build-path/
> > > and tried to use both -fdebug-prefix-map=OLD=NEW and
> > > -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
> > > binary reproducibility without overwriting build-id to none.
> > > If I move the kernel to same path in other setup, I was able to create
> > > same binary hash, however, without it, there is some difference in
> > > build-id hash values.
> > 
> 
> Hi Thomas,
> Thanks for looking into this and sharing your inputs.
> 
> 
> > Can you force the same build path during package building?
> > That should avoid this issue.
> 
> Since we can't control where the user would clone their kernel, I was
> initially skeptical to copy the kernel to a same build path like
> /tmp/kernel/src directory due to uncertainties related to free space,
> permissions, but I tried it now and it works fine. It should be OK for my
> use-case.
> 
> I am currently using NixOS for reproducible build environment.

So users are already forced to use a specific distribution for rebuilding.
Also requiring a specific build path doesn't look like a big step then.

> > > Reproducibility wiki says "In most cases however, post-processing is
> > > required to either remove the build path or to normalize it to a
> > > predefined value.". I have tried that, and it works, but wanted to
> > > conclude if that is my last option here.
> > 
> > I am not a fan of this aproach. The build id should stay usable.
> > Can you figure out where the build paths are used?
> > You may need to also compare the debug symbols.
> > 
> > > Thanks.
> 
> I agree.
> We did not have any use of these build paths, but some vendors may be using
> it to fetch the build information from the binaries.
> If your comment was about in-kernel usage of these build paths, I'll look
> into it.

I'd like to know where the build paths in the binary are coming from.
So we can fix the issue properly instead of working around it.
You said you are using -fmacro-prefix-map and -fdebug-prefix-map to avoid them.
(There is also -ffile-prefix-map which should be more robust and easy to use)

> > > ---
> > >   Makefile                          | 8 ++++++--
> > >   arch/arm64/kernel/vdso/Makefile   | 5 ++++-
> > >   arch/arm64/kernel/vdso32/Makefile | 5 ++++-
> > >   arch/x86/entry/vdso/Makefile      | 5 ++++-
> > >   4 files changed, 18 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/Makefile b/Makefile
> > > index 3373308d2217c..3fcff4af200d7 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1132,8 +1132,12 @@ KBUILD_AFLAGS   += $(KAFLAGS)
> > >   KBUILD_CFLAGS   += $(KCFLAGS)
> > >   KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
> > > -KBUILD_LDFLAGS_MODULE += --build-id=sha1
> > > -LDFLAGS_vmlinux += --build-id=sha1
> > > +# Can be overridden for reproducible builds by using "make KBUILD_BUILD_ID=none"
> > > +KBUILD_BUILD_ID ?= sha1
> > > +export KBUILD_BUILD_ID
> > > +
> > > +KBUILD_LDFLAGS_MODULE += --build-id=$(KBUILD_BUILD_ID)
> > > +LDFLAGS_vmlinux += --build-id=$(KBUILD_BUILD_ID)
> > >   KBUILD_LDFLAGS	+= -z noexecstack
> > >   ifeq ($(CONFIG_LD_IS_BFD),y)
> > > diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> > > index 7dec05dd33b70..b3ee5982b4676 100644
> > > --- a/arch/arm64/kernel/vdso/Makefile
> > > +++ b/arch/arm64/kernel/vdso/Makefile
> > > @@ -9,6 +9,9 @@
> > >   # Include the generic Makefile to check the built vdso.
> > >   include $(srctree)/lib/vdso/Makefile.include
> > > +# Fallback for standalone builds, normally inherited from top-level Makefile
> > > +KBUILD_BUILD_ID ?= sha1
> > > +
> > 
> > What kind of standalone builds?
> > This doesn't look like it belongs into this patch.
> > 
> > (...)
> 
> The case I was trying to cover here was when we try to compile
> arch/x86/entry/vdso/ separately, without the KBUILD_BUILD_ID coming from
> main build scripts, "--build-id=" would be left empty, while we may want to
> retain original value i.e. sha1.
> 
>     make ARCH=x86_64 arch/x86/entry/vdso/

I don't think this is or should be supported.

> arch/x86/entry/vdso/Makefile:
> -VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 --no-undefined \
> +VDSO_LDFLAGS = -shared --hash-style=both --build-id=$(KBUILD_BUILD_ID)
> --no-undefined \
> 
> Anyways, this may not be required now.


Thomas

