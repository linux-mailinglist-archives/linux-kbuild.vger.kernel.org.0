Return-Path: <linux-kbuild+bounces-11760-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFUyMCzFr2nWcAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11760-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 08:15:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 206DB2462F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 08:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9089930A2519
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 07:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5C13DA7EE;
	Tue, 10 Mar 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jb3uMu+W"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BAE3D9029;
	Tue, 10 Mar 2026 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773126930; cv=none; b=sgN6U2eNkbIi6cX9rl/Fi1QyCu1T6taZMewnirPyNo4/9F9jEdSC67yrkMaD8qqSklOKA+79CUP1RGeHlqhKyQYt5JHXjETUFPlJi7cr2odjsTKHRck1WaOalyhuH2ohJEsmwG+0fXTVqh1mtqlqoD7kexEagK3Je2C1Afvmds0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773126930; c=relaxed/simple;
	bh=B0FCgYBLtWci4qz8BNoJQYYU85sSX4FJ/CoV33bq4D8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TG0CxaSGGmov6v7jdvSHS6UxH3Aa+GUPQg8PwmagTLiSRrveyCsfcam3KoGO8S3t1gAcuKkY9tqCdskjjZ8cOypmE3T2XUK+z1rdWZeHqdQt2+FDjNtwhzUTmAhvACosR6yVqwZ+/EaEdDbawykWZo7XLXMhGNGsbcHEOC6JB7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jb3uMu+W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BF8C19423;
	Tue, 10 Mar 2026 07:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773126929;
	bh=B0FCgYBLtWci4qz8BNoJQYYU85sSX4FJ/CoV33bq4D8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jb3uMu+WIQ1/mAJa+U+INFB2Mp6QxxZCK6NxoVjurrcMU3TzcZUW8Zk6q3+0hT1D1
	 Kd2ZtE6okIFGHZ5cMULq1nyO5kbfIX3M0FvxkadiIgiYckAOEafoHkrZK1StHUQWlo
	 s1aZGkHclzSHy41cnv69TTjaK4QJolvjso49qYbE1WOkN6uhmfCYywMzdStQxoW9IN
	 tABVYjMY4kgn2KvmM92u8HetSXh3WO+zZ18D+0RadbicE6j5W3hoN1vLOmo7zsUSfq
	 ANglmrwgNCGy0SUmk3pHGSic6FvNfVcG9Vh6ahEU7J1jQMNQK/Rlww+dUdKnRSWURX
	 9Aj0G4T5vXOwQ==
Date: Tue, 10 Mar 2026 08:14:36 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Askar Safin <safinaskar@gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to
 scripts/
Message-ID: <aa_E3J-iRjUO4ToP@derry.ads.avm.de>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
 <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
 <20260309142528-9ad96828-4f07-4cc4-81d6-5aa9b4e9d599@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309142528-9ad96828-4f07-4cc4-81d6-5aa9b4e9d599@linutronix.de>
X-Rspamd-Queue-Id: 206DB2462F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11760-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[derry.ads.avm.de:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gen_initramfs.sh:url]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 02:41:53PM +0100, Thomas Weißschuh wrote:
> On Mon, Mar 09, 2026 at 08:56:30AM +0100, Nicolas Schier wrote:
> > get_init_cpio and gen_initramfs.sh are part of kbuild and required for
> 
> "gen_init_cpio"

thanks!

> > all kernel builds.  Move it to scripts/ to be more clear about their
> > importance.
> 
> As far as I can see, gen_init_cpio is currently only built and used if
> CONFIG_BLK_DEV_INITRD is enabled. So "required for all kernel builds"
> sounds wrong.
> 
> This on-demand build can probably be preserved like this:
> 
> hostprogs += gen_init_cpio
> always-$(CONFIG_BLK_DEV_INITRD) += gen_init_cpio

Ack, thanks!  I'll take your suggestion.

...
> > diff --git a/Makefile b/Makefile
> > index 0e788ce45457..7798863002ac 100644
> > --- a/Makefile
> > +++ b/Makefile
...
> > @@ -1437,9 +1437,9 @@ ifdef CONFIG_HEADERS_INSTALL
> >  prepare: headers
> >  endif
> >  
> > -PHONY += usr_gen_init_cpio
> > -usr_gen_init_cpio: scripts_basic
> > -	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
> > +PHONY += scripts/gen_init_cpio
> > +scripts/gen_init_cpio: scripts_basic
> > +	$(Q)$(MAKE) $(build)=scripts scripts/gen_init_cpio
> 
> The other proxy targets for scripts/ use the 'scripts_' prefix.
> Why is this one different?

Good question; I was ambiguous about that, but I chose 'scripts/' in
favor of 'scripts_' as

1. The $(obj)/initramfs_data.cpio target in usr/Makefile has to depend
   on 'scripts/gen_init_cpio' regardless of how the top-level target is
   called, as the sub-make cannot depend on a phony top-level rule.
   If possible, I like to have the same name for dependencies as for the
   rule that generates them.

2. I cannot see the reason for the 'scripts_' prefix currently used in
   top-level Makefile for real targets building a single output file.
   It seems to me that commit bdd7714b6f4c ("kbuild: build all
   prerequisites of headers_install simultaneously") introduced the
   'scripts_' prefix due to the historic origin 'scripts_basic'; which
   itself came with commit 952a0ae394f4 ("[PATCH] Fix early parallel
   make failures", v2.6.5) [1].  I _guess_ the 'scripts_' prefix was
   meant to clearly make a difference from the previous 'scripts'
   target, and the name makes clear that it is a phony target building
   several things.

Masahiro, if you are around I'd appreciate a comment from you.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=952a0ae394f4

Thomas, does the reasoning make sense to you?  Or do you expect troubles
due to the 'scripts/' prefix?


Thanks for the feedback!

Kind regards,
Nicolas

