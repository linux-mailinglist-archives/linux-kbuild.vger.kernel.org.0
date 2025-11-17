Return-Path: <linux-kbuild+bounces-9646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B5C62E53
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 09:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 091994E31C9
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 08:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CA02261595;
	Mon, 17 Nov 2025 08:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dYK88HJ3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oL9Zoo9X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B7223FC41;
	Mon, 17 Nov 2025 08:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763368239; cv=none; b=ddPTX1iQ+vdgHF9VQDbCW/4dlQiF3Bz4UiGkzXqIHCVAZqSNX34gGTTRdRN1GCylmaSkioOiLB8rzzPA9Ik5eQGsXPaQTsNZ8M5OSAKo/415xOnT9/1W7DAkpVGPowRQybJVidy5WUd2LuSdQp/sMkSkiX2pvwS0kN+Z/iDFL/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763368239; c=relaxed/simple;
	bh=KSSuT86vVYblV830LsdzfcLCoaRL8WMdPJQqE8961aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHEPRW02lFHoDpCv0sTlaNTSdct7HshbeBiKQLecU1Jhell82pXge29v+CIpHUjbCTfJHfyXc+oB7X5ZdDdkh75y3FP3K9r1GbmafXVRSCM7B5UNR/h816PT+Iln8W7rmPRssYSDgbzH9sGOdiYsWd/cRjfqvLwmI7PXAtzgJlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dYK88HJ3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oL9Zoo9X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 17 Nov 2025 09:30:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763368235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AazmqOCsIEL5KCNVAXGwQMB3xg1S6nNMzvoIjmuhVPM=;
	b=dYK88HJ3to90X5P7NmvOyNGu3y8hHlsdM6VkkOd5BcERgG3MVl73G6oG/Cq/OXyrZXHIOT
	ltAKWxcna4Noastx64wOa2TciOTQ2DYWA0S+8jIciBsmwr8K8mKZtynvbV7ydRYYmFGQBR
	8wZATDUYIFKPl/KslbQoCU9UCVNlUyT09exyflkOez0nvEPezgIDFEWVm5f4z16Usm00kb
	EjefXVq1AO9lfhHT9PoFHiC2jSfuonxC2jQ2/Na+BvBQ71VwxLHIEf8eiJxp82nLaPUVRj
	/OGjIJiA6Gqiw6uL4p5dKAqgT8UElr38e3iFAjEEPUgiShRJUr9HOYIlJbsVAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763368235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AazmqOCsIEL5KCNVAXGwQMB3xg1S6nNMzvoIjmuhVPM=;
	b=oL9Zoo9XM/40CebKLq03imDb2w15RJ1tzlK1s5T170fm0CDPP6+3wMCnPetuWTBoPnTAZv
	MNyCDAgy9kh+qPDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, Tom Rini <trini@konsulko.com>, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Parth Pancholi <parth.pancholi@toradex.com>, Rong Xu <xur@google.com>, Tamir Duberstein <tamird@gmail.com>, 
	Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/8] kbuild: Allow adding modules into the FIT ramdisk
Message-ID: <20251117091609-d41b5c1b-5781-41b8-aba7-d671a2f58be1@linutronix.de>
References: <20251114142741.1919072-1-sjg@chromium.org>
 <20251114142741.1919072-7-sjg@chromium.org>
 <20251114162255-10e006c6-dadc-44df-a8ed-ab4a00fc6402@linutronix.de>
 <aReIA8YuOM7JIXIe@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aReIA8YuOM7JIXIe@derry.ads.avm.de>

On Fri, Nov 14, 2025 at 08:50:27PM +0100, Nicolas Schier wrote:
> On Fri, Nov 14, 2025 at 04:29:33PM +0100, Thomas Weißschuh wrote:
> > On Fri, Nov 14, 2025 at 07:27:32AM -0700, Simon Glass wrote:

(...)

> > >  quiet_cmd_fit = FIT     $@
> > > -      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > > -		--name '$(UIMAGE_NAME)' \
> > > +      cmd_fit = $(if $(FIT_MODULES), \
> > > +		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \
> > 
> > This will include stale module files. You can get an up-to-date list from
> > $(objtree)/modules.order with a bit post-processing.
> > Maybe kbuild can be extended to also create a list of the .ko files.
> > (I would be interested in that for my own usecases, too)
> 
> oh yes, thanks for the pointer.  This is indeed quite simple and much
> better than calling find.  For in-tree kmods:
> 
>     compiled-modules = $(patsubst %.o,%.ko,$(call read-file, $(objtree)/modules.order))

Tiny nitpick: IMO 'built' modules would be more accurate than 'compiled' modules.

> But as we need the list of modules in a file, we can also add a
> $(call write-file,FILE,TEXT) macro (cp. read-file in
> scripts/Kbuild.include).

> Thomas, is this sufficient for your use case?  Or do you also need a
> make target outputting the list of kmods?

For my usecase I need it in a file [0], passing them on the command line will
likely run into argument list length limitations.

A new file 'modules.built' generated from modules.order would be useful both
for this patch, mine and other tools like scripts/package/builddeb.
(Or 'modules.loadable', matching the scheme from 'modules.builtin')
On the other hand the modules.order seems to have quite some special logic in
the Makefile, so it may not be straigtforward to add such a file.

[0] https://lore.kernel.org/lkml/20250429-module-hashes-v3-9-00e9258def9e@weissschuh.net/#Z31scripts:module-hashes.sh


Thomas

