Return-Path: <linux-kbuild+bounces-13046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEw4HgcL+2mbVQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13046-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 11:33:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC15A4D8AB1
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 11:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F2323020ED5
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 09:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320973EAC90;
	Wed,  6 May 2026 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TlmuD/Sr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D3326939;
	Wed,  6 May 2026 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060025; cv=none; b=bYa/Z7FP7bJ2oFxbIaP/heWcGwcVu4QhkazW16C9O3QUC8T8Pww9meM991QUbvkjOE3CE59o9genbwesDBZbLLhbVUEPJ9yoPGkTiUaCsfxMrWKc7gsBEYccmGCDWjaB4tNpZ4PbI6mH9qQvIWDWPThbpDfIvG98gjVwpVJ8qZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060025; c=relaxed/simple;
	bh=V9uekpWqlzKjUl0+5Is5LbAAtFsqCxo7ltwPZaTwrYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S51Zuj1sdTFhVz8c0WIb56trN87LsBz7xdXvvGAf5hVvAxKEvxJf/BzLDoEjNNzERW39y7q9WK2B/A64oz2w63703lLMT122mP7d9BiasdiGtRja9IsB1dnPAWMsNijzM7pNtEAGFB05hjXggPNgh5e/O3UQwb5QZ1SXNKj5XRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TlmuD/Sr; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Z7e5wfsQXAKmxK97eeb0+Cr3E/r0kMMdycxMwl8zRSI=; b=TlmuD/Srb10/Ddt7t/em+ZUPOj
	K3ZDHkmdAimiAQjoheTnfsmpI70EVe0X9gTA8eu/O2iqCuOvOG6QY1iUR6NxMA6zspZDo+4E6AJ0Y
	Dt2lem73UDpdBE9iXEgEUW+rAIE3w0N6XqOrAWR923Og5F27X2O8zLSFKA77Nici61LzTvIdLJ5Zp
	yxSHJmsm1pJSd5kOELCzDocNNWRM3nfLHbYqNplXZh1f4/AraJaU2nJaZj816yGbWaD0Fwb9kr7b3
	EJeSQIK1P7uosyOVfudOM7sZ5K2hmDw8DW9Os0VITpJcwxf3fcZlBMpPbcn03DXzLVrmOl2tfnJUa
	hUPh+DjQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWW3-00000000kFT-01lw;
	Wed, 06 May 2026 07:23:34 +0000
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
X-Rspamd-Queue-Id: DC15A4D8AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13046-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noisy.programming.kicks-ass.net:mid,infradead.org:dkim,ozlabs.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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

