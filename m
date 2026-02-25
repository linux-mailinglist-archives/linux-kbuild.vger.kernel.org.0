Return-Path: <linux-kbuild+bounces-11416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IsaNMVbnmlrUwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11416-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 03:17:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2DC190CCE
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 03:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22DF330AD184
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 01:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF182550D7;
	Wed, 25 Feb 2026 01:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUjjOzta"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178F52522A7;
	Wed, 25 Feb 2026 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771984520; cv=none; b=RkdaegiwY5cdMr6qbWT2aG2PUbl65WJ5ph4AkcK6V9UQ+krRadIQ/9jXegTQ9gfBIrofJsj2mY7J8AozPDAxOjJ4Vf8E9TqABW4n0EibDjOJ+8r1vXCTmvL/FgDZhNvNpMrpm28VvyQe0dpfNZjUcx7troWqb1doWli9inP2mvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771984520; c=relaxed/simple;
	bh=wai5ctQjllxH/CyiupuFCePSUyKayiUbmb+UdSGsD40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7TZN5Z6SzBqSBc56zS/lUoIwVuoK5wyOGUBRsF/2OBVXqLB8djRkFik/bRoUT952r6Qu0F+qc9V7RqNQ8WXfHVnvd93nWeL7pspanQolAcg0HnuK3SIKIs/MuLF2obKYoOs6AZ5JqTr/g5xqIDgrwo9w/QaaWQWbfieA7r1ph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUjjOzta; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00765C116D0;
	Wed, 25 Feb 2026 01:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771984519;
	bh=wai5ctQjllxH/CyiupuFCePSUyKayiUbmb+UdSGsD40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUjjOztaISRqAaKg7pJmNx+H6fEeo9AaWbgjJdnnKR7V6A3uCZzbt5Ze08NYzOz0J
	 KhEvRb7SyAPCfTK9LSNn+pMV0AQhBae+uDMXpsnO+nuzB5BojvZZ+hnBd8N2GeD9qu
	 Lvi/Q4LM5WzYr3UvASFxF2F+nw/O3gUXNMNjoQRjTxrp4ByjLQt4VCQ28GjpMitOLh
	 rqZvQT7MPATcx1a/yvEqrjCfJgl4g5I47u8ki4c2KCGySX5D9wkfRb9/xl3xplJ1R+
	 ujrUdtC9ztIDV/MUx8Qb+/4Om4AdVsDpMO2HhwOnTzS4RkKlHJ5bLIoDBXI4IvafWF
	 hQ3OOp2a75pDw==
Date: Tue, 24 Feb 2026 17:55:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jay Wang <wanjay@amazon.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
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
Message-ID: <20260225015517.GA162634@quark>
References: <20260212024228.6267-1-wanjay@amazon.com>
 <20260212024228.6267-18-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212024228.6267-18-wanjay@amazon.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11416-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gondor.apana.org.au,davemloft.net,vger.kernel.org,gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7E2DC190CCE
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:42:21AM +0000, Jay Wang wrote:
> With this feature, FIPS certification is tied only to the crypto
> module. Therefore, once the module is certified, loading this
> certified module on newer kernels automatically makes those kernels
> FIPS-certified. As a result, this approach can save re-certification
> costs and 12-18 months of waiting time by reducing the need for
> repeated FIPS re-certification cycles.

Let's be clear: this is possible only when the kernel has a stable ABI
to the crypto module, which realistically isn't something that is going
to be supported upstream.  The Linux kernel is well-known for not
maintaining a stable in-kernel ABI, for good reasons.

So, the only case where this feature would have a benefit over the
kernel's existing approach to FIPS 140 is in downstream kernels that
maintain a stable in-kernel ABI.  There would be no benefit to direct
users of the mainline kernel or even the stable release series.

For this to be considered for upstream there would need to be some level
of consensus in the community to support this feature despite this.

- Eric

