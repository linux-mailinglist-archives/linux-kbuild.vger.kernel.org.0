Return-Path: <linux-kbuild+bounces-11706-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JnFAC3OrmnEIwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11706-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 14:42:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C22239E69
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 14:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3E9553010210
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 13:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542C93CA480;
	Mon,  9 Mar 2026 13:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gNkWsSif";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cs1zaU3p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04987375F86;
	Mon,  9 Mar 2026 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773063717; cv=none; b=mqlJJIDTbOzZWgtaTfTERCbWYjEfi323RBlP4HesQgPWNi7XcSk9+DusV1pOiUBENfvh9rE/ySKcCcp21qFCxy9t3gyfoi8a02wxrgDv2zmbj9m5gcma+ZKgE1Wi3kPZE+N2+JQ2L4Phv3kW9rw+nN6WichKZgWVd4vrdY5AkbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773063717; c=relaxed/simple;
	bh=bmubSrJJTIMhH0fVOJKHo/gRjVsGfAJ8Leis0Bme6BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUiul5AGkaUHFezCMHiF6NVaG/fmgZWitBHofAKvr0t1IdqH8jrqtJR2XXV6ko9pqckopAh7vhRUfFtnsNdS7ERuHjLrvva8/Op+zCcprneriEh2I9l61nt2pjQiLAyyTTo3GOOZENP9UyyAX/Ou2cV3KajIN9ORv86XatYjkSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gNkWsSif; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cs1zaU3p; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 9 Mar 2026 14:41:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1773063714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EgzCPop4xIFarrlVVsn9zjz8DR5j/W9u4BJFUbzBqyA=;
	b=gNkWsSifDV9yaAwDP2iCA5fcmjpnLWDVXHxukfg5KTRuS3lcqdXTQZv/ClwEgaOd4Uo2sD
	Qa60GrM3DTOhEo/R1rjAxii6b2qRV/49nMeAt8o7OxhynY1IUvLTocNNeCaItRWg8ELaKv
	LaH1/neaA9MsskQQ4DQwoUrCeXWTX2Lfazf8Ss6RK2je5VV7ON1ZeF8TDSqIc4mmhBgDRH
	DrAxQXSIx5acUIQFOFxO/FGLFQa0gqSlgb1qhS8QVUk6ySe84oCznixFDMmpY3ZrSwefM8
	vy5GVdVhQ78pGE69UORYqpsT71nEJRRaFo4IfkY9Lv36iqT1++bAqyMdhoyDTw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1773063714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EgzCPop4xIFarrlVVsn9zjz8DR5j/W9u4BJFUbzBqyA=;
	b=Cs1zaU3pLOmPT1GZu4r2e2VD+KpVXLTvl7ww+pcQSvPlEHymgSFRckWkgRy8gi70eNdw9u
	9RQNIKjZR2w1VJCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Askar Safin <safinaskar@gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to
 scripts/
Message-ID: <20260309142528-9ad96828-4f07-4cc4-81d6-5aa9b4e9d599@linutronix.de>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
 <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
X-Rspamd-Queue-Id: E1C22239E69
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11706-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:56:30AM +0100, Nicolas Schier wrote:
> get_init_cpio and gen_initramfs.sh are part of kbuild and required for

"gen_init_cpio"

> all kernel builds.  Move it to scripts/ to be more clear about their
> importance.

As far as I can see, gen_init_cpio is currently only built and used if
CONFIG_BLK_DEV_INITRD is enabled. So "required for all kernel builds"
sounds wrong.

This on-demand build can probably be preserved like this:

hostprogs += gen_init_cpio
always-$(CONFIG_BLK_DEV_INITRD) += gen_init_cpio

> Link: https://lore.kernel.org/all/aSdrCFkUQup3qb-q@derry.ads.avm.de/
> Signed-off-by: Nicolas Schier <nsc@kernel.org>
> ---
> 
> Nathan, could this go through kbuild-fixes even though it is not really
> a fix?  Introducing a top-level Makefile target 'usr_gen_init_cpio'
> in v7.0 and renaming it to 'scripts/gen_init_cpio` in v7.1 doesn't sound
> good to me.
> ---
>  MAINTAINERS                       |  1 +
>  Makefile                          | 10 +++++-----
>  scripts/.gitignore                |  1 +
>  scripts/Makefile                  |  2 ++
>  {usr => scripts}/gen_init_cpio.c  |  0
>  {usr => scripts}/gen_initramfs.sh |  2 +-
>  scripts/remove-stale-files        |  2 ++
>  usr/.gitignore                    |  4 +++-
>  usr/Makefile                      |  4 +---
>  9 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..0e374c92941f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13833,6 +13833,7 @@ F:	scripts/basic/
>  F:	scripts/clang-tools/
>  F:	scripts/container
>  F:	scripts/dummy-tools/
> +F:	scripts/gen_init*
>  F:	scripts/include/
>  F:	scripts/install.sh
>  F:	scripts/mk*
> diff --git a/Makefile b/Makefile
> index 0e788ce45457..7798863002ac 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -296,7 +296,7 @@ no-dot-config-targets := $(clean-targets) \
>  			 $(version_h) headers headers_% archheaders archscripts \
>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
>  			 outputmakefile rustavailable rustfmt rustfmtcheck \
> -			 usr_gen_init_cpio \
> +			 scripts/gen_init_cpio \
>  			 run-command
>  no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
>  			  image_name
> @@ -1437,9 +1437,9 @@ ifdef CONFIG_HEADERS_INSTALL
>  prepare: headers
>  endif
>  
> -PHONY += usr_gen_init_cpio
> -usr_gen_init_cpio: scripts_basic
> -	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
> +PHONY += scripts/gen_init_cpio
> +scripts/gen_init_cpio: scripts_basic
> +	$(Q)$(MAKE) $(build)=scripts scripts/gen_init_cpio

The other proxy targets for scripts/ use the 'scripts_' prefix.
Why is this one different?

(...)

> diff --git a/scripts/Makefile b/scripts/Makefile
> index 0941e5ce7b57..039863cd064e 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -52,6 +52,8 @@ ifdef CONFIG_BUILDTIME_MCOUNT_SORT
>  HOSTCFLAGS_sorttable.o += -DMCOUNT_SORT_ENABLED
>  endif
>  
> +hostprogs-always-y += gen_init_cpio
> +
>  # The following programs are only built on demand
>  hostprogs += unifdef gen_packed_field_checks

(...)

