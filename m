Return-Path: <linux-kbuild+bounces-13023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPA5BLna+WkIEwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13023-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 13:55:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1ED4CD0FB
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 13:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1252030277D3
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 11:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74102382396;
	Tue,  5 May 2026 11:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bQPhnhR1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5EB37FF77;
	Tue,  5 May 2026 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981287; cv=none; b=Ol9ItvmQtGuvyqqPL+X4HVTEImkjaxo9XjeQsAvj5imJlBc8zbIqeK6M/9qmlARt2+fQkrlaub9GKf3Cf1KfTxrRyHVoK7mZr/YsLKzYvhYY0MOeABhDAt92z50EQ4GSrS5pTL7dTiNjngmD8ZEpcf4C6fBlEdDNA/ioDUDCnvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981287; c=relaxed/simple;
	bh=IvxSJ6wSXMpdGU24O8+//7T3aKyKYbVLBx0r1/MZJDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fh4IrzBs2hv8DlBDivYq+qbJDu+iGIhaukY8mdagF/NPOnC0fmm63jMPQMX82nyISBZh46BrCf2wNirL4g1jaIz4CKnMtupn+ELfYiUBmK7E9x7eD6Y995YlPnyNJybNON3B5XHQ4yGQToqeg28EnUq5iEs4VMLl2ZfwPWEvYlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bQPhnhR1; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yFBmDMiqVVdvXI0VWnfnnQuotGbmMWFyRknnB3DwonA=; b=bQPhnhR1wdVG2cEHidi7ur8gMd
	xp4YArmFshZwqdmpwhYlb3oWfHCn2kM0rmrLrEZdk3xK8oJH/WxEvolgyMUtJiLkTfvz+CXuzQPWG
	wyrfV2hh6uzrlJIDf6lHJdij6hkWE2SJuFAnYAiTWCJtVIiS8oWel1M+LbLD5r8Lkdon4CeuIJKoR
	X1HY07bxr5tcJw787TdgYAonuSGWWlqa3cLkSen4p9bsE2Cpsqw39tT/mnYWFA7LIZbI0oAqpiIdD
	+VIhZvOs5EwpgS5grReVmB+rowu8g+I7wolRrWFsHtaXXeNuriDCkNJnWSvTdsGEdEMPSEA/zkwe9
	tTXBIf9g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKE8y-00000002gt8-0xg3;
	Tue, 05 May 2026 11:40:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CA0D4300969; Tue, 05 May 2026 13:40:50 +0200 (CEST)
Date: Tue, 5 May 2026 13:40:50 +0200
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
Subject: Re: [PATCH v1 0/6] objtool: Fixup alternate feature relative
 addresses
Message-ID: <20260505114050.GW3126523@noisy.programming.kicks-ass.net>
References: <20260505084628.17940-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505084628.17940-1-sv@linux.ibm.com>
X-Rspamd-Queue-Id: 0E1ED4CD0FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13023-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,noisy.programming.kicks-ass.net:mid,ozlabs.org:url,infradead.org:dkim]

On Tue, May 05, 2026 at 02:16:22PM +0530, Sathvika Vasireddy wrote:
> This patch series implements build-time fixup of alternate feature
> relative addresses for powerpc.
> 
> Previously, Nicholas Piggin proposed a build-time solution using a
> custom PowerPC tool [1], which provided the foundation for this approach.
> The current implementation leverages objtool's existing ELF parsing
> infrastructure to do the same.
> 
> This patchset applies atop powerpc/merge branch.
> 
> [1] Original PowerPC tool approach:
>     http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170521010130.13552-1-npiggin@gmail.com/
> 
> Testing:
> Build and Boot tested on ppc64le, ppc64be, and ppc32be configs.
> 
> Sathvika Vasireddy (6):
>   objtool/powerpc: Add build-time fixup of alternate feature branch
>     targets
>   objtool: Set ELF_F_LAYOUT flag to preserve vmlinux segment layout
>   objtool: Fix "can't find starting instruction" warnings on vmlinux
>   objtool/powerpc: Skip jump destination analysis and unnanotated
>     intra-function call warnings for --ftr-fixup
>   kbuild: Add objtool integration for PowerPC feature fixups
>   powerpc: Enable build-time feature fixup processing by default

Ooh, so 2/3 are because you're not running objtool on vmlinux.o, but
you're running it later in the link stage?

AFAICT ELF_F_LAYOUT should not hurt the normal objtool run, but it
shouldn't be needed either, because we run much earlier, before sections
are placed.

And that also explains why you're the first to have trouble with 'can't
find starting instruction'. vmlinux.o will have unplaced sections that
are all relative 0.

Hmm... perhaps this ftr fixup should be its own command, like klp. Not
munged into check thing. Josh?

