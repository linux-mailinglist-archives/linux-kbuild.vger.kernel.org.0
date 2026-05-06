Return-Path: <linux-kbuild+bounces-13044-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FF0BED1+mk1UwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13044-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 10:01:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936A4D78E5
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 10:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 124A13005D33
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 08:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D133E1CE0;
	Wed,  6 May 2026 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TwqzQxiI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8F035F5E4;
	Wed,  6 May 2026 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778054407; cv=none; b=mQD0hRFGRtZOqvGlIklHRnONUcNX/oiWajUzK8dzlq/Z2dUNj3FtkovXHqtWbsW0QUBWSTMSp8ueGlgk9+BhuqfxvVYyttpO8p/A7lK3N/LJCRxjcziNckydHEcWJP6bxlLvoMt3ydwrzgzApLb1WRhnW18Z177y/cUrQolG4lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778054407; c=relaxed/simple;
	bh=V9uekpWqlzKjUl0+5Is5LbAAtFsqCxo7ltwPZaTwrYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsBLtQFfgL3LbcMmE4bUw2DaWYmq1BX+UZ36vrc2YsmEEbGYVLeJxlk8ZBlNAShPc/B3fYPc+MA/B2uerRaJCRR39KW9ixTx9cQzjMCUjLDtEZrzMXx4maV81sZ2FpTzjs/R9JQYdsXg/dlYstjG4+9ccKJKA8xsHWHFq3jGHPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TwqzQxiI; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z7e5wfsQXAKmxK97eeb0+Cr3E/r0kMMdycxMwl8zRSI=; b=TwqzQxiIdy1vK3gzph4t1YyE9J
	sQDQojBiOJiG5kpByBNTBnzK7h1BkmHTdKJ8yELp1413oMExLA49ZVMeJJzA1xElhfJH+plJxa9pu
	zepCRCyYuCgAdAnr1XSUj+0roKu3uJuP+YAkxRKA0uwDyKjnXwOrpGzggjb49yh3FkKpeO1MCi5ry
	Lsdfa/2SzpNlSRmVi9hkVq6P2GwvWONe1eF9XRLS2kj7kAESknbRyIyqRoDRT/KEQSmdrKfQgDHa/
	dfrrllrLxFsUUheHY20ush0gqWymyC5libuMBxnRX1qAf6UmuvaZllkZ33x83REY8MACXjdQd9QG0
	7s6A36gA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXAV-00000000ukV-225f;
	Wed, 06 May 2026 07:59:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BB847302EC2; Wed, 06 May 2026 09:17:53 +0200 (CEST)
Date: Wed, 6 May 2026 09:17:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, nathan@kernel.org,
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
Message-ID: <20260506071753.GA3126523@noisy.programming.kicks-ass.net>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
 <20260505144949.GO3102924@noisy.programming.kicks-ass.net>
 <669fbc9a-a243-43e8-8888-93bfb9d6ee12@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <669fbc9a-a243-43e8-8888-93bfb9d6ee12@kernel.org>
X-Rspamd-Queue-Id: 9936A4D78E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13044-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[infradead.org:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,noisy.programming.kicks-ass.net:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ozlabs.org:url]

On Tue, May 05, 2026 at 05:48:32PM +0200, Christophe Leroy (CS GROUP) wrote:

> bclr (which is the return INSN_RETURN) has type 19
> 
> By the way you can have a look at https://patchwork.ozlabs.org/project/linuxppc-dev/patch/bfa8364da047d8610a09458a1cd924a0566aedbb.1736955567.git.christophe.leroy@csgroup.eu/

That is indeed more; isn't bcl something like COND_CALL ? (another one
of them things we don't have).

> That patch has all the objtool decoding. By the way objtool is missing a
> INSN_CONDITIONAL_RETURN, also see https://patchwork.ozlabs.org/project/linuxppc-dev/patch/537e5d8f181b1f1c2b8918f1aefa1dba3f972c03.1736955567.git.christophe.leroy@csgroup.eu/

Right, that is not something x86 has, but I don't see a reason we can't
add that. With return thunks, Clang (and I've heard GCC is also
considering this) does something very close to conditional return.

With return thunks, regular RET instruction is replaced with a JMP, or
rather Jcc in this specific case, to the out of line __x86_return_thunk
symbol. Objtool currently treats that as a conditional sibling/tail
call, which isn't wrong.

Anyway, with that patch, I think validate_insn() wants something like so
added:

	case INSN_COND_RETURN:
		validate_return(func, insn, statep);
		break;

That way we do the return checks, but don't terminate the control flow.
After all, when the condition is taken, we had better have the stack
frame in the same state etc.

