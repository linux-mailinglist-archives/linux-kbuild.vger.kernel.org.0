Return-Path: <linux-kbuild+bounces-11940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FWHNie/tmkWHwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11940-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Mar 2026 15:16:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DC5290F29
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Mar 2026 15:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D2D23004D30
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Mar 2026 14:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA790366044;
	Sun, 15 Mar 2026 14:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roL1M/sn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EFA365A1C;
	Sun, 15 Mar 2026 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773584160; cv=none; b=Kb1vP0274wK1Fp9ieIQUB5D0oPNR/xFeyJwyPQxogbHj6Pk1xGWzYHr+nD1wtPylfcNpQVFsFWGA3fL7u/JVgTrTWZxNofLSrsFTx7p5i/PKczU4704nwEpU1PVUCNLH5Zb6P5DDrVgVQecuJs0ZLfMyNWvsSyqIe+xoJJ6njew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773584160; c=relaxed/simple;
	bh=agFxp7/+DmzOfwyTxuEGMhbMU3mctxR6EiAxomWVZjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nta1fVSyU02JfdJmds1XSAV4zVXRGesroFTgcapL9mtS7x+UsmdrY2K0kBZMxwG+Ljwc7/rlmFOlGHiaV6gQVXiLbAjrSPj64/JT4NAgiPWj2jmcbzrQDu0dJeT2Qdsg/HnqHSIpGCcCbS+KoqBNFy2ITHeAYAKtzQMkhy3XsFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roL1M/sn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF01C4CEF7;
	Sun, 15 Mar 2026 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773584159;
	bh=agFxp7/+DmzOfwyTxuEGMhbMU3mctxR6EiAxomWVZjA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=roL1M/sncI7syFKC+9EAQl1eCZCHmJRgd6pDWPCUMZ1EXZw6eMIBYdBqGlooV8+Cz
	 WG3hLBXqLVlZAyHyTeksN6hrbhZxwYTrK7Wd4q8RIbgN1JcM0aQkL0CIRTAxbnky/N
	 llZEm7aaanH9Q+Arg3PCOb5TdJxe8lOcuZ9t2ijKVqCKiy04H4pgFLSfDUtojc9k84
	 4MyFWx4I3cT5s7XGmir14ybXW295nx5o76Zy7Dtz1gMlHGjQhEZSFXCwkwP5OrFRgK
	 kkqBIrGUBwc5g+NXoR9z7J1yP9qE+pYk0UY42I+bT0OuTv4iqeWqi3wwSlE1yzF+3m
	 2I9oF3TCISnKw==
Date: Sun, 15 Mar 2026 10:15:58 -0400
From: Sasha Levin <sashal@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chuck Wolber <chuck@wolber.net>, nathan@kernel.org,
	Matt.Kelly2@boeing.com, akpm@linux-foundation.org,
	andrew.j.oppelt@boeing.com, anton.ivanov@cambridgegreys.com,
	ardb@kernel.org, arnd@arndb.de, bhelgaas@google.com, bp@alien8.de,
	chuck.wolber@boeing.com, dave.hansen@linux.intel.com,
	dvyukov@google.com, hpa@zytor.com, jinghao7@illinois.edu,
	johannes@sipsolutions.net, jpoimboe@kernel.org,
	justinstitt@google.com, kees@kernel.org, kent.overstreet@linux.dev,
	linux-arch@vger.kernel.org, linux-efi@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	llvm@lists.linux.dev, luto@kernel.org, marinov@illinois.edu,
	masahiroy@kernel.org, maskray@google.com,
	mathieu.desnoyers@efficios.com, matthew.l.weber3@boeing.com,
	mhiramat@kernel.org, mingo@redhat.com, morbo@google.com,
	ndesaulniers@google.com, oberpar@linux.ibm.com, paulmck@kernel.org,
	richard@nod.at, rostedt@goodmis.org, samitolvanen@google.com,
	samuel.sarkisian@boeing.com, steven.h.vanderleest@boeing.com,
	tglx@linutronix.de, tingxur@illinois.edu, tyxu@illinois.edu,
	wentaoz5@illinois.edu, x86@kernel.org
Subject: Re: [RFC PATCH 0/4] Enable Clang's Source-based Code Coverage and
 MC/DC for x86-64
Message-ID: <aba_HgSbzLGm6VBQ@laps>
References: <20250829181007.GA468030@ax162>
 <20251014232639.673260-1-sashal@kernel.org>
 <20251015073701.GZ3419281@noisy.programming.kicks-ass.net>
 <DDIR4HE5C74G.1U5TA0KDN9O5J@wolber.net>
 <20251015092145.GB3419281@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251015092145.GB3419281@noisy.programming.kicks-ass.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11940-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 34DC5290F29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Oct 15, 2025 at 11:21:45AM +0200, Peter Zijlstra wrote:
>On Wed, Oct 15, 2025 at 08:26:50AM +0000, Chuck Wolber wrote:
>> Optimization makes it nearly impossible to correlate GCov results back to
>> actual lines of source. llvm-cov instruments at the AST level which enables
>> precise mapping back to source code regardless of optimization level.
>>
>>
>> A detailed rundown on this issue can be found here[1], with the most relevant
>> excerpt reproduced here:
>
>Yes read and understand this, but that doesn't mean you have to have 3
>different kernel interfaces for all of this, right?

To clarify, are you suggesting that we'll have something like a single
/sys/kernel/debug/coverage interface that is producing the same structured
output whether we use gcov or llvm?

-- 
Thanks,
Sasha

