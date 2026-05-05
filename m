Return-Path: <linux-kbuild+bounces-13026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLOsBPUD+ml1HAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13026-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 16:51:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07ADC4CFC06
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 16:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95C093021EB3
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 14:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2886347D948;
	Tue,  5 May 2026 14:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OWRI0ab3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99A8481257;
	Tue,  5 May 2026 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777992615; cv=none; b=cFocj9PmYfF/M/YsQR62LGPSvqe3gvU70zOxRx+ehZWydQ2cV/zQkOz5XEjxVH2HbNQGvekFS95PQ61PAxNdRvdhI7hZhojgUWjRhN6exCHFRdlBXWGyhvqbjimislsrrHK1kS/DlAVUpcbtWOhr/O7JO63xyTTPu2GqeYfLw7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777992615; c=relaxed/simple;
	bh=35ASUL/A+SFevDAhCefLpyPRj7qJbSq9Dc0lsV1LTJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3UHJexIwitLYouQA2YGdb7ZAysZVUKi7noPiBRNWFS2yj5QKg6/1cGvs81hepO3UvXYPj/bSt6JpJUu8geqYpLbyAbhn59cV3+tGt6gRINXdhJvSVZwvmi+7EAU5xAIWcIvih16rWnIyKOn6J33G8TuC5VrHUsaOQqysg70cRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OWRI0ab3; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MhIH6P4L9AHrtbUCk5z0gOsY/j0PxcVoR9jw1AI5Xkg=; b=OWRI0ab3sH+PmXYQl/+8rjjdTj
	4peTJVZ4lPgPFSxwUZUebGE+gGchVIwHFCAWM+NVUUYa0X5DrAfOvRR0kGEE9gIiJQJXB4yKPOcrP
	M26jeunhYfFt2kxxfDCxMNuTgkEuAuR7vsp6aR2ofat3cpWODaNqyFSJfi/4jJ1j5ZXW34JNjkiKs
	fTkUdeJiJSIds3AnbocGr0q45oEuUpkBYKEQ20Jit62UHSp8cUMtTQGNEdsnxwT34DMPF5ZhAZfG7
	CsEFCOTl5adOzaLxrZE3smVEf+DCsnHtXXLyuJ9Q66Vlg0T6Q1vn/h0f/uVPmhY0Hsu//2zBgYhvt
	xtSisCIw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKH5q-0000000DoGA-1dyJ;
	Tue, 05 May 2026 14:49:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1E81B300324; Tue, 05 May 2026 16:49:49 +0200 (CEST)
Date: Tue, 5 May 2026 16:49:49 +0200
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
Message-ID: <20260505144949.GO3102924@noisy.programming.kicks-ass.net>
References: <20260505084628.17940-1-sv@linux.ibm.com>
 <20260505084628.17940-2-sv@linux.ibm.com>
 <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505144539.GX3126523@noisy.programming.kicks-ass.net>
X-Rspamd-Queue-Id: 07ADC4CFC06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13026-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,noisy.programming.kicks-ass.net:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 04:45:39PM +0200, Peter Zijlstra wrote:
> On Tue, May 05, 2026 at 02:16:23PM +0530, Sathvika Vasireddy wrote:
> >  	switch (opcode) {
> > +	case 16:
> 
> Like case 18 below, this wants a comment describing which instruction
> this is; bclr ?

Also, isn't that typically used for return, suggesting at least
something should have INSN_RETURN on?

> > +		if (ins & 1)
> > +			typ = INSN_OTHER;
> > +		else
> > +			typ = INSN_JUMP_CONDITIONAL;
> > +		imm = ins & 0xfffc;
> > +		if (imm & 0x8000)
> > +			imm -= 0x10000;
> > +		insn->immediate = imm | aa;
> > +		break;
> > +
> >  	case 18: /* b[l][a] */
> >  		if (ins == 0x48000005)	/* bl .+4 */
> >  			typ = INSN_OTHER;

