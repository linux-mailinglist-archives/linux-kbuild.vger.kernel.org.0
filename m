Return-Path: <linux-kbuild+bounces-13917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AT1eLukxRWoC8goAu9opvQ
	(envelope-from <linux-kbuild+bounces-13917-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Jul 2026 17:27:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5E96EF3C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Jul 2026 17:27:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=y3IsDuT9;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=2iLDdrhv;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13917-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13917-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EC3E3025282
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2026 15:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2022234D90D;
	Wed,  1 Jul 2026 15:19:56 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68364342514;
	Wed,  1 Jul 2026 15:19:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919196; cv=none; b=S5uoFxJUxlcSktsNzKpDOKkl5d5wnBZSmwGZuTcJZSo2RW7yyCfPanhcET+bdvD0AHjIVFyjjkmKR03A3Ezfi+GkXDawvQnFnwLGNCHpmLBlnBeKIs+8WQxCvDJKwBDs4svzzEs5y3CUvGunNfRQNbpzZK/7q/XFqhaCzHemfms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919196; c=relaxed/simple;
	bh=Va1WsMw6g8CID4aKmdFlMtmgVQRP2YCIPPta56rnnw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TykWNyLcQIIO8vVCmPobVPAQj7i8Uor4mRT9ktcV8Ra4RzFQW7Lh+Yw9aEmc6EvelHC6ABC383gJBACEF31p4eWDuyazzUQwlVo3Kv9QBf+rAH7K3A0joBVXQPGjvudhThKe+gSqZZa+eiUR162zfCmWy9/0JNRDFJuVEW46mB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=y3IsDuT9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2iLDdrhv; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 1 Jul 2026 17:19:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782919192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuB/NFXI2ywL2Wt3asGMBPy8oadX8xY2jSEUGl9P02I=;
	b=y3IsDuT9yxbotxD/voDHf63AsceXixR4RT+dwnGV/f9yshLh8VjKHEOEe1+LMBRUbZjmcx
	PvWHkL43f/a1+T7VIVaU0Z+ZOPYaOCygwirqRfrBOrZrQj0wtfHcPTXR4YLoxIYrgJY0MG
	HXRq5JXBHrT5eiHogWhkO+Unogli/PvMh73km97jvxgdcjWWHEkJLeO/ZXj6IqIQV+4tAS
	A/RJvhtR8fIviV9QXmFqa3Cfn/I9TctAX4i508WsQzR4IqYxZL1WSGifvQwaoMOyFlLc15
	D8Z02XpuDO/AU38iy4AHtwfdSSUFjcrQ8s8mkoiOJVpihejTc9bD9ZZ1IN7zcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782919192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IuB/NFXI2ywL2Wt3asGMBPy8oadX8xY2jSEUGl9P02I=;
	b=2iLDdrhvJcE4vYrFknYpd6wLnXLCFJyykBVjAixtMCO/NJ9xGsI6e4fa4T5GM5fZ9aM5nj
	W8H3NQIR00zm2KDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Petr Mladek <pmladek@suse.com>
Cc: Zelin Deng <zelin.deng@linux.alibaba.com>, 
	Miroslav Benes <mbenes@suse.cz>, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	live-patching@vger.kernel.org, mpdesouza@suse.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] selftests: livepatch: unset sub_make_done in case top
 level Makefile be overwritten
Message-ID: <20260701171713-7dd2f65f-abe2-4ae6-bcd4-e0bcdada6bed@linutronix.de>
References: <20260525083721.27857-1-zelin.deng@linux.alibaba.com>
 <alpine.LSU.2.21.2606191638540.26638@pobox.suse.cz>
 <ccfed9b6-9a73-4299-b305-da7b593a52fd@linux.alibaba.com>
 <akPTcJjrIAI1ZNyH@pathway.suse.cz>
 <20260630181125-a7a41726-4270-4bb7-92fe-17ec28cbe176@linutronix.de>
 <akUu0DEYrhd9cLCL@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akUu0DEYrhd9cLCL@pathway.suse.cz>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13917-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:zelin.deng@linux.alibaba.com,m:mbenes@suse.cz,m:shuah@kernel.org,m:linux-kselftest@vger.kernel.org,m:live-patching@vger.kernel.org,m:mpdesouza@suse.com,m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,linutronix.de:dkim,linutronix.de:mid,linutronix.de:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D5E96EF3C3

On Wed, Jul 01, 2026 at 05:14:24PM +0200, Petr Mladek wrote:
> On Tue 2026-06-30 18:12:46, Thomas Weißschuh wrote:
> > Hi Zelin,
> > 
> > On Tue, Jun 30, 2026 at 04:32:16PM +0200, Petr Mladek wrote:
> > > Added some people involved in "filechk_makefile" feature into Cc.
> > > 
> > > For the new people, see the whole thread at
> > > https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/
> > 
> > Thanks for the report and forwarding it.
> > 
> > > On Sun 2026-06-21 22:36:24, Zelin Deng wrote:
> > > > 
> > > > 在 2026/6/19 22:42, Miroslav Benes 写道:
> > > > > On Mon, 25 May 2026, Zelin Deng wrote:
> > > > Here're how I reproduce the issue:
> > > > 
> > > > 1. pull linux-next, reset to HEAD, for example
> > > > 3ce97bd3c4f18608335e709c24d6a40e7036cab8 (tag next-20260619)
> > > > 
> > > > 2. at linux-next tree: make all -j$(nproc) && make modules_install
> > > > headers_install -j$(nproc) && make install && reboot
> > > > 
> > > > 3. at linux-next tree: make kselftest-all
> > > > 
> > > > 4. top level Makefile in linux-next has been overwritten by
> > > > 
> > > >     export KBUILD_OUTPUT = .
> > > >     export KBUILD_EXTMOD = /home/shiyu.dzl/linux-next
> > > >     export KBUILD_EXTMOD_OUTPUT = /home/shiyu.dzl/linux-next
> > > >     include /home/shiyu.dzl/linux-next/Makefile
> > > > 
> > > > it is a stub generated by filechk_makefile.
> > > 
> > > It seems that "filechk_makefile" has reached mainline in v7.1-rc1,
> > > see the commit c9bb03ac2c66bc5aa81b ("kbuild: reduce output spam when
> > > building out of tree").
> > > 
> > > The commit message says:
> > > 
> > > <paste>
> > >     The Makefile is now created even if the build is aborted due to an
> > >     unclean working tree. That should not make a difference in practice.
> > >  </paste>
> > > 
> > > It seems that is actually makes a difference in the livepatch selftest
> > > case.
> > > 
> > > Sigh, the Makefile rules are a maze to me. It is possible that
> > > we do something wrong in
> > > tools/testing/selftests/livepatch/test_modules/Makefile. Namely
> > > with:
> > > 
> > > ifneq ("$(wildcard $(KDIR))", "")
> > > 	$(Q)$(MAKE) -C $(KDIR) modules KBUILD_EXTMOD=$(TESTMODS_DIR)
> > > endif
> > > 
> > > But I see "$(MAKE) -C ..." called in many other makefiles.
> > > 
> > > Best Regards,
> > > Petr
> > > 
> > > > I'm not quite sure that it could be related to my toolchain (like make
> > > > version ?), I briefed analysis the root cause on my environment (KDIR
> > > > '/lib/modules/7.1.0-next-20260619/build' which actually a symbol link to my
> > > > kernel source -> '/home/shiyu.dzl/linux-next'):
> > > > 
> > > >   1. sub_make_done leaks via environment. The top-level Makefile sets export
> > > > sub_make_done := 1 after its first-pass initialization.
> > > >   Because it is exported, every child make process inherits it.
> > > >   2. livepatch test_modules re-invokes the top-level Makefile. The call
> > > > chain is: top-level Makefile → kselftest-% pattern rule →
> > > >   tools/testing/selftests/ → livepatch test_modules/Makefile → $(MAKE) -C
> > > > $(KDIR) modules KBUILD_EXTMOD=..., which re-enters the top-level Makefile to
> > > >   build an external module.
> > > >   3. The inherited sub_make_done=1 skips critical initialization. The
> > > > top-level Makefile's first-pass block (ifneq ($(sub_make_done),1)) is
> > > >   skipped entirely. This block is responsible for correctly parsing
> > > > command-line variables and setting up KBUILD_EXTMOD-related paths.
> > > >   4. Path mismatch triggers false out-of-tree detection. With the
> > > > initialization skipped, srcroot and CURDIR end up with mismatched values
> > > > (e.g.,
> > > >   absolute vs. relative). The comparison (ifeq ($(srcroot),$(CURDIR)))
> > > > fails, so building_out_of_srctree is incorrectly set to 1.
> > > >   5. outputmakefile overwrites the source tree's Makefile. Because
> > > > building_out_of_srctree is set, the filechk_makefile rule fires and replaces
> > > > the
> > > >   real top-level Makefile with a generated stub containing KBUILD_OUTPUT,
> > > > KBUILD_EXTMOD, and an include directive.
> > > > 
> > > >   Why make -C tools/testing/selftests/ all is unaffected: it enters the
> > > > selftests directory directly without ever executing the top-level Makefile
> > > >   first, so sub_make_done is never exported into the environment. When
> > > > livepatch test_modules later invokes $(MAKE) -C $(KDIR), the top-level
> > > > Makefile
> > > >   runs its full initialization normally.
> > 
> > Can you try this:
> > 
> > diff --git a/Makefile b/Makefile
> > index b9c5792c79e0..f717a4dc96d6 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1591,10 +1591,10 @@ tools/%: FORCE
> >  
> >  PHONY += kselftest
> >  kselftest: headers
> > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests run_tests
> >  
> >  kselftest-%: headers FORCE
> > -	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
> > +	$(Q)unset sub_make_done; $(MAKE) -C $(srctree)/tools/testing/selftests $*
> >  
> >  PHONY += kselftest-merge
> >  kselftest-merge:
> 
> Heh, this is exactly the same change which Zelin Deng proposed as
> well, see
> https://lore.kernel.org/all/20260525083721.27857-1-zelin.deng@linux.alibaba.com/

The difference is that my proposal is in the toplevel Makefile while
Zelin's is in the selftest one. The toplevel one should fix all selftests at
the same time.

> > The same is done for cmd_install.
> 
> I guess that this is related to the commit 14ccc638b02f9ec ("kbuild:
> cancel sub_make_done for the install target to fix DKMS"). Which
> is related to the commit bcf637f54f6d2515d ("kbuild: parse C= and M=
> before changing the working directory").
> 
> Honestly, it all looks like a wild magic to me. I would need much
> better understanding of the Makefile maze to get on top of it.

I was not able to reproduce the issue yet. My proposal is just a guess.
We'll need feedback from Zelin.

> But it seems that it is a reasonable fix after all. It solves the
> original problem. It does not break my workflow. So, I tend to add:
> 
> Acked-by: Petr Mladek <pmladek@suse.com>


Thomas

