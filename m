Return-Path: <linux-kbuild+bounces-11423-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBrlGYQCn2mZYgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11423-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 15:09:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 27374198832
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 15:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1224301BF76
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 14:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB873AEF51;
	Wed, 25 Feb 2026 14:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HiRxEFd7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB24284880;
	Wed, 25 Feb 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772028543; cv=none; b=CgiVf9vhDzI7HvKhkVpAuCADxJBqG2eG45XauZun5HjqhoYZzmsCO0WuP+SlNGOVRdboLj3h3FsdQxhLQLOJwvFiffiirHyGkHD8GH/EaSrbi+XqnttuzMHQXbE5bCpXY1cVytO0hZrCKfZzW5tbMQJ6ub+/MKjN7/Eu5fP+z/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772028543; c=relaxed/simple;
	bh=najeskeSGaMowgnuBVZaa8lrbJEgO/ZS8Nq1D58P5LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DadvxCggtdxjzAjqZmXaRfhUrm+ZbDHOyMnp0dIH/Ey0HUnQ0siQhvaSC/zSLy43vgpSIlFbPi60DZD0BurVr3SMP2Qs/EVKD2pFCWLJQBd/qLgON5jyDmtbqln4LnwmJPnWwJTd6jbJWEfJmCSAb+4Au5wLnAKqEatuKE1p6iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HiRxEFd7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XWRvKSrVzQxumCJr/FJXMqnLK+ok9RFugzOcVZ5aYRY=; b=HiRxEFd7f+eEHFsntm7SMlUNB1
	c4AbjTQ3piGQdRYpSHk5q14C/THBE2f4pSP7LePeXBUybbnnTzy6Dby15D3pa0iM5POQ59cNB5cRH
	fyidvvGLYHpfM+mkOkn8LhcIZHaEC2oIzXwGkV5aFX6h3Y7jD6Q60R8HQh1sSif6y3VSnhUlS3exW
	LOJdm6i77zrXeiqWO2j2tQ+YDyYd/aNW3LdG0Y1IJ+UTpUbft7YWYoMAWbVhBBZ1AHHr294qm7me3
	SqEh2KyPQJkdERVVceI7J7H85do0NBqCWH+BnIEGQloCUCVB9yJCOTPkHmVF3b28lZZkdYD1/gbtY
	0xPcmI+Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvFZO-00000004AMD-2PsX;
	Wed, 25 Feb 2026 14:08:54 +0000
Date: Wed, 25 Feb 2026 06:08:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Jay Wang <wanjay@amazon.com>, Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	Jay Wang <jay.wang.upstream@gmail.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Nicolai Stange <nstange@suse.de>,
	Ilia Okomin <ilya.okomin@oracle.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 17/17] Add standalone crypto kernel module technical
 documentation
Message-ID: <aZ8Cdq2doSHlPG9-@infradead.org>
References: <20260212024228.6267-1-wanjay@amazon.com>
 <20260212024228.6267-18-wanjay@amazon.com>
 <20260225015517.GA162634@quark>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225015517.GA162634@quark>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11423-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amazon.com,gondor.apana.org.au,davemloft.net,vger.kernel.org,gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,infradead.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 27374198832
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 05:55:17PM -0800, Eric Biggers wrote:
> Let's be clear: this is possible only when the kernel has a stable ABI
> to the crypto module, which realistically isn't something that is going
> to be supported upstream.  The Linux kernel is well-known for not
> maintaining a stable in-kernel ABI, for good reasons.
> 
> So, the only case where this feature would have a benefit over the
> kernel's existing approach to FIPS 140 is in downstream kernels that
> maintain a stable in-kernel ABI.  There would be no benefit to direct
> users of the mainline kernel or even the stable release series.
> 
> For this to be considered for upstream there would need to be some level
> of consensus in the community to support this feature despite this.

That's a very nice way to say this goes against all the established
principles for kernel development.


