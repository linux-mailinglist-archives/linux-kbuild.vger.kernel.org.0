Return-Path: <linux-kbuild+bounces-5753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CE1A35804
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Feb 2025 08:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4086B3AB84C
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Feb 2025 07:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75CF215193;
	Fri, 14 Feb 2025 07:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JBxD5TMe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="338Ojyag"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D80421518C;
	Fri, 14 Feb 2025 07:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739518828; cv=none; b=GEZqIWd1xabJZ1LrJb1tla7RFUE6tEXXuOGxluE708cP/1yX3Sk+ojUwc5qsPLmYbzivKN8gzJbct4fGJwWoMyX/lMgiY7mmouizysXD2EgX+8FlDa2+x5p6JnucfkxVZ9slN5Iw2kktE7iM3mMQMl0yqoySGJYZ09Go2L6mXc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739518828; c=relaxed/simple;
	bh=Kho89Q2GcXrXWyyf+yKrrhy4+9qmfkZeHsKLMwF6ToY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjZsMqILSdr54VJQ4/VqJvaDluao9ZYw9/WsI+9Ccue+nJI0t/T/lY7IaY0zB1Z4qhxL0qqJ5Lg2ovNbJAFlcIwbExG7l5vEqkVbztn6fDf9nr5NdohDUv/r0p4uzDmmT8rKGxxmKj1XdxZ+bx3Q8ppnRzQ4qRtovkMmqZd43mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JBxD5TMe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=338Ojyag; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Fri, 14 Feb 2025 08:40:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739518824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJwIeTxjum9Pg60yFJa15f1Ms93wGpRdtIBEoabt09A=;
	b=JBxD5TMe/dl3x399MEtFGPI9OKEFZ48+ukt08zkmcIsbj3ANQoEJhRox7f+bpSh1K2IDuU
	tVUi5eU5/JFoddw6L7v3n2cX7iWQELXh9hWJ2iBrbzk/JP/FO+7Nz9jSmMEjFZFsMl+UU/
	1JDy+abEymoxCWmuqvVCYDad14Jad3WKlGvHe8lggetY2qrNiqFcRs0iGcD8ne2MA9U1D7
	cJAyf2bs8ggONGJfx5W72JPB+9vVngTkwIurVAeFeAnDJErH73wlu6O2mmexxbqgahkxxe
	K0PPGJBXX/VanPtPMyNw93HTfsczzNksTNB+eYsKk8N70FY2ax3qjGBZYM5h5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739518824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJwIeTxjum9Pg60yFJa15f1Ms93wGpRdtIBEoabt09A=;
	b=338OjyagNqW2+sgiXIY8UN5cIkU3OwXzUzliw7tTiCyJPqsvTdfqFBUDDKLgm5ijfi3Zbx
	FjLrOoZSyds9muDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: userprogs: use lld to link through clang
Message-ID: <20250214081034-a5fd06c6-9cb5-4efc-ad2b-69e6acfb08bd@linutronix.de>
References: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
 <20250213-kbuild-userprog-fixes-v1-2-f255fb477d98@linutronix.de>
 <20250213175437.GA2756218@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250213175437.GA2756218@ax162>

On Thu, Feb 13, 2025 at 10:54:37AM -0700, Nathan Chancellor wrote:
> Hi Thomas,
> 
> On Thu, Feb 13, 2025 at 03:55:18PM +0100, Thomas Weiﬂschuh wrote:
> > The userprog infrastructure links objects files through $(CC).
> > Either explicitly by manually calling $(CC) on multiple object files or
> > implicitly by directly compiling a source file to an executable.
> > The documentation at Documentation/kbuild/llvm.rst indicates that ld.lld would
> > be used for linking if LLVM=1 is specified.
> > However clang instead will use either a globally installed cross linker from
> > $PATH called ${target}-ld or fall back to the system linker, which probably
> > does not support crosslinking.
> > For the normal kernel build this is not an issue because the linker is always
> > executed directly, without the compiler being involved.
> > 
> > Fix this by passing -fuse-lld and let clang find its matching lld.
> > 
> > Fixes: 7f3a59db274c ("kbuild: add infrastructure to build userspace programs")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> First of all, thank you for catching and noticing this!
> 
> > ---
> >  Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index bb5737ce7f9e79f4023c9c1f578a49a951d1e239..b4c208ae4041c1f4e32c2a158322422ce7353d06 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -510,6 +510,7 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
> >  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
> >  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
> >  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> > +KBUILD_USERLDFLAGS += -fuse-ld=lld
> 
> Now that our minimum supported version upstream is 13.0.1, I think we
> can make this
> 
>   KBUILD_USERLDFLAGS += --ld-path=$(LD)
> 
> as it should respect the user's choice of linker a little bit more, such
> as if they specific LLVM=<prefix>/bin/ or LLVM=-20. That reminds me that
> I can clean up what I did in commit 4406b12214f6 ("powerpc/vdso: Link
> with ld.lld when requested").

That is much better, thanks!
I looked for something like this but could't find it.

> Additionally, this would not fix someone using CC=clang and LD=ld.lld
> (it is uncommon but still techincally supported) so could we use a check
> like
> 
>   ifeq ($(CONFIG_CC_IS_CLANG)$(CONFIG_LD_IS_LLD),yy)
>   KBUILD_USERLDFLAGS += --ld-path=$(LD)
>   endif
> 
> further down in Makefile to make it more robust?

Ack.

> The stable backport may want to use cc-option like I did for the powerpc
> vdso since there is a lower minimum supported version of LLVM there.

Ack.


FYI, in case you want to have a look:
The kunit config for powerpc is currently broken on LLVM=1.

$ ./tools/testing/kunit/kunit.py run --arch powerpc --make_options LLVM=1

arch/powerpc/boot/wrapper manually inspects with CROSS_COMPILE, which does not
exist when LLVM=1. Instead it falls back to the system objcopy, etc.

> >  else
> >  CC		= $(CROSS_COMPILE)gcc
> >  LD		= $(CROSS_COMPILE)ld

