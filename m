Return-Path: <linux-kbuild+bounces-12156-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKXyHDc6wWn2RgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12156-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:03:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5182F26EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 14:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 038FB3093D01
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 12:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0462C3A5E73;
	Mon, 23 Mar 2026 12:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="jA1fKF6J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1D729A1;
	Mon, 23 Mar 2026 12:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270518; cv=none; b=Mqz9NjCIJ92SRzm+OmHTvYnkASJmVBYAKKbkO03PHzShGVAriwCY/LG0IwhMw5Wb29sLTVzyzNvTye9hmVPmcZYeWaFzHiOuIFpShuTbtJsaS9lj0e4v9oPQQLqoL1Y45XNW8Vm01bGLCm6rNOf4U7Vso5cb7jlUk1AsXaRP7x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270518; c=relaxed/simple;
	bh=bJwR+NP1inWZ0WJkmUGiKU1IoIp6Bm8zUfE4bG0wTS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUOFBAI6JzQsyel/e0q8kAASTdmvvOMyxkorCT1VttrsRkRmpMsPXh79l+DmLSAEICzZFoD9aoVtLxaCJEZ1cM3kN1H+9L0Xk4ikQJZQx/N1lJtqttLy6Qh/bmdKkmb4kcxOTOP7Xjnva3uJ6duTWQ05ct7LZXQOcq0BvrZobd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=jA1fKF6J; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=1d81UGW+g5moJ12QZLJ70AfXTnILA70sV1AIVfxWkPk=; b=jA
	1fKF6JCm07M3XMCGUuLHhhI9Pu6ECn1GJ3yeUqHNhRkzLmXiEKTE/QlBMy2b+v7qeDJ/Lwc6gzpEd
	uTbq1XPNawby4AoIaQRDN6D1/Dwq4q51KKQd6nnrU4sc4PnuPzJ60QWKwdET9ZkSy1PsI6j8uUhzN
	bgmLoRVpwaHE16E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w4eo2-00CvjR-O0; Mon, 23 Mar 2026 13:54:54 +0100
Date: Mon, 23 Mar 2026 13:54:54 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org,
	acourbot@nvidia.com, akpm@linux-foundation.org,
	aliceryhl@google.com, anton.ivanov@cambridgegreys.com,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
	david@davidgow.net, gary@garyguo.net, johannes@sipsolutions.net,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-um@lists.infradead.org,
	linux@armlinux.org.uk, llvm@lists.linux.dev, lossin@kernel.org,
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
	richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	urezki@gmail.com, will@kernel.org
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
Message-ID: <65336ad0-ac37-416f-b6ae-e691e3e375ae@lunn.ch>
References: <20260322192159.88138-1-ojeda@kernel.org>
 <20260323000327.111235-1-ojeda@kernel.org>
 <96287f3a-d245-47cf-b7cb-f821451493d3@lunn.ch>
 <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nwSWVDRqm0Vap5j5X5k+Q-wq8okQ9d3KUgZt6M4CpW9g@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12156-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,lists.linux.dev,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RBL_SEM_IPV6_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0F5182F26EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 04:24:59AM +0100, Miguel Ojeda wrote:
> On Mon, Mar 23, 2026 at 4:04 AM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > Rust is already fragmented, because it does not support all
> > architectures. Do we really want to make it even more fragmented by
> > having some bindings only work on a subset of the subset of
> > architectures?
> 
> That is not the case. The `depends on` is not about putting them on
> abstractions, but on this experimental build feature, which is gated
> on `EXPERT` to begin with, because it uses a fairly exotic approach
> involving LLVM bitcode, which carries potential pitfalls, like the
> mismatches on the target string like one of the commit messages
> mentions, and possibly others.

I'm not sure i follow this.

Maybe i should ask a different question.

You said:

> we
> may want to start simple with x86_64 and arm64 or similar first.

The current proposed code for netlink needs this feature, because it
needs access to inline C functions. Is the implication, following a
chain of dependencies, that netlink would only build on x86_64 and
arm64?

If you want netlink on um, arm32, riscv, loongarch you would need a
different implementation of the binding?

And a completely different question. Are there other work in progress
solutions to allow the use of inline C functions? For networking, in
particularly MAC and protocol code, anything which needs to access a
struct sk_buf, a solution to this problem will be required. Do you see
this "fairly exotic approach" as just a sort term bridge until some
other "boring approach" is ready?

	Andrew

