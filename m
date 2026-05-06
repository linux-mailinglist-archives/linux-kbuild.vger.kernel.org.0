Return-Path: <linux-kbuild+bounces-13051-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBMeCeZR+2mSZQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13051-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:36:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD504DC4FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 16:36:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A59F3006B08
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 14:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3762BCF46;
	Wed,  6 May 2026 14:30:11 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B718480320;
	Wed,  6 May 2026 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077811; cv=none; b=TdJVkhM960nny5jSKqQVOiUTJpvfRGWUll+9HudJhMOhyZr/S5q4DtRG4kRMR90/l0ERd162tOHkJC3P2LFS9PZRNjPexzMZ3SDFZ076diK5tEzUCXODgb7e4csxOxEViweI+ZK+JZUNXdkfuKjP1VAkwMwurZkB3JTGHGBH/zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077811; c=relaxed/simple;
	bh=SERVxrWoC/AibqdeLUCiOyktDNd01Ca70maYmcqPMvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3XutOUxzuDPrg/W27v3htw2P4U6jpcPBoYXv19IdYNvETLsQdZmBNpqUYfc6Nwb/F4H/pCW5FtdeY9VG3oZvYYv3tx8N7GGUxr+hrp4pId3qUZHhfHHsDZkjvr+Ft5rwAnXCCfsxONSjZB4uNjjPsKh947DZRepLt/6DgwmuO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 646ESaYa352811;
	Wed, 6 May 2026 09:28:36 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 646ESUw9352806;
	Wed, 6 May 2026 09:28:30 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 6 May 2026 09:28:30 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Sathvika Vasireddy <sv@linux.ibm.com>, nathan@kernel.org,
        nsc@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, jpoimboe@kernel.org, ojeda@kernel.org,
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
Message-ID: <aftQDiJBZ032-Oem@gate>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
 <20260505144949.GO3102924@noisy.programming.kicks-ass.net>
 <669fbc9a-a243-43e8-8888-93bfb9d6ee12@kernel.org>
 <20260506071753.GA3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506071753.GA3126523@noisy.programming.kicks-ass.net>
X-Rspamd-Queue-Id: 8FD504DC4FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	DMARC_NA(0.00)[crashing.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	TAGGED_FROM(0.00)[bounces-13051-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XAW(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[segher@kernel.crashing.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Wed, May 06, 2026 at 09:17:53AM +0200, Peter Zijlstra wrote:
> On Tue, May 05, 2026 at 05:48:32PM +0200, Christophe Leroy (CS GROUP) wrote:
> > bclr (which is the return INSN_RETURN) has type 19
> > 
> > By the way you can have a look at https://patchwork.ozlabs.org/project/linuxppc-dev/patch/bfa8364da047d8610a09458a1cd924a0566aedbb.1736955567.git.christophe.leroy@csgroup.eu/
> 
> That is indeed more; isn't bcl something like COND_CALL ? (another one
> of them things we don't have).

Yeah, all of bc[l][a] are conditional branches.  "a" (AA=1) means the
branch target is an absolute address (in the top or bottom 8kB of the
address space), and "l" (LK=1) means set LR to the NIA ("next
instruction address") before doing the branch.

The BO field describes the condition.  0x14 means "always".  (But there
also are primary opcodes for b[l][a], with a bigger target field, 24
bits instead of the 14 bits of bc[l][a]; you do not have the BI and BO
fields then of course) ("branch index" and "branch option" btw).

> > That patch has all the objtool decoding. By the way objtool is missing a
> > INSN_CONDITIONAL_RETURN, also see https://patchwork.ozlabs.org/project/linuxppc-dev/patch/537e5d8f181b1f1c2b8918f1aefa1dba3f972c03.1736955567.git.christophe.leroy@csgroup.eu/
> 
> Right, that is not something x86 has, but I don't see a reason we can't
> add that. With return thunks, Clang (and I've heard GCC is also
> considering this) does something very close to conditional return.

A conditional blr does not map well to most compiled languages.  It is
nice for hand-written machine code though :-)

For compiled code you almost always want to make some of the associated
stack frame maintenance conditional as well (because the ABIs require
this, if nothing else!)

I guess we could add some special-case stuff for it, maybe a peephole,
but we probably would have to write a whole new pass for it, stuff with
branch instructions always requires special checks :-p

> That way we do the return checks, but don't terminate the control flow.
> After all, when the condition is taken, we had better have the stack
> frame in the same state etc.

Ugh, mixed abstractions again :-(


Segher

