Return-Path: <linux-kbuild+bounces-12136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AEXvNDNHwGkqFgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12136-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 20:46:59 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A54F2EA88D
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 20:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A5EE300789A
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 19:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44EB329BD91;
	Sun, 22 Mar 2026 19:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIa1NAg6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB541A6815;
	Sun, 22 Mar 2026 19:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774208817; cv=none; b=mqY4ANdkihsEVRlx0Qx2pTq/t6hziwiFvjCzeOARsNUY4bRDhLCjn3jAHUzt4r+0dxHM9uoXndKaZW2nmVourtpyatHpZEEFCbb6ObVgjPzax9Ei9GJi9yQMzXgxAqrDRmE5onhj7B3ldHUG3A3Hh+TdPjuLSoFfGsfEIRU4sVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774208817; c=relaxed/simple;
	bh=1o+jeVIgTmIEnNI1PbynIhcC+gTd7dWDUEQ66WQ3SEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QN25xlAnM7xC7y3YgwU+XQQpq+bflhLM0t7A+kVAx2NWfmQwgRGE6/l2Z+REno692kgaKQB+ndoLb151+J1yZOUYnTFVlwCthGms8+5i1KqxZJzno/Itt6hOZNIHrZBQz5+6vGlvSkeZXo08Nz6f9NulDE5+keydredoUd1nsVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIa1NAg6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E6EC19424;
	Sun, 22 Mar 2026 19:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774208816;
	bh=1o+jeVIgTmIEnNI1PbynIhcC+gTd7dWDUEQ66WQ3SEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIa1NAg67V4CbhaU/2J0neghThBo4k7QPXUkypKgNLrBdUC1+6bKq11fPhBcCBQKr
	 6POM42bjrnwCLw9SComR95paL974H2Hte8463o2aLUAyXHR4mPRLjhWooIWAfANSk3
	 EmLbZAQ6wZgDom/KBs3EOE6zqYx4M9UNAOHEs4w2qOz6rBm+gyBAu4aQFjyg9lglLP
	 wLJPP1a5I13OknAV72tZzyK+X4adG5wMzHDq77K0vmouUahPu1g8IavcKcFp/wVaHx
	 5CntxUA0nUHEEM/KLptxAsewn+VEchWkcF5OforQ4OI0xzTI9du+HyNP1VvV79DNwC
	 Ejo0iFDdhtrRg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	ojeda@kernel.org
Cc: iommu@lists.linux.dev,
	driver-core@lists.linux.dev,
	acourbot@nvidia.com,
	akpm@linux-foundation.org,
	aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	david@davidgow.net,
	gary@garyguo.net,
	johannes@sipsolutions.net,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-um@lists.infradead.org,
	linux@armlinux.org.uk,
	llvm@lists.linux.dev,
	lossin@kernel.org,
	mark.rutland@arm.com,
	mmaurer@google.com,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev,
	nsc@kernel.org,
	peterz@infradead.org,
	richard@nod.at,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	urezki@gmail.com,
	will@kernel.org
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Date: Sun, 22 Mar 2026 20:46:16 +0100
Message-ID: <20260322194616.89847-1-ojeda@kernel.org>
In-Reply-To: <20260322192159.88138-1-ojeda@kernel.org>
References: <20260322192159.88138-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[samsung.com,arm.com,kernel.org,gmail.com,collabora.com,lst.de];
	RCPT_COUNT_TWELVE(0.00)[41];
	TAGGED_FROM(0.00)[bounces-12136-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,kernel.org,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4A54F2EA88D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 22 Mar 2026 20:21:59 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
>
> I will reply to a couple other bindings in separate emails to avoid
> spamming people too much.

Under UML, I got `-Wstatic-in-inline` for `dma_free_attrs`:

      BINDGEN rust/bindings/bindings_generated.rs - due to target missing
    In file included from rust/helpers/helpers.c:59:
    rust/helpers/dma.c:17:2: warning: static function 'dma_free_attrs' is used in an inline function with external linkage [-Wstatic-in-inline]
       17 |         dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
          |         ^
    rust/helpers/dma.c:12:1: note: use 'static' to give inline function 'rust_helper_dma_free_attrs' internal linkage
       12 | __rust_helper void rust_helper_dma_free_attrs(struct device *dev, size_t size,
          | ^
          | static

For some reason, `dma_free_attrs` is not marked `inline` in
`include/linux/dma-mapping.h` to begin with, unlike the rest.

Unless I am missing something and there is a reason for that, it looks
like it has just been missing since it was added in commit ed6ccf10f24b
("dma-mapping: properly stub out the DMA API for !CONFIG_HAS_DMA").

Do you want a patch?

Cc'ing Marek, Robin, Danilo, Abdiel, Daniel, Andreas, Christoph.

I hope that helps!

Cheers,
Miguel

