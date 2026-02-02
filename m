Return-Path: <linux-kbuild+bounces-10970-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPpeI4qxgGn6AQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10970-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 15:15:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DACD399
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 15:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 699EA30157C7
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Feb 2026 14:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6310D36C0A3;
	Mon,  2 Feb 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="39g5kb/r";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aZ3jd/0m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1583366824;
	Mon,  2 Feb 2026 14:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770041735; cv=none; b=m3OEF8D9srkc1WeWDOD4+vLRRNrMYLJJBLqnB3tgVpOMTzziTJgQf/fyyf6C9oudSWXJeIq3mDGZXNBpWfpozxKWcI75Z7wGKWPiwqskPyaDiTDPTML9fLsUHgkirfCFV3lrXy0C0GAlVzSHY7BBn61xvqxY3tfhQi4CyWGkV0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770041735; c=relaxed/simple;
	bh=PGPtpno3qwpgreWL92gIC1DKSi/15JxgeXa3vIZPgCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APL88AgjaahVnoPttmGc4mumO0ywcnP4z6Th4Ccne913wDgyDPFqOpBsl4/ganuP5slO8SIZgsgWpq77LrrmRfaaavMjF7RMNZWTpkd6Yyqt4hsUnXOJEu2l867ZT//VdBZOEXu8r6VbYGH+UE18Kh9TXXhTGIvDQHlctiCRsA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=39g5kb/r; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aZ3jd/0m; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 2 Feb 2026 15:15:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770041731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIWJ3QDsIlEoYX64jrKdZjhC06uyp5mqaYHvEkc3LRg=;
	b=39g5kb/r9I4iZpeyez3XcoHFXG9nGqcUB03TR+hP82TMARVMxY1PXo7EkSCeeiWYrA83D2
	9zxbeOp31ZzN8rpVtpL/6EH/dYspyOEG68gXOzMxBly5S+7rxvVKJVP+nPdfsrzO6nwmRR
	kqPjPSkfgTj7+g4Jy692hmklFF6Z+QSYGKHCBcsaEis1pFsoQBq8TjiaV4wj1fIZw7oSOO
	xqMVxhH2+XnLn3h2U7sTw34847dCqScO/JGvKgzr1JL92wIx0O1Yi/gNIa8xoyCmsLV+Me
	5c9UefUlay0rsroQW28nHbZydBC3gqBvQXECSO6mXaHg/Prxs39I3skNwEGx+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770041731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DIWJ3QDsIlEoYX64jrKdZjhC06uyp5mqaYHvEkc3LRg=;
	b=aZ3jd/0mZnoUaQKxNMS22ZPCpi5zse+m55GRVSELamYe622m5j8GHwvVx+vP2dGNPs70tm
	lLu+ihr6M3PjnKAQ==
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
Message-ID: <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202110631.978412-1-namjain@linux.microsoft.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10970-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,reproducible-builds.org:url]
X-Rspamd-Queue-Id: EC8DACD399
X-Rspamd-Action: no action

Hi Naman,

On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
> Build ID hashes include file paths, so building the same source from
> different directories produces different binaries. This breaks
> reproducible builds.
> 
> Add KBUILD_BUILD_ID variable (default: sha1) to allow overriding:
> 
>     make KBUILD_BUILD_ID=none
> 
> The variable is exported to VDSO Makefiles which also include a
> fallback default for standalone invocation.
> 
> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
> ---
> Hi,
> Sending this change for RFC, as it is quite possible that this is a
> generic problem and I may be missing something.
> 
> I am trying to implement reproducible builds for one of my product
> kernel. I referred https://reproducible-builds.org/docs/build-path/
> and tried to use both -fdebug-prefix-map=OLD=NEW and
> -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
> binary reproducibility without overwriting build-id to none. 
> If I move the kernel to same path in other setup, I was able to create
> same binary hash, however, without it, there is some difference in
> build-id hash values.

Can you force the same build path during package building?
That should avoid this issue.

> Reproducibility wiki says "In most cases however, post-processing is
> required to either remove the build path or to normalize it to a
> predefined value.". I have tried that, and it works, but wanted to
> conclude if that is my last option here.

I am not a fan of this aproach. The build id should stay usable.
Can you figure out where the build paths are used?
You may need to also compare the debug symbols.

> Thanks.
> 
> ---
>  Makefile                          | 8 ++++++--
>  arch/arm64/kernel/vdso/Makefile   | 5 ++++-
>  arch/arm64/kernel/vdso32/Makefile | 5 ++++-
>  arch/x86/entry/vdso/Makefile      | 5 ++++-
>  4 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 3373308d2217c..3fcff4af200d7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1132,8 +1132,12 @@ KBUILD_AFLAGS   += $(KAFLAGS)
>  KBUILD_CFLAGS   += $(KCFLAGS)
>  KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
>  
> -KBUILD_LDFLAGS_MODULE += --build-id=sha1
> -LDFLAGS_vmlinux += --build-id=sha1
> +# Can be overridden for reproducible builds by using "make KBUILD_BUILD_ID=none"
> +KBUILD_BUILD_ID ?= sha1
> +export KBUILD_BUILD_ID
> +
> +KBUILD_LDFLAGS_MODULE += --build-id=$(KBUILD_BUILD_ID)
> +LDFLAGS_vmlinux += --build-id=$(KBUILD_BUILD_ID)
>  
>  KBUILD_LDFLAGS	+= -z noexecstack
>  ifeq ($(CONFIG_LD_IS_BFD),y)
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 7dec05dd33b70..b3ee5982b4676 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -9,6 +9,9 @@
>  # Include the generic Makefile to check the built vdso.
>  include $(srctree)/lib/vdso/Makefile.include
>  
> +# Fallback for standalone builds, normally inherited from top-level Makefile
> +KBUILD_BUILD_ID ?= sha1
> +

What kind of standalone builds?
This doesn't look like it belongs into this patch.

(...)

