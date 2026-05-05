Return-Path: <linux-kbuild+bounces-13025-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGgfO7EC+ml1HAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13025-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 16:46:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA4D4CFABD
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 16:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69A313009883
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 14:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5566480352;
	Tue,  5 May 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nzIRH6M3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FEB47ECF4;
	Tue,  5 May 2026 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992365; cv=none; b=p+F3iYuenC1NJtO2iCvBxxzSpcm+4pXj0xh1zUEcVRPI440F0oIRzoJxVyqawR27vNsEpSkH+FOK60oNBcIrxc2QjBrZ57SFDS9zIdUpUXY7np+ZOUiPgXPwJoyy5fRzkRUA+moUEod5VCjpr2Uuj6Azr/PU3YvGOp5cgHUXl+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992365; c=relaxed/simple;
	bh=Dzvg3fuw1DSYfVViXQh2ToG0ArxlSwQH8inKmJov0xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZJhW7b/VbJMYga/73jsXtsoscribDdJpVLV4HMrgJ/JzcvAY3jaJqNsMf1H6mSmx9yAEPo2YXqpJHH0Mqpy5P94iBvOjn0lc3e7P4D+QpXPn0D9MC5PB1Tx5LrxmSCyaWt4oosBBRjmo6sBZcmgr/eukeC7cizoh9SiV1rMNYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nzIRH6M3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Q2PUT5mBmE0pVC/l1oOM2DQsGiXTZuOEOmovRml4Y8=; b=nzIRH6M37lgz1ZVmXp68geh4pF
	HweTOzWYHMGbSTaB82tWfde6xqgb5U4oYODE3yHXQPAMu6AuRykvqnNmI0DMDovXhSBvYN5Or8pR1
	H9zEFlWakIvD9n7lH+oi/US5Byb1Z7Jivufc+GKIq6I2lHJ6qydbHUtlJdV4PG6xgMFcw0D5ruuvI
	8BnaJIqJKCD0UwnEL515mLrIR6zRMat90UlyrZHQuUJ+IJbYPqm8MVHUSVZ6R78knB1NvSxmFprDL
	pbctvHYCwMFob8LUG961TRvlOR8VWiMyuR9ycisNpsNGJCO1BqG9KEHi2s96dNq9G50FIwTQlV77S
	hj9jJqGg==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH1n-00000002um9-3cwc;
	Tue, 05 May 2026 14:45:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 38D403001AC; Tue, 05 May 2026 16:45:39 +0200 (CEST)
Date: Tue, 5 May 2026 16:45:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: nathan@kernel.org, nsc@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	jpoimboe@kernel.org, ojeda@kernel.org, masahiroy@kernel.org,
	lossin@kernel.org, tamird@kernel.org,
	thomas.weissschuh@linutronix.de, rostedt@goodmis.org,
	ihor.solodrai@linux.dev, thuth@redhat.com, pmladek@suse.com,
	aliceryhl@google.com, elver@google.com, kees@kernel.org,
	legion@kernel.org, ardb@kernel.org, yuxuan.zuo@outlook.com,
	alexghiti@rivosinc.com, alexandre.chartre@oracle.com, bp@alien8.de,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/6] objtool/powerpc: Add build-time fixup of
 alternate feature branch targets
Message-ID: <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505084628.17940-2-sv@linux.ibm.com>
X-Rspamd-Queue-Id: 6EA4D4CFABD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13025-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,noisy.programming.kicks-ass.net:mid]

On Tue, May 05, 2026 at 02:16:23PM +0530, Sathvika Vasireddy wrote:
>  	switch (opcode) {
> +	case 16:

Like case 18 below, this wants a comment describing which instruction
this is; bclr ?

> +		if (ins & 1)
> +			typ = INSN_OTHER;
> +		else
> +			typ = INSN_JUMP_CONDITIONAL;
> +		imm = ins & 0xfffc;
> +		if (imm & 0x8000)
> +			imm -= 0x10000;
> +		insn->immediate = imm | aa;
> +		break;
> +
>  	case 18: /* b[l][a] */
>  		if (ins == 0x48000005)	/* bl .+4 */
>  			typ = INSN_OTHER;

