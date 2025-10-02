Return-Path: <linux-kbuild+bounces-8993-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 928CBBB4044
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Oct 2025 15:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 32A3B4E03C8
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Oct 2025 13:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664E7310647;
	Thu,  2 Oct 2025 13:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KvkA5tlA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="8mb4CLhL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EB130CB5D;
	Thu,  2 Oct 2025 13:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759411393; cv=none; b=Xtu4BYql6No98zoz0UPKo8SgJ4mcb3LoQz7153QzQFUlVzsYQtsOhQj7atyzqF/NjU7Lj2a9VHo2VZ5orTdQoQmYQwLNCiavzxuBZR4LNJs50t+K7BCAtt3Kg0fW6SdzlLOzknUYClsDsYKEydnZZziioTJ1epF3zANg4GyWvyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759411393; c=relaxed/simple;
	bh=8pNHNTIjC0mrJE5zz4V1NYwPZ55eaLtu3KZu87KkB44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGwww/k86GqXgQ1dcPTglHUKuDIm4uOL+RoLD4Q0GUfLJzeidPyqfHqpKu0WdA4BqwjYHD8U2Afcou8U8ntgmP7fvVQMV4sHJfq3mDzDGzg0Pd527ss2Hhj7XPSei6WmVVxf9caYtoTAQzP3+X06dt8gXBLXLAPTzKLKb03rzw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KvkA5tlA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=8mb4CLhL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 2 Oct 2025 15:23:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759411389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMgqKzRYiKhMwHfcl8wi/yOTixd4cProY6Q8I9YY35A=;
	b=KvkA5tlANCzqFRYRRskt95BKR0ndguTJH1YNfAz66Fhc+PnYK0VTmufRaZ9prI6Bqlfj4I
	24dL7w4hSDbW13vjwRJ77WKx3Hw4JWmNUmxA96qRvhxJpp4efzte1c0fhDeVDjPQ7FJ23l
	C2ShED+1QLoWAK8LiEVgdZzIwI8/5OpWcYKBUmWNIvs8fGyH9fT3T2ePhmiTy9w68c50CK
	kbatjxhOX0E/t3IyGGP8dbLgRGiLPhj7SzqFBrzWMFvNPVko5tvPMU1CPpDqFMhTvzE+0v
	LldxCJaEsbdJAw9G7u4dcw9P2Lh6TWCSwQrLi+bKpvDc5gpPebmJ7Zeusjyypw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759411389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UMgqKzRYiKhMwHfcl8wi/yOTixd4cProY6Q8I9YY35A=;
	b=8mb4CLhLL52p94/N1X0WPGEf68u424uh2hUMDptFyHsO2nKbvRyHL8ofwmopFmq8kTlOGU
	E0H0fYIM2me3JzAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20251002144850-4a498f99-418d-4888-80f9-0f24c6896318@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
 <20250827224935.GB414199@ax162>
 <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>
 <20250903223131.GA2264021@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903223131.GA2264021@ax162>

Hi Nicolas and Nathan,

On Wed, Sep 03, 2025 at 03:31:31PM -0700, Nathan Chancellor wrote:
> On Mon, Sep 01, 2025 at 11:51:03AM +0200, Thomas Weißschuh wrote:
> > Exactly. The normal cases can be handled generically. For example the kconfig
> > below works for architectures which only differ in byte order and 32bit/64bit,
> > which are most of them. MIPS should require more logic.
> > Also I'm ignoring x32, as it is never the kernel's native ABI.
> > 
> >  config CC_CAN_LINK
> >         bool
> > +       default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
> > +       default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
> >         default $(cc_can_link_user,$(m64-flag)) if 64BIT
> > +       default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
> > +       default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
> >         default $(cc_can_link_user,$(m32-flag))
> > 
> > 
> > > Feels like that could get complicated quickly but this would probably be
> > > the objectively most robust and "hands off" option.
> > 
> > Agreed.
> 
> Nicolas might feel differently but this does not seem terrible to me,
> especially with a macro to wrap the common logic, which is where I felt
> like things could get unwieldy. Feel free to send an RFC if it is not
> too much work.

I investigated this some more and didn't really like the end result. The
problem is that $(m32-flag) and $(m64-flag) will expand to nothing if the
compiler does not support -m32/-m64. So for architectures which use
different flags the current logic will just ignore the bitness. One way
around this would be a mapping from -m32/-m64 to architecture-specific
flags inside cc-can-link.sh, similar to what I already did before for
the mapping of -mlittle-endian to -EL on MIPS. But we'll end up with a
bunch of architecture-specific details hidden away in a non-generic
shellscript. And the interactions are very non-obvious and brittle.
Then I'd rather have the architecture-specific bits openly in proper
architecture code.

See my current proposal, using x86 as example below. It will require
code for each architecture, but there are not that many of them.
And the configuration matrix for each architecture only contains a
relative small set of actually supported configurations.
Unfortunately I don't see a generic way to deduplicate the flag values
between ARCH_CC_CAN_LINK ARCH_USERPROGS_CFLAGS. Each architecture can
use a macro if they so prefer.

When the "interesting" architectures are done we can also slim down the
generic implementation to not use any special arguments and that would
be enough for the simple architectures.

For the future I would like to introduce CC_CAN_LINK_STATIC again.
With the scheme from below this would mean to duplicate all the kconfig
symbols for each architecture again. One way around would be to change
ARCH_CC_CAN_LINK from bool to string. And then let cc-can-link.sh test
for both static and dynamic linking in one go and return either
"dynamic,static", "dynamic" or "static" which then can be mapped to
CC_CAN_LINK and CC_CAN_LINK_STATIC by generic logic.

What do you think?


diff --git a/Makefile b/Makefile
index d37dca7850b3..17123948a4fa 100644
--- a/Makefile
+++ b/Makefile
@@ -1135,7 +1135,15 @@ LDFLAGS_vmlinux	+= --emit-relocs --discard-none
 endif
 
 # Align the bit size of userspace programs with the kernel
-USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
+USERFLAGS_FROM_KERNEL := --target=%
+
+ifdef CONFIG_ARCH_USERPROGS_CFLAGS
+KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERPROGS_CFLAGS)
+KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERPROGS_CFLAGS)
+else
+USERFLAGS_FROM_KERNEL += -m32 -m64
+endif
+
 KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 75f3de70df51..162c71c117bc 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -332,6 +332,17 @@ config X86
 	select SCHED_SMT			if SMP
 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
 	select ARCH_SUPPORTS_SCHED_MC		if SMP
+	select ARCH_HAS_CC_CAN_LINK
+
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64) if 64BIT
+	default $(cc_can_link_user,-m32) if !64BIT
+
+config ARCH_USERPROGS_CFLAGS
+	string
+	default "-m64" if 64BIT
+	default "-m32" if !64BIT
 
 config INSTRUCTION_DECODER
 	def_bool y
diff --git a/init/Kconfig b/init/Kconfig
index f3b13463ec26..5ca2f3289020 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,8 +82,13 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+# Might be removed when all architectures are migrated
+config ARCH_HAS_CC_CAN_LINK
+	bool
+
 config CC_CAN_LINK
 	bool
+	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
 
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e803..0c8dbfbce415 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -75,3 +75,6 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
 # If you are testing for unstable features, consider testing RUSTC_VERSION
 # instead, as features may have different completeness while available.
 rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
+
+# Test whether the compiler can link userspace applications
+cc_can_link_user = $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(1))

