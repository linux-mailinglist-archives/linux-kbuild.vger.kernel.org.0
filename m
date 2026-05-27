Return-Path: <linux-kbuild+bounces-13363-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IF5/G4UcF2rw5AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13363-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:32:05 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C65E7CB9
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:32:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C256304AB01
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3A53EEAE0;
	Wed, 27 May 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hPuRrxpB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B58439004;
	Wed, 27 May 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899501; cv=none; b=GMRicHfjqLRI8K61tTb9uZ6/sLhDR8L8FG/lpR+375INdtPmqt/60GtwbVNjLCVIxtK5bdxCImczQXjZYkVJrB340cbm6FYdFKbLUy6+B9stJDqnSIWu3BD3CKTU+2rufMBaps4wMu9UzaqFRxzOQeM4QFGf/v4TPZMKFKeQRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899501; c=relaxed/simple;
	bh=g2Q0qjTWa/IUkx/trVJeZ5AAVyT84s1dGhuGUFl3UKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtIZs08R4+wgtKgT7r9rlO86xn65vcb2tpD6L3Cc0ROiEHyMqXDJhJK8XjHWu1WSe08g994Pvd2BgGcANCrb02wfI8FjGG39iW6NJP6Bs8wcv+2dPG0QRQl8OPUh8kkmt0C5Bcow53Uqlt61ocfqvV+qMO7pYl2NI8Sukux7ev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hPuRrxpB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=j4oBVA28zlAzk7AvPjEe8QcqlFO9bcQTX2Hr2QxJeIs=; b=hPuRrxpB675hZ8S95wzZncDv3S
	8Yzi+NbBRQTH+V+bijJEq7o4mtVneXWq2okk4BOSo0Xy0GPEul98wA/LA1X3YGJDA71Yu/lbTn3Uh
	WqPusaPBsv8zqL6Vcg93aJ6M8pYSQT0eFebBXiwp3771X5KTBTqXkKEnBitF0AQNxLkwmnfZ6eBTW
	FiWGJbfGnYsq67fno1Kix4+Amb5e0vGH3YjxE49zlT4AZ48Cu6JkIdjIlYopWbVMz2UL/l3/M7ZWr
	6unRcCOxOJ9y1yqMR+LJ8b1bT+jJPPkMJkDBcOHX1hVbk/BokaLwxfgr1+IM0o1eU1mczPVAdSTPV
	8T8Wzmbw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHAM-0000000EUi9-32l6;
	Wed, 27 May 2026 16:31:35 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8C0E7300673; Wed, 27 May 2026 18:31:34 +0200 (CEST)
Date: Wed, 27 May 2026 18:31:34 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux trace kernel <linux-trace-kernel@vger.kernel.org>,
	linux-kbuild <linux-kbuild@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Masatake YAMATO <yamato@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Marek <mmarek@suse.cz>, Yang Bai <hamo.by@gmail.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v2] scripts: Have make TAGS not include structure members'
Message-ID: <20260527163134.GW3102924@noisy.programming.kicks-ass.net>
References: <20260527121144.08a1f676@fedora>
 <20260527162914.GH3102624@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527162914.GH3102624@noisy.programming.kicks-ass.net>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux-foundation.org,kernel.org,redhat.com,linux-m68k.org,suse.cz,gmail.com,codeaurora.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	TAGGED_FROM(0.00)[bounces-13363-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,noisy.programming.kicks-ass.net:mid,goodmis.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 098C65E7CB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 06:29:14PM +0200, Peter Zijlstra wrote:
> On Wed, May 27, 2026 at 12:11:44PM -0400, Steven Rostedt wrote:
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > It is really annoying when I use emacs TAGS to search for something
> > like "dev_name" and have to go through 12 iterations before I find the
> > function "dev_name". I really do not care about structures that include
> > "dev_name" as one of its fields, and I'm sure pretty much all other
> > developers do not care either.
> > 
> > There's a "remove_structs" variable used by the scripts/tags.sh, which
> > I'm guessing is suppose to remove these structures from the TAGS file,
> > but it must do a poor job at it, as I'm always hitting structures when
> > I want the actual declaration.
> > 
> > Luckily, the etags program comes with an option "--no-members", which does
> > exactly what I want, and I'm sure all other kernel developers want too.
> > 
> > Create a new "no_members" variable and assign it to "--no-members" for the
> > "TAGS" case and pass that to the etags program to remove structures.
> > 
> > Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> > ---
> > Changes since v1: https://lore.kernel.org/all/20131115093645.6dc03918@gandalf.local.home/
> > 
> > - Use a no_members variable instead of hard coding the --no-members into
> >   the etags call, as that can break some "tags" cases. (Michal Marek)
> 
> Yeah, I often use member tags.
> 
> The tags file have a 'kind' field, what you want is for emacs to order
> on kind and prefer 'f' over 'm'.
> 
> The alternative is switching to use emacs-lsp, that way the editor knows
> the kind of symbol you want. If you're on a function call, it should
> only consider 'f' tags. Whereas if the cursor is on a member deref, it
> should only consider 'm'.

That said, setting up clangd on the kernel tree is rather more painful
that I'd like it to be :-(

