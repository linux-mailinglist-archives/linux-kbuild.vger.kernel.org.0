Return-Path: <linux-kbuild+bounces-13043-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP1nBCjr+mkZUQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13043-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 09:18:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 663B14D71D0
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 09:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 365EB303C4DB
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 07:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34F736EA9F;
	Wed,  6 May 2026 07:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M+uwskEF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CB36E460;
	Wed,  6 May 2026 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778051578; cv=none; b=AMgQ5ZJfQ++LPSt8C9wM9/yOT/D++9lWF0cRwEJv0wujm2w3u1bhs4gCGAodnnfnFPkd145r+lsI58Vi6udaY4W42GKDmIXqIcdpDTWgHO+TB100Qw9N+D4odDfwz8o/CQw9AXPXYBw9TIkD8Wvvk2nexNcW0+7XGKPaDzKT/uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778051578; c=relaxed/simple;
	bh=ckgl5FC++LQkxsEuWHsMEQzZ3zl/leQjXP4KZ/u7DFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3WyVQga9LiBtJezGRO1o0Xw31akou7r+3Hsf2wHiwSHIC8Z5mP0tQ+swITNdDzvG/GXA2tIvyiJ2QuYm1Fj8zIGDsNLGhVHU59dd2fMrIZQftccHH5AyR69YZoe6sIlff2mTOLbv1okJsa0I7Xiy0Q5KA6YR0oiGnOxhpuM44k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=M+uwskEF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fMovDlk88JtntvXu/seZ66F90g7SFyxentqAJGuZSZY=; b=M+uwskEFSiaSfENlDe8KMqTC1m
	z/xTI76HSzdMfAX6DI7dyOyOndAEg5QHoBeIMOaMO9cKEx+A0yexAvUqVMPQ6LaVh1ixCTd3VkwrD
	2ID0X0crB5mrQWMV92h9j81QWloJomAuUhm2dSGngaFraGXKjLCH2dr9F+kDoqaW7XJ8U52yFOxCu
	qqrNUFrWAzJe7t8o8x3wMVBKgaLiLTLb3OjFuEyY0GwYZwE6oFQtkTMdw3mQkLWmIZq5axoigcXa1
	/o9icvzx3RrpaKhSFcUlVqbzDu9pId82D19w37tpX91ULPxcpy2Fqy5qvnWZi8MqfsRV5AgTx0Yy/
	LQDoOjeg==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWEk-00000000jO3-2Yoc;
	Wed, 06 May 2026 07:00:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DE881302EC2; Wed, 06 May 2026 09:00:00 +0200 (CEST)
Date: Wed, 6 May 2026 09:00:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, nathan@kernel.org,
	nsc@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, jpoimboe@kernel.org,
	ojeda@kernel.org, masahiroy@kernel.org, lossin@kernel.org,
	tamird@kernel.org, thomas.weissschuh@linutronix.de,
	rostedt@goodmis.org, ihor.solodrai@linux.dev, thuth@redhat.com,
	pmladek@suse.com, aliceryhl@google.com, elver@google.com,
	kees@kernel.org, legion@kernel.org, ardb@kernel.org,
	yuxuan.zuo@outlook.com, alexghiti@rivosinc.com,
	alexandre.chartre@oracle.com, bp@alien8.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/6] objtool/powerpc: Add build-time fixup of
 alternate feature branch targets
Message-ID: <20260506070000.GZ3126523@noisy.programming.kicks-ass.net>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
 <afoTSvawD4CXCCy1@gate>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afoTSvawD4CXCCy1@gate>
X-Rspamd-Queue-Id: 663B14D71D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13043-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:dkim]

On Tue, May 05, 2026 at 10:56:58AM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Tue, May 05, 2026 at 04:45:39PM +0200, Peter Zijlstra wrote:
> > On Tue, May 05, 2026 at 02:16:23PM +0530, Sathvika Vasireddy wrote:
> > >  	switch (opcode) {
> > > +	case 16:
> > 
> > Like case 18 below, this wants a comment describing which instruction
> > this is; bclr ?
> 
> Yes.  It is 19/16, b[c]lr (primary opcode 19, secondary opcode 16).
> 
> Where is it described what INSN_RETURN actually means for objtool?  Not
> in the header file :-(

Yeah, nowhere much I'm afraid, it is very much organic growth that is
firmly rooted in x86.

RETURN, along with sibling/tail CALLs validate things like the stack
frame being in identical state as on function entry and a few other
sanity checks (DF flag not set, no uaccess).

There is also a pile of hacks around the whole return thunk mitigation
thing. But that might be less relevant for other archs.

