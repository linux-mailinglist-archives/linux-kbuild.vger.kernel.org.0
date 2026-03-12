Return-Path: <linux-kbuild+bounces-11889-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEI0JuLJsmmvPAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11889-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 15:12:50 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 459222731FF
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 15:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A79803007B8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 14:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C63D34D4CB;
	Thu, 12 Mar 2026 14:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZl5tOXM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9ED40DFD5;
	Thu, 12 Mar 2026 14:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773324766; cv=none; b=ce8jeGowAyxPeFTDrDuk8h+3pgFhvvRR+DFSXqrtLRXEWJr8SDBB8vqHEC76KonkPqaCUEMH3gU2cegamQB3X41cj6WG1cWfq/rzNM5PBWMf4TH+nwsfpcfGaNSK8UiUaWaIUkXyC5puZsaoSUvLbw5vtFNhsFpNpB2viJZak+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773324766; c=relaxed/simple;
	bh=V7rFl54OMTjCn3sPVkn2YhvxKQBaoCS02SSYDvGmyhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYlJDW8YgDxRW8asGJdEA1DfDmfZ1imZilPFbOqUr7XYda0PB3xfFvHwGJeFjWFqX2C+w6TemzgGDg6ulOp/8rBMT620N8NH/OBOupFrC8JoXFrUU8aabjUReZvH+Hf52mqTMUrszeWHZ79I5zIdnM2gsp96/6QRgR5kcuMyEMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZl5tOXM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D08C2BC86;
	Thu, 12 Mar 2026 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773324766;
	bh=V7rFl54OMTjCn3sPVkn2YhvxKQBaoCS02SSYDvGmyhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JZl5tOXMU1UvmzhilvwfV7FTiL6m4xPtnsEQcJ9rP7uZ6XZZjCt1vKsRkoT09Bh0h
	 rQeq0QBGcT0wtSwpYcToLxJ5M/7U/rrrMz6TgRyD1wA3iEnQFey24pAosddm6LJafs
	 24b9ufAevju6gx/gIlO+9vepoA1CbVDJXXks0dlc1zLFtY6dCjBVIyqTMsIgqjoBZx
	 wl09/i6YaldJxEFQ2bEsnEG8aVhK/aqWDrtEbiASAvnmJd13yZWoRwIk92Hq2YK7D0
	 2h1QXg8x6ebo+D9wV2GsqjhVk/MBiysfVWEW4Zva5A2LZYq51nM7G9Ra3lBWreA0BP
	 bQqgw9lAHXe7g==
Date: Thu, 12 Mar 2026 14:59:18 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Askar Safin <safinaskar@gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to
 scripts/
Message-ID: <abLGtvKEWUYjNF81@derry.ads.avm.de>
References: <20260309-move-gen_init_cpio-to-scripts-v1-0-0c5059b1ec5b@kernel.org>
 <20260309-move-gen_init_cpio-to-scripts-v1-2-0c5059b1ec5b@kernel.org>
 <20260309142528-9ad96828-4f07-4cc4-81d6-5aa9b4e9d599@linutronix.de>
 <aa_E3J-iRjUO4ToP@derry.ads.avm.de>
 <20260310100543-744f324c-5ce6-4326-81fb-8fe1abb58d93@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310100543-744f324c-5ce6-4326-81fb-8fe1abb58d93@linutronix.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11889-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 459222731FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 10, 2026 at 10:13:29AM +0100, Thomas Weiﬂschuh wrote:
> On Tue, Mar 10, 2026 at 08:14:36AM +0100, Nicolas Schier wrote:
> > On Mon, Mar 09, 2026 at 02:41:53PM +0100, Thomas Weiﬂschuh wrote:
> > > On Mon, Mar 09, 2026 at 08:56:30AM +0100, Nicolas Schier wrote:
> 
> (...)
> 
> > > > @@ -1437,9 +1437,9 @@ ifdef CONFIG_HEADERS_INSTALL
> > > >  prepare: headers
> > > >  endif
> > > >  
> > > > -PHONY += usr_gen_init_cpio
> > > > -usr_gen_init_cpio: scripts_basic
> > > > -	$(Q)$(MAKE) $(build)=usr usr/gen_init_cpio
> > > > +PHONY += scripts/gen_init_cpio
> > > > +scripts/gen_init_cpio: scripts_basic
> > > > +	$(Q)$(MAKE) $(build)=scripts scripts/gen_init_cpio
> > > 
> > > The other proxy targets for scripts/ use the 'scripts_' prefix.
> > > Why is this one different?
> > 
> > Good question; I was ambiguous about that, but I chose 'scripts/' in
> > favor of 'scripts_' as
> > 
> > 1. The $(obj)/initramfs_data.cpio target in usr/Makefile has to depend
> >    on 'scripts/gen_init_cpio' regardless of how the top-level target is
> >    called, as the sub-make cannot depend on a phony top-level rule.
> >    If possible, I like to have the same name for dependencies as for the
> >    rule that generates them.
> > 
> > 2. I cannot see the reason for the 'scripts_' prefix currently used in
> >    top-level Makefile for real targets building a single output file.
> >    It seems to me that commit bdd7714b6f4c ("kbuild: build all
> >    prerequisites of headers_install simultaneously") introduced the
> >    'scripts_' prefix due to the historic origin 'scripts_basic'; which
> >    itself came with commit 952a0ae394f4 ("[PATCH] Fix early parallel
> >    make failures", v2.6.5) [1].  I _guess_ the 'scripts_' prefix was
> >    meant to clearly make a difference from the previous 'scripts'
> >    target, and the name makes clear that it is a phony target building
> >    several things.
> > 
> > Masahiro, if you are around I'd appreciate a comment from you.
> > 
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=952a0ae394f4
> > 
> > Thomas, does the reasoning make sense to you?  Or do you expect troubles
> > due to the 'scripts/' prefix?
> 
> Sounds reasonable. Personally I would still prefer consistency, but that is
> subjective of course.

I'll be considering that.

> In any case:
> Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Thanks!

