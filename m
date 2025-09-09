Return-Path: <linux-kbuild+bounces-8775-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C73DB4A195
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 07:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C74A5442811
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Sep 2025 05:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC252F0689;
	Tue,  9 Sep 2025 05:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="k1hZ9Gb4";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="c13Tzwde"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CB41E7C12;
	Tue,  9 Sep 2025 05:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757397047; cv=none; b=jc11l0Q8lwrMGyEqMFLtSZbdRvvM17DAZ8tIevZhwp2oi0BYU7O4XPZiL5Xdo3H95u5ZYD3/VCJG+4dwh8p1uGog+FSiQC3NxpQWavKA2pr4epoNOaMwIXoZboOgCQbrLX7uptlqyVMOjw7tb9OFvVqe97GWM2lMLYPcFjcrtPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757397047; c=relaxed/simple;
	bh=jPKmrBEAzWx3yEFQSPIXDJ5SIx1GI4BCpMAnMsYaMLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqBPPrZwMWeAzFSYns1tPmogF5BdIJQhlzvyXohUJvt+Q74+2uqc0ayf7rWanRuaGZqs+ufwuJAfzlR8TAWwCMRmqow4aITH4hitEMaHP58DRBPRGFZ227yNG5CqLcHqCafKcwBJSXBm/TjDeY1fYQA+TwCfk6dQeVANYhebJBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=k1hZ9Gb4; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=c13Tzwde; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 9 Sep 2025 07:50:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1757397043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdoYceIEVIRq3JbUcPPGyO0ETu/LZJ0mlmTiG+3Ebjs=;
	b=k1hZ9Gb4fhxvBSc7F1OH+RhH3T80kB9JpmLg8RS1B3jE5c0f0f46SuGMvABIr5xYqWGQlF
	lSuWDWfsHl2mN+2uPJDML3brhr60wRmvPv7r4UcSLpyXlp2pS69uMjPes7mFt/NdGU+jGw
	0shxbFSCQUm/iIp8FWHEliPfb0qKv6AUrXUZCcvyc1zbjLNajSjmXx2SMCr5WA4c0xCGbm
	RBPb8ZIEVs5IUHUMiNAtSK6kvJVjgYP9om7XXFnJeJEj3VpSWYuoOX7FxtcTKnl37XYwTF
	cot3Cw4PyxMxNNQbfYAMH6s8vTmGJIgefl6DbXVAQg+zyf5XUm/837dhoT2ufQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1757397043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sdoYceIEVIRq3JbUcPPGyO0ETu/LZJ0mlmTiG+3Ebjs=;
	b=c13TzwdeSZF7BCmeD9V5BKPtL4MI+HHKJYiYLQpo85GEMsCaH1XVamxsMMTcPQwnt+21tj
	Chb3VuuhsWghD4CA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20250909074959-97a9ef88-ab55-4446-b107-e48cd9d4d268@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
 <20250827224935.GB414199@ax162>
 <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>
 <20250903223131.GA2264021@ax162>
 <aL0W9xvpktaLE9m2@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aL0W9xvpktaLE9m2@levanger>

On Sun, Sep 07, 2025 at 07:24:07AM +0200, Nicolas Schier wrote:
> On Wed, Sep 03, 2025 at 03:31:31PM -0700, Nathan Chancellor wrote:
> > On Mon, Sep 01, 2025 at 11:51:03AM +0200, Thomas Weißschuh wrote:
> > > Exactly. The normal cases can be handled generically. For example the kconfig
> > > below works for architectures which only differ in byte order and 32bit/64bit,
> > > which are most of them. MIPS should require more logic.
> > > Also I'm ignoring x32, as it is never the kernel's native ABI.
> > > 
> > >  config CC_CAN_LINK
> > >         bool
> > > +       default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
> > > +       default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
> > >         default $(cc_can_link_user,$(m64-flag)) if 64BIT
> > > +       default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
> > > +       default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
> > >         default $(cc_can_link_user,$(m32-flag))
> > > 
> > > 
> > > > Feels like that could get complicated quickly but this would probably be
> > > > the objectively most robust and "hands off" option.
> > > 
> > > Agreed.
> > 
> > Nicolas might feel differently but this does not seem terrible to me,
> > especially with a macro to wrap the common logic, which is where I felt
> > like things could get unwieldy. Feel free to send an RFC if it is not
> > too much work.
> 
> yes, at a first glance this looks ok to me, too.

Ack. I'll take a shot at this, but it I might only get around to it next cycle.


Thomas

