Return-Path: <linux-kbuild+bounces-10945-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKxUDY1sfGkSMgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10945-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 09:32:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A38B7B8601
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 09:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 972F8300D635
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 08:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6A72DECCB;
	Fri, 30 Jan 2026 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPQaCTMx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF1219EB;
	Fri, 30 Jan 2026 08:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769761929; cv=none; b=VMoC8nJYOh0xpf0sMs80sDs3TTwDnwN+JN5+AprmpPmyWQ4rAz47PuI99lTM74LoTMHFL+5OGqr6cc9LoEb49EzFX978NVKBHQxq/GSzGRNtfLsPVDXFoH++Gz9rwQRccuwl9qtsJF2w5JQSuJQBUq3130RuxUfx8zgHN+U9Bm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769761929; c=relaxed/simple;
	bh=kqZupq81AGCTC9o5NgnD/B6fOlW+S7Ww8dnDkQ5so2k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bg/nkoTuzHME06YlDdXoH0oTG+bgEsOqMLXA2Y+LMtTGrMGTN+4/qgLW45ppZEe7IkSWgZWMAVkhNC2RbT6s8IW2+aCwCDptkjauxRsRm2NVtUnHCl4HyrdKrGyfE//RKGkaE1eucSGayN3jueTmxsutluonfSveIQjvUvqs3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPQaCTMx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5C69C4CEF7;
	Fri, 30 Jan 2026 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769761928;
	bh=kqZupq81AGCTC9o5NgnD/B6fOlW+S7Ww8dnDkQ5so2k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cPQaCTMxmlOC6aaFjOPPAXpTuu+OhyzacVlpb5sL5WaTeFueXYv8cn2gnU+JwVR2I
	 +pRVAQm6mnl00ljEPyU18bQCwN9knd0e073dZfDY/TInGRkWeEZrwlzow2dc+uV+nr
	 sZ8yP9S9s/E87wAaAcvn8VoGtwfJszGL4bdmpV68mwVGGyAuee9GjQhcUsV8vs7Aff
	 BhBLO+ByfdBNqImhaPV7fkNcSCuniMdmTu1RjjB0W7f3tXi08V55Ah/9WVpcuHXwWp
	 QlghnmgW4trO7xODrDmjRsGCq10m/aVmSXAWh7aCHeFPt8eL4CZdy/QnePLbKgJJPC
	 eAhqIisjqw4YQ==
Date: Fri, 30 Jan 2026 09:32:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rong Zhang <i@rong.moe>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Add missing python
 libraries
Message-ID: <20260130092816.162a48fe@foz.lan>
In-Reply-To: <20260130064011.GA2981809@ax162>
References: <20260129175321.415295-1-i@rong.moe>
	<20260130011106.GA359714@ax162>
	<20260130063056.72fbe458@foz.lan>
	<20260130064011.GA2981809@ax162>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10945-lists,linux-kbuild=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,foz.lan:mid]
X-Rspamd-Queue-Id: A38B7B8601
X-Rspamd-Action: no action

On Thu, 29 Jan 2026 23:40:11 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> On Fri, Jan 30, 2026 at 06:30:56AM +0100, Mauro Carvalho Chehab wrote:
> > On Thu, 29 Jan 2026 18:11:06 -0700
> > Nathan Chancellor <nathan@kernel.org> wrote:  
> > > On Fri, Jan 30, 2026 at 01:49:55AM +0800, Rong Zhang wrote:  
> ...
> > > >   $ make -C /lib/modules/6.19.0-rc6/build/ M="$(pwd)" modules V=1 W=1
> > > >   [...]
> > > >   make -f /usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build obj=. need-builtin=1 need-modorder=1
> > > >   # CC [M]  mod.o
> > > >   [...]
> > > >   # cmd_checkdoc mod.o
> > > >   PYTHONDONTWRITEBYTECODE=1 python3 /usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py -none mod.c  
> > 
> > This sounds really weird, as it is trying to run scripts/kernel-doc.py
> > instead of tools/docs/kernel-doc. Does the out-of-tree Makefile
> > override KERNELDOC variable? The current version contains:
> > 	
> > 	KERNELDOC       = $(srctree)/tools/docs/kernel-doc
> > 
> > But somehow it is using the old version before the renames:
> > 
> > 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py  
> 
> Well I think based on the "6.19.0-rc6" in the path above, this is
> mainline, not -next, so the rename has has not happend there yet.

Ah, ok. On your e-mail you mentioned the renaming patch, so I
ended assuming that was the case.

> 
> > Btw, I did a very quick test here, using an old OOT project I have
> > at github:
> > 
> > 	https://github.com/mchehab/xr_serial  
> ...
> > It sounds to me that Rong may be using a Makefile on his OOT project
> > that was not updated to pick the right kernel-doc tool.  
> 
> If I use that project with Rong's original command, the
> linux-upstream-headers package from the pacman-pkg target (which uses
> install-extmod-build), and the following fix up for a more modern kernel
> version, I see the following error:
> 
>   $ make -C /usr/lib/modules/6.19.0-rc7-next-20260129/build M=/tmp/xr_serial modules V=1 W=1
>   ...
>   # CC [M]  xr_serial.o
>     gcc ...
>   # cmd_checkdoc xr_serial.o
>     PYTHONDONTWRITEBYTECODE=1 python3 /usr/lib/modules/6.19.0-rc7-next-20260129/build/tools/docs/kernel-doc -none   xr_serial.c
>   python3: can't open file '/usr/lib/modules/6.19.0-rc7-next-20260129/build/tools/docs/kernel-doc': [Errno 2] No such file or directory
>   make[3]: *** [/usr/lib/modules/6.19.0-rc7-next-20260129/build/scripts/Makefile.build:287: xr_serial.o] Error 2
> 
> If it is not expected that kernel-doc runs for external modules, then
> maybe cmd_checkdoc should also be wrapped in a check for KBUILD_EXTMOD?

I don't particularly see any reason why running kernel-doc for external
modules, as the goal of running it there (outside make htmldocs) is to
detect early problems at linux-next and other CIs.

On the other hand, I also don't see any problem on encapsulating
kernel-doc at the tarball created by install-extmod-build with something
like:

	ifeq ($(KBUILD_EXTMOD),)
		ifneq ($(KBUILD_EXTRA_WARN),)
		  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
	        	$(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
		        $<
		endif
	endif

at scripts/Makefile.build.


So, feel free to add to either one of the approaches:

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

That's said, it should be noticed that the DRM subsystem also has
some similar code:

	drivers/gpu/drm/Makefile:                PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
	drivers/gpu/drm/i915/Makefile:    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none -Werror $<
	drivers/gpu/drm/i915/Makefile:          $(KERNELDOC) -none -Werror $<; touch $@
	include/drm/Makefile:           PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
	scripts/Makefile.build:  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \

but I suspect that only scripts/Makefile.build probably need
such check.

Regards,
Mauro

