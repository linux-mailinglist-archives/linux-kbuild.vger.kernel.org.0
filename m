Return-Path: <linux-kbuild+bounces-13362-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPa/KCIcF2rw5AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13362-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:30:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E15E7C5D
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 353FF305DB6E
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911FA43636B;
	Wed, 27 May 2026 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k/3yRmk/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAF3E92BF;
	Wed, 27 May 2026 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779899367; cv=none; b=ZOOoMOEjMyg5WyC2mbjxh4/BzKwJFFFcR9sq7fR90v4FOqRnvY/T1flXa6Ej1eCci0AZPoPlDo8s3BWlSAhakyR0vQbjuyLzsm1D87++/BOgqt11luo4ut8u23BvFGyofmi/6nBNlosrIJZU/MdcNaCNIoABpYXHkRA1i98mLGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779899367; c=relaxed/simple;
	bh=VRTGjx/8+1Bu13qMcTJnRTqV/BcgfHue81VOMCaMsWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GD3IiC3djLSPpyYOfiC6eaaYNwTPpixTJSr3uWwoIgouCyboVg2Pxjb3wbnIvT9Tb7armaE/7IViKa2KyKYFtYI252hSX/h0/JKm6ifDB5VFHWsNJO6e/jwc3gbCREUS/gUu1akjcGDenoE4Bro1RjujLKUFTnMmdG/Ft9E5nSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=k/3yRmk/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XPfo5wBIBnpzt7/+hYHfgTVsCpxZSnxw6ivgwktadMc=; b=k/3yRmk/jIT5NcV/KNCe7VsKAA
	2SvOCrdhtz/8sMSXM2MeU6anLS+f9sCJwzQSk48Sp9C4F1BveBA+lhZHNlxH2/H6pEthy3WVO2zaI
	QNxf77vPK9VlxiHrLLv0cJjAUt43kYC+sg9oAV42lIV50m6cQCMrscHgRH3Y92z+gRKPWUB12aAd1
	o9Sl6/fexwsvnG2A+fNJeNK7g2oxZRyuN9Z0OwELvsi4rlxhSrZ3ku+8HSN6wr+hmmmsiM5C5qYow
	T8+XokQ7RGxMlwTU5WAeBzgjLCFeJfYHCQ/3iz5GKkcXBRfySK5Svb/rjoBwvVK9NtZLFZUhJ356N
	M303vK6g==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSH86-0000000EUNK-1gZF;
	Wed, 27 May 2026 16:29:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 19A8A300673; Wed, 27 May 2026 18:29:14 +0200 (CEST)
Date: Wed, 27 May 2026 18:29:14 +0200
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
Subject: Re: [PATCH v2] scripts: Have make TAGS not include structure members
Message-ID: <20260527162914.GH3102624@noisy.programming.kicks-ass.net>
References: <20260527121144.08a1f676@fedora>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527121144.08a1f676@fedora>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux-foundation.org,kernel.org,redhat.com,linux-m68k.org,suse.cz,gmail.com,codeaurora.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	TAGGED_FROM(0.00)[bounces-13362-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goodmis.org:email,infradead.org:dkim,noisy.programming.kicks-ass.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 283E15E7C5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 12:11:44PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> It is really annoying when I use emacs TAGS to search for something
> like "dev_name" and have to go through 12 iterations before I find the
> function "dev_name". I really do not care about structures that include
> "dev_name" as one of its fields, and I'm sure pretty much all other
> developers do not care either.
> 
> There's a "remove_structs" variable used by the scripts/tags.sh, which
> I'm guessing is suppose to remove these structures from the TAGS file,
> but it must do a poor job at it, as I'm always hitting structures when
> I want the actual declaration.
> 
> Luckily, the etags program comes with an option "--no-members", which does
> exactly what I want, and I'm sure all other kernel developers want too.
> 
> Create a new "no_members" variable and assign it to "--no-members" for the
> "TAGS" case and pass that to the etags program to remove structures.
> 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
> Changes since v1: https://lore.kernel.org/all/20131115093645.6dc03918@gandalf.local.home/
> 
> - Use a no_members variable instead of hard coding the --no-members into
>   the etags call, as that can break some "tags" cases. (Michal Marek)

Yeah, I often use member tags.

The tags file have a 'kind' field, what you want is for emacs to order
on kind and prefer 'f' over 'm'.

The alternative is switching to use emacs-lsp, that way the editor knows
the kind of symbol you want. If you're on a function call, it should
only consider 'f' tags. Whereas if the cursor is on a member deref, it
should only consider 'm'.

