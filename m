Return-Path: <linux-kbuild+bounces-13049-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB0kAcdK+2mYYwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13049-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:05:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 436DD4DBA9F
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:05:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DEC443040ECD
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 14:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B960423A97;
	Wed,  6 May 2026 14:00:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9065247F2CF;
	Wed,  6 May 2026 14:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778076027; cv=none; b=m0vLMBCwby3UTDLM90SIYr3sRmb4Ixfuiyqk86q58QmArt+xPfKCJGaBGqUxkfllJa8iVI3Bqov5yBRRyxsTn6qawK5/LgIUm9fOYOIvdT/Ey0u3E574qrutHNXen4OG653ejfBB59PVJO8dBy1aq8GcYvnV4lBCbXvjDeGygy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778076027; c=relaxed/simple;
	bh=G+3h+8YsM0Pphjby26SISz7F4hK4vY/ZWp/YBakFkIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tdo4ZveqxEixUi4MHB1HELYzY1tV+klP1mphNdlq0NhIy7NO1GLodVWpJQ3V8a14dX7LaWGPC85TnvPBCISp6Dqy3M7G+prF7ynVFRHZM7NcWybIb8hGHIf2zfGDDFsforrJf3MbC+SAcx4jrh/O7c6Pfk8YFlVjZq99n4ipTbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 646Dx5Bn347610;
	Wed, 6 May 2026 08:59:05 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 646DwvZ2347563;
	Wed, 6 May 2026 08:58:57 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 6 May 2026 08:58:57 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, nathan@kernel.org, nsc@kernel.org,
        maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, jpoimboe@kernel.org, ojeda@kernel.org,
        masahiroy@kernel.org, lossin@kernel.org, tamird@kernel.org,
        thomas.weissschuh@linutronix.de, rostedt@goodmis.org,
        ihor.solodrai@linux.dev, thuth@redhat.com, pmladek@suse.com,
        aliceryhl@google.com, elver@google.com, kees@kernel.org,
        legion@kernel.org, ardb@kernel.org, yuxuan.zuo@outlook.com,
        alexghiti@rivosinc.com, alexandre.chartre@oracle.com, bp@alien8.de,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/6] objtool/powerpc: Add build-time fixup of
 alternate feature branch targets
Message-ID: <aftJIWxB70eNRX8l@gate>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
 <afoTSvawD4CXCCy1@gate>
 <20260506070000.GZ3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506070000.GZ3126523@noisy.programming.kicks-ass.net>
X-Rspamd-Queue-Id: 436DD4DBA9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[crashing.org];
	TAGGED_FROM(0.00)[bounces-13049-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_XAW(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[segher@kernel.crashing.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]

Hi!

On Wed, May 06, 2026 at 09:00:00AM +0200, Peter Zijlstra wrote:
> On Tue, May 05, 2026 at 10:56:58AM -0500, Segher Boessenkool wrote:
> > On Tue, May 05, 2026 at 04:45:39PM +0200, Peter Zijlstra wrote:
> > > On Tue, May 05, 2026 at 02:16:23PM +0530, Sathvika Vasireddy wrote:
> > > >  	switch (opcode) {
> > > > +	case 16:
> > > 
> > > Like case 18 below, this wants a comment describing which instruction
> > > this is; bclr ?
> > 
> > Yes.  It is 19/16, b[c]lr (primary opcode 19, secondary opcode 16).
> > 
> > Where is it described what INSN_RETURN actually means for objtool?  Not
> > in the header file :-(
> 
> Yeah, nowhere much I'm afraid, it is very much organic growth that is
> firmly rooted in x86.
> 
> RETURN, along with sibling/tail CALLs validate things like the stack
> frame being in identical state as on function entry and a few other
> sanity checks (DF flag not set, no uaccess).

Huh.

On function entry, there is *no* accessible stack frame, on our ABIs
(typically you can still access your parent's frame of course, but then
you first need to find out who your parent is, etc.)  All stack frames
are always set up by separate store instructions.  We are a RISC
architecture after all (POWER means "Performance Optimisation With
Enhanced RISC").  So objtool checks if we actually tore down all
stack frames?  What a very useful thing to do.

Stack frames are a software concept in the first place, it has nothing
to do with the hardware, *at all*.  This is a bit different on archs
that *actually* have such a thing as a frame pointer, that don't emulate
it using a GPR (or something in memory!)

> There is also a pile of hacks around the whole return thunk mitigation
> thing. But that might be less relevant for other archs.

I don't really want to think about it :-)  Horrors!

There are many other archs where all (or almost all, "all normal", call/
return sequences use a "link register", often called exactly that.  It's
the modern consensus to design call/return around that, I'd say even.
It would be nice if this abstraction worked well ;-)


Segher

