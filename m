Return-Path: <linux-kbuild+bounces-12109-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACg6EbK5vWnyAwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12109-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 22:18:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 569DB2E13F5
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 22:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 366EE3012823
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B44347534;
	Fri, 20 Mar 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXZ776M6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7599E342CB0;
	Fri, 20 Mar 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041493; cv=none; b=BI0zLRHUOZ2P0dunx0Z7niEulhiIoWV9Abz9+9GwalWFOTZXZA703CAyT9syZQ8jM2fVBdVx3NTh6MiwYnjy7II3W1pdbfJGqww6PQ/tbICviQFclwra81x9ISkHEeXWNebfhyyCtmkSSLkkjM2Igh1VfWE5LiAGbji+3DQUlZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041493; c=relaxed/simple;
	bh=gPisEgDJe0zpyTp4fWKzmOXq9Wul6KnaL7QEOqwJrjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiCJgDk/j7Z/E1zwSkUfbVXWcPtQkQ5ZQD0iH4m2ThfEj7Iw4BBbfE0OQ76SV7mzSedhIDwhryC0WqFReXVm2LpDKsDiHl5rHb5xl3ClkrSMCkj64buGjNsOqHLuRdTPTyPW2grY0p8bo7tOQ4CJPr4PpGpGadbiUVApWWoJ2gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXZ776M6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A63C4CEF7;
	Fri, 20 Mar 2026 21:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774041493;
	bh=gPisEgDJe0zpyTp4fWKzmOXq9Wul6KnaL7QEOqwJrjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXZ776M6F+p+JioW/4jJa0rcok8oqAg9raEiMjXJ8R6QjtkOzOQmTK4HQv9UpAz4j
	 fUZW94EDuNt6Pmm0wbS9TqpyCL+mssy8/+dQ8d+0XFjfA3Lswkr4cY95RsVQ93CSWV
	 rXjvTR9DZ90VsvSfu3Y60bgD+tRi87gqdyaF14mZzpBCuFrxFUScntJxiojRxGU0g8
	 OJt6NoNIpT0TLpG7t+D1g8ToZH40r69qcFXFu4/J5qVHOqJKJ4Tmgmhyx4iSC2rebH
	 r1ycRMdU1itYurdzpqJyJjX0ce1ipFUyCfpAmjGrc2OREJfEoV2lNDW44CMxjdEbH5
	 u7YAjTvlcIoKg==
Date: Fri, 20 Mar 2026 14:18:07 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Rong Xu <xur@google.com>,
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] kbuild: rust: add AutoFDO support
Message-ID: <20260320211807.GA3990088@ax162>
References: <20260319-autofdo-v1-1-51ee2a7290cd@google.com>
 <DH6Q43ROSJTN.3MDECF42EKQY1@garyguo.net>
 <CAH5fLggvkVvgP1pvBjNQ4XQz9=RtTTXhf0JCVDLfq-xX971D5g@mail.gmail.com>
 <DH6QGQDMPLDY.1H3RLPD1X8CGL@garyguo.net>
 <CAH5fLghkK76Od1AxSH_NgrxOr2pt2XOoVBuLD6ZovzcLoxNwQQ@mail.gmail.com>
 <DH6ZUW2WRTNM.3B6SWJS4I3DE4@garyguo.net>
 <20260319235443.GB769346@ax162>
 <abztachY5pOvwM1Q@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abztachY5pOvwM1Q@google.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12109-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[garyguo.net,google.com,kernel.org,protonmail.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 569DB2E13F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 06:47:05AM +0000, Alice Ryhl wrote:
> How about we just call them:
> 
> * CFLAGS_AUTOFDO_CLANG
> * RUSTFLAGS_AUTOFDO
> 
> then? For cflags, clarify that they are clang flags. For rustc, there is
> no such distinction to make (yet).

Yes, that seems reasonable to me (although CFLAGS_AUTOFDO_CLANG is
already the name so I assume you mean just keeping it as it is).

> Another option:
> * CFLAGS_AUTOFDO_CLANG
> * RUSTFLAGS_AUTOFDO_RUSTC

I don't see much of a reason to make this distinction until the rest of
the kernel's Rust code can be built with a different Rust compiler.

Cheers,
Nathan

