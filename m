Return-Path: <linux-kbuild+bounces-13052-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA+GOUhU+2n+ZQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13052-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:46:32 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9834DC843
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BC3FC30058F2
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 14:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1992481AB6;
	Wed,  6 May 2026 14:43:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FD4481AA7;
	Wed,  6 May 2026 14:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778078639; cv=none; b=JyuKKasbY12eswmDh74cvEx/vq3H0BmQxG+MfiVRAiUBmFvuxBsWKTgHONs980IEyZ63VPnpvfHMBfVSTfiLn81NDe8LefJWjI693vxu8TtNZNuTdB9pkPMRhpNaw6+U+TdJgKSJI9x4euopkJio2LMkuuD9kRLBgFT/15fh4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778078639; c=relaxed/simple;
	bh=8B6L7L5xVUZFI2Z+U+M20LmRHdQgho0IY2aiJdLqc8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzRwt40FXR/JnA7/pSPQM1K5tjzkwoeo5kl6vu9WbB2BJ7ZcwBEfzMnToDhiB0qR7Qe0E5PFdY53+oFPBgv6nABDtADsCD4E4GATTpXNkVzIsSe25VkqoKMHAvAD/P7BHu92c4w9Xhia/CGAHBYI6hWLF/KJ5EQvAVyuM/bVT7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 646Eh2V8354877;
	Wed, 6 May 2026 09:43:02 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 646Egtn5354867;
	Wed, 6 May 2026 09:42:55 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 6 May 2026 09:42:55 -0500
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
Message-ID: <aftTbxYxnnfFr_rn@gate>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
 <afoTSvawD4CXCCy1@gate>
 <20260506070000.GZ3126523@noisy.programming.kicks-ass.net>
 <aftJIWxB70eNRX8l@gate>
 <20260506142214.GD3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506142214.GD3126523@noisy.programming.kicks-ass.net>
X-Rspamd-Queue-Id: 8C9834DC843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[crashing.org];
	TAGGED_FROM(0.00)[bounces-13052-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	HAS_XAW(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[segher@kernel.crashing.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]

Hi!

On Wed, May 06, 2026 at 04:22:14PM +0200, Peter Zijlstra wrote:
> On Wed, May 06, 2026 at 08:58:57AM -0500, Segher Boessenkool wrote:
> > Huh.
> > 
> > On function entry, there is *no* accessible stack frame, on our ABIs
> > (typically you can still access your parent's frame of course, but then
> > you first need to find out who your parent is, etc.)  All stack frames
> > are always set up by separate store instructions.  We are a RISC
> > architecture after all (POWER means "Performance Optimisation With
> > Enhanced RISC").  So objtool checks if we actually tore down all
> > stack frames?  What a very useful thing to do.
> > 
> > Stack frames are a software concept in the first place, it has nothing
> > to do with the hardware, *at all*.  This is a bit different on archs
> > that *actually* have such a thing as a frame pointer, that don't emulate
> > it using a GPR (or something in memory!)
> 
> So, remember that objtool was born to generate ORC stack unwind data.
> It needs to track the stack state at every instruction to accomplish
> this.

Yup.

> One of the basic sanity checks it does is ensuring there is no lingering
> stack state on RETURN -- this would obviously cause the
> caller/returned-to context to get a wee bit upset.
> 
> And yes, I realize this might sound quite mad to a compiler person. But

It doesn't sound weird *at all*, we have to jump through many hoops in
the compiler as well as in the ABIs to make this work at all.

> remember that we have a ton of ASM (inline and otherwise) mixed in with
> our C code. And while you can add DWARF CFI to ASM, this has
> historically been a bit of a trainwreck, not in the least because the
> annotations got wrong and nothing warned about it until the unwinder
> would explode.

Typically, someone who writes inline assembler code cannot write CFI
statements properly *at all*, he/she just doesn't have all the necessary
information!  Only the compiler does.  It can put all kinds of stuff on
the stack for example.  Writing CFI statements manually is really forr
 someone writing machine code, or actual assembler code perhaps.

> > There are many other archs where all (or almost all, "all normal", call/
> > return sequences use a "link register", often called exactly that.  It's
> > the modern consensus to design call/return around that, I'd say even.
> > It would be nice if this abstraction worked well ;-)
> 
> Agreed. Its just that this thing has a very strong x86 flavour per its
> legacy ;-) We'll get it sorted.

Thanks for the care!


Segher

