Return-Path: <linux-kbuild+bounces-11023-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L6YNgT6gmm2fwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11023-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:49:24 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 772EFE2D31
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 08:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B9753018F08
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 07:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1543338F226;
	Wed,  4 Feb 2026 07:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ygfyh3Wv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5275214A64;
	Wed,  4 Feb 2026 07:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770191354; cv=none; b=q8CWrfzSvSmKSJwndFYdi28hXUara9Sd3eo+a4U1pIdo09rC8Vaxk7t+fcqZxZmN8f80+KFcyA252udUNS+/DxApuHhaI2DViIVMCAMUxawAUS/TKxd+0Gmf9CnsHCi6Xa2J/V87IBZ+XHFe8F5ti0Q7VTjHT0COYicg9bXpVU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770191354; c=relaxed/simple;
	bh=l8CMDKqpA7OSQPeAnkGdqjodxHHnVe32+QEnCx30yA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy8QB2rM3lqpyFm5DwEX9CPCkzQgVu8Op5oic45N2bo6k14Ckim97r6hhwenopb8b1nrjXqefEcEXyhSXp8pFQfXnXPZOhJ5wgrornNY27U2p0iQv5fmnDYX5q0JoyevPXqsMq69BYUwDZiwW41q+/OP6g2VTcYmSJo5fGHd1w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ygfyh3Wv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EA2C4CEF7;
	Wed,  4 Feb 2026 07:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770191353;
	bh=l8CMDKqpA7OSQPeAnkGdqjodxHHnVe32+QEnCx30yA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ygfyh3Wv9wk76QsAndIJVnTvANIcRlvdoh3wBJuMgrDagRfH/LMDHU6cB8v8APABF
	 jgWlX29M7nCqL8QnGTP5AT27keykRtc70rIXaaMyIebpna1jE+ahAI1vPJMKZWkV7O
	 dbJYN0B6n83jbDZxFD2xqMQPSIvaJ+ON54oUxYuvbSeytpOynrnhEblPxIUc9oMxc3
	 tlFoQw4DOGFZSqcAje/RkocIDE44of794Av5Ywh8dD6vCHnKRrzmYL2Q7mCuiYrLXi
	 xNUMCP/8Y8rowx/xkqEEdhLAt21kjckkColNDZ2Ud8cdai4GUFdNxxjYOV6yCA1HJJ
	 lPsmZBcozJgnw==
Date: Wed, 4 Feb 2026 00:49:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: kconfig: Don't require RUST_IS_AVAILABLE for
 rustc-option
Message-ID: <20260204074909.GC1632007@ax162>
References: <20250909-docrem-v1-1-dcc69059a5cb@google.com>
 <177016418652.1146354.981060291224113155.b4-ty@kernel.org>
 <CAK7LNASdG9P90Hnc3M4zK67S_kRtcs5kv8MX7n_B6S5x=FKENw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASdG9P90Hnc3M4zK67S_kRtcs5kv8MX7n_B6S5x=FKENw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11023-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 772EFE2D31
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 04:17:26PM +0900, Masahiro Yamada wrote:
> On Wed, Feb 4, 2026 at 9:16 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Tue, 09 Sep 2025 18:14:20 +0000, Matthew Maurer wrote:
> > > The final version of this macro does not fail in the absence of an
> > > invokable `$(RUSTC)`, so we don't need to be careful not to invoke it.
> > >
> > >
> >
> > Applied to
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next
> >
> > Thanks!
> >
> > [1/1] rust: kconfig: Don't require RUST_IS_AVAILABLE for rustc-option
> >       https://git.kernel.org/kbuild/c/f2445d6f264c6
> >
> > Please look out for regression or issue reports or other follow up
> > comments, as they may result in the patch/series getting dropped or
> > reverted. Patches applied to an "unstable" branch are accepted pending
> > wider testing in -next and any post-commit review; they will generally
> > be moved to the main branch in a week if no issues are found.
> >
> > Best regards,
> > --
> > Nathan Chancellor <nathan@kernel.org>
> >
> >
> 
> Removing this comment is correct, but please note
> the commit description is not accurate.
> 
> Kconfig evaluates all $(shell ...) macros before deciding the
> value of RUSAT_IS_AVAILABLE.
> You cannot prevent Kconfig from evaluating $(shell ...).
> The author of c42297438aee7 did not read
> Documentation/kbuild/kconfig-macro-language.rst

Ugh, yes, sorry, I should have caught that too because I just recently
looked at this in another thread :(

  https://lore.kernel.org/20260129232535.GD844102@ax162/

I'd rather not rebase at this point but I appreciate you clarifying this
for the record.

Cheers,
Nathan

