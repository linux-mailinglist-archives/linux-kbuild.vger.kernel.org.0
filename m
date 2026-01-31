Return-Path: <linux-kbuild+bounces-10957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK0eECwbfmnoVgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10957-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:09:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFD7C2A0A
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 16:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4609D300B07A
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6424534FF7B;
	Sat, 31 Jan 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvfyn8Q3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F96B76026;
	Sat, 31 Jan 2026 15:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769872164; cv=none; b=YkelGCavkz4RFm+1UcxwcTTx1kbCPPj2pC1++FRTxQGoUxaCavWyPUP3owK/VWC9BRr4Me8ahhxSIOYV8zeiER14PU352qqBbdZenYJsm9VlYpJvDQbC7d8GnlOp6wIY+Xd+My2UfjFholYC6Fbtzkzlcbf4atVupfWU+c8JRws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769872164; c=relaxed/simple;
	bh=gcdo6o76TtPtyJoi2SieZGmlGf1ucBdMSPbQiU7BwbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1eWlJSYb6qpjJ8mD6Ck4f0jemXOhmZGs1BJikNMYw/8jvXm4xGbJwC7Y213oYdZqw+MEzNm5cLhJvVkp258k24nMwjThP40MvKtJD5SliHqBtC62lBwGoq/qKCNSjL+KpstArPp7+45Yn/0ENk+YETapgrmARXx1fQb9oRWkRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvfyn8Q3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33380C4CEF1;
	Sat, 31 Jan 2026 15:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769872163;
	bh=gcdo6o76TtPtyJoi2SieZGmlGf1ucBdMSPbQiU7BwbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mvfyn8Q3NfDjS6Wqqvu1MvQr40vvyugzNqD4PSSrDQKvllVQfl7dz9aVG4Rcof5ng
	 8M+z9L8Logi3seWl+orotwTFkDHXFwx4STTTr3wQaLC/gImpgPHWJbtJizVQyUTPI/
	 MqtpjEUZJwgl6TpT8/CFvXuSQr3CJ/rnIAfev9M6NfgcPeAewPX6veYPZ24qTY4dBH
	 4ZVE6XjqSdSSELOqr1FK3JMkDQyNjkZEow6n+NpWk2gCgi+l6AgdBcRG9T8P5HwDCs
	 e6qJ49qtg42/WfIp/4hGILQObfVmHm+SupupEjoH3O5D4MtqqlsAYRLRTkUDvM0JtM
	 5Ah85DXy1R5Jg==
Date: Sat, 31 Jan 2026 16:08:52 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: Add missing python
 libraries
Message-ID: <aX4bBI_v5oxjHgXi@levanger>
Mail-Followup-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Rong Zhang <i@rong.moe>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20260129175321.415295-1-i@rong.moe>
 <20260130011106.GA359714@ax162>
 <20260130063056.72fbe458@foz.lan>
 <20260130064011.GA2981809@ax162>
 <20260130092816.162a48fe@foz.lan>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130092816.162a48fe@foz.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10957-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1AFD7C2A0A
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 09:32:03AM +0100, Mauro Carvalho Chehab wrote:
> On Thu, 29 Jan 2026 23:40:11 -0700
> Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > On Fri, Jan 30, 2026 at 06:30:56AM +0100, Mauro Carvalho Chehab wrote:
> > > On Thu, 29 Jan 2026 18:11:06 -0700
> > > Nathan Chancellor <nathan@kernel.org> wrote:  
> > > > On Fri, Jan 30, 2026 at 01:49:55AM +0800, Rong Zhang wrote:  
> > ...
> > > > >   $ make -C /lib/modules/6.19.0-rc6/build/ M="$(pwd)" modules V=1 W=1
> > > > >   [...]
> > > > >   make -f /usr/src/linux-headers-6.19.0-rc6/scripts/Makefile.build obj=. need-builtin=1 need-modorder=1
> > > > >   # CC [M]  mod.o
> > > > >   [...]
> > > > >   # cmd_checkdoc mod.o
> > > > >   PYTHONDONTWRITEBYTECODE=1 python3 /usr/src/linux-headers-6.19.0-rc6/scripts/kernel-doc.py -none mod.c  
> > > 
> > > This sounds really weird, as it is trying to run scripts/kernel-doc.py
> > > instead of tools/docs/kernel-doc. Does the out-of-tree Makefile
> > > override KERNELDOC variable? The current version contains:
> > > 	
> > > 	KERNELDOC       = $(srctree)/tools/docs/kernel-doc
> > > 
> > > But somehow it is using the old version before the renames:
> > > 
> > > 	KERNELDOC       = $(srctree)/scripts/kernel-doc.py  
> > 
> > Well I think based on the "6.19.0-rc6" in the path above, this is
> > mainline, not -next, so the rename has has not happend there yet.
> 
> Ah, ok. On your e-mail you mentioned the renaming patch, so I
> ended assuming that was the case.
> 
> > 
> > > Btw, I did a very quick test here, using an old OOT project I have
> > > at github:
> > > 
> > > 	https://github.com/mchehab/xr_serial  
> > ...
> > > It sounds to me that Rong may be using a Makefile on his OOT project
> > > that was not updated to pick the right kernel-doc tool.  
> > 
> > If I use that project with Rong's original command, the
> > linux-upstream-headers package from the pacman-pkg target (which uses
> > install-extmod-build), and the following fix up for a more modern kernel
> > version, I see the following error:
> > 
> >   $ make -C /usr/lib/modules/6.19.0-rc7-next-20260129/build M=/tmp/xr_serial modules V=1 W=1
> >   ...
> >   # CC [M]  xr_serial.o
> >     gcc ...
> >   # cmd_checkdoc xr_serial.o
> >     PYTHONDONTWRITEBYTECODE=1 python3 /usr/lib/modules/6.19.0-rc7-next-20260129/build/tools/docs/kernel-doc -none   xr_serial.c
> >   python3: can't open file '/usr/lib/modules/6.19.0-rc7-next-20260129/build/tools/docs/kernel-doc': [Errno 2] No such file or directory
> >   make[3]: *** [/usr/lib/modules/6.19.0-rc7-next-20260129/build/scripts/Makefile.build:287: xr_serial.o] Error 2
> > 
> > If it is not expected that kernel-doc runs for external modules, then
> > maybe cmd_checkdoc should also be wrapped in a check for KBUILD_EXTMOD?
> 
> I don't particularly see any reason why running kernel-doc for external
> modules, as the goal of running it there (outside make htmldocs) is to
> detect early problems at linux-next and other CIs.
> 
> On the other hand, I also don't see any problem on encapsulating
> kernel-doc at the tarball created by install-extmod-build with something
> like:
> 
> 	ifeq ($(KBUILD_EXTMOD),)
> 		ifneq ($(KBUILD_EXTRA_WARN),)
> 		  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
> 	        	$(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
> 		        $<
> 		endif
> 	endif
> 
> at scripts/Makefile.build.
> 
> 
> So, feel free to add to either one of the approaches:
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks everybody for report and analysis!  I put Mauro's suggestion into
a new patch for kbuild-next:

https://lore.kernel.org/linux-kbuild/20260131-run-kernel-doc-only-in-tree-v1-1-93a9c695dfb1@kernel.org/

I plan to send the pull request tonight.

> That's said, it should be noticed that the DRM subsystem also has
> some similar code:
> 
> 	drivers/gpu/drm/Makefile:                PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> 	drivers/gpu/drm/i915/Makefile:    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none -Werror $<
> 	drivers/gpu/drm/i915/Makefile:          $(KERNELDOC) -none -Werror $<; touch $@
> 	include/drm/Makefile:           PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> 	scripts/Makefile.build:  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
> 
> but I suspect that only scripts/Makefile.build probably need
> such check.

yes, I think so too, as the definitions in drm should only take effect
on hdrtest target.

Kind regards,
Nicolas

