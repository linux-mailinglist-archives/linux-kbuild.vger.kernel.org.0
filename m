Return-Path: <linux-kbuild+bounces-13050-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DCaLhdR+2mSZQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13050-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:32:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA8C4DC3F9
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 88F1331491B7
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 14:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FDD47ECF9;
	Wed,  6 May 2026 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Lu5PJll/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9940E48035B;
	Wed,  6 May 2026 14:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077367; cv=none; b=r9q6ORmZy4gMZ25nupx8zMGnJ0sLJsUJHB7GKXd6Tl9OP8WF6ouAhK8Rp7atqc8XquMghnlSr0REIT2cdfHbnydF9PRgpqo0WITAbnke8tcL7kauaZwWkxUf6JE9pwoW72vDo6l7F7RNbbzgmazKMhrymSe46jYcXDGY6HZjkqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077367; c=relaxed/simple;
	bh=dQUS6bl1S9/SlgE4tplGsaWuBdKxPm9PuxmQh4VjtE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=giQUjh4XkGrWQJM5epb3ASAzuBjQMKieNe3FxtuJwXsv48qKe/k9wRhI3s2xR1Wbpm0ztIJHGh5Wd/BtsIq6ALZAwXJPKibbVHvG8oZt/PxGol0ej6Lx1xKPUEXVj6o89fjzUsfns69vyeV/6RY9MDrol3hpBRBzRjC+IdeO2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Lu5PJll/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VmAS648/kcaQ/LEkA2wqHc5ENPuoTr9ZPMlVRMOgdMY=; b=Lu5PJll/0x3f0vhnejQ21r0/JI
	FbIt7A+P0Tw6TBmqd4g8bGojwQEL4FTJxc4UY5wDFvDhQG1+iF33oz4IgEgh9xJPSSvoDtWNY5H+Q
	yWUMWHHPWyPJAnjvyFMcDu1y5YG5D1THIOcaNTr+78Qqa1a2ruLJwzN5VXF6E2hzOkw1MPCoqtykt
	33ID+PToQX92vdgxv1K6pDsIwuepGjBPZiMsx/Jnr85oM1BadqoPv+s1dmmbSRHK9PcU925TDtIOk
	nrCE/RJ9EdNE/fawOfcvKTynx57WQLWL1S61dwIB2VEmmItHVsZNNzAqdaUgpc7MDIbbAGdTwKUyI
	PR1qB+EQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKd8h-00000001KYx-3ETU;
	Wed, 06 May 2026 14:22:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A91E2303011; Wed, 06 May 2026 16:22:14 +0200 (CEST)
Date: Wed, 6 May 2026 16:22:14 +0200
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
Message-ID: <20260506142214.GD3126523@noisy.programming.kicks-ass.net>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
 <afoTSvawD4CXCCy1@gate>
 <20260506070000.GZ3126523@noisy.programming.kicks-ass.net>
 <aftJIWxB70eNRX8l@gate>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aftJIWxB70eNRX8l@gate>
X-Rspamd-Queue-Id: 0DA8C4DC3F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13050-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noisy.programming.kicks-ass.net:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 08:58:57AM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Wed, May 06, 2026 at 09:00:00AM +0200, Peter Zijlstra wrote:
> > On Tue, May 05, 2026 at 10:56:58AM -0500, Segher Boessenkool wrote:
> > > On Tue, May 05, 2026 at 04:45:39PM +0200, Peter Zijlstra wrote:
> > > > On Tue, May 05, 2026 at 02:16:23PM +0530, Sathvika Vasireddy wrote:
> > > > >  	switch (opcode) {
> > > > > +	case 16:
> > > > 
> > > > Like case 18 below, this wants a comment describing which instruction
> > > > this is; bclr ?
> > > 
> > > Yes.  It is 19/16, b[c]lr (primary opcode 19, secondary opcode 16).
> > > 
> > > Where is it described what INSN_RETURN actually means for objtool?  Not
> > > in the header file :-(
> > 
> > Yeah, nowhere much I'm afraid, it is very much organic growth that is
> > firmly rooted in x86.
> > 
> > RETURN, along with sibling/tail CALLs validate things like the stack
> > frame being in identical state as on function entry and a few other
> > sanity checks (DF flag not set, no uaccess).
> 
> Huh.
> 
> On function entry, there is *no* accessible stack frame, on our ABIs
> (typically you can still access your parent's frame of course, but then
> you first need to find out who your parent is, etc.)  All stack frames
> are always set up by separate store instructions.  We are a RISC
> architecture after all (POWER means "Performance Optimisation With
> Enhanced RISC").  So objtool checks if we actually tore down all
> stack frames?  What a very useful thing to do.
> 
> Stack frames are a software concept in the first place, it has nothing
> to do with the hardware, *at all*.  This is a bit different on archs
> that *actually* have such a thing as a frame pointer, that don't emulate
> it using a GPR (or something in memory!)

So, remember that objtool was born to generate ORC stack unwind data.
It needs to track the stack state at every instruction to accomplish
this.

One of the basic sanity checks it does is ensuring there is no lingering
stack state on RETURN -- this would obviously cause the
caller/returned-to context to get a wee bit upset.

And yes, I realize this might sound quite mad to a compiler person. But
remember that we have a ton of ASM (inline and otherwise) mixed in with
our C code. And while you can add DWARF CFI to ASM, this has
historically been a bit of a trainwreck, not in the least because the
annotations got wrong and nothing warned about it until the unwinder
would explode.

Objtool solves all of that, by doing build time reconstruction of the
control flow and stack state it guarantees everything is consistent at
build time. Additionally it can deal with fun things like alternatives
/ static branches etc.

It can deal with both -fframe-pointer and -fomit-frame-pointer (on x86).
When the frame pointer reg (BP) is used, it also validates this is done
correctly.

This has caught many whoopsies over the years.

Then because this thing is parsing object files and decoding control
flow, features were added, like the uaccess scope checks.

> > There is also a pile of hacks around the whole return thunk mitigation
> > thing. But that might be less relevant for other archs.
> 
> I don't really want to think about it :-)  Horrors!
> 
> There are many other archs where all (or almost all, "all normal", call/
> return sequences use a "link register", often called exactly that.  It's
> the modern consensus to design call/return around that, I'd say even.
> It would be nice if this abstraction worked well ;-)

Agreed. Its just that this thing has a very strong x86 flavour per its
legacy ;-) We'll get it sorted.

