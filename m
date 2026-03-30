Return-Path: <linux-kbuild+bounces-12342-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDcxLMcMymmL4gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12342-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:40:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F28355A4C
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 07:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E76B4301DAD5
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 05:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D119F36C9CD;
	Mon, 30 Mar 2026 05:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0bfKkfZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99431F30BB;
	Mon, 30 Mar 2026 05:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848969; cv=none; b=JhwgaWrKEqigqIY1G25UCjQhyCjcLKbky/atkYweKINUybVnEOVQauPzfO9VOLTBPZG/KrYaJB7fqfNg/JKRvzvYpdUBajZLKpNEfMpKpV3/kPiM3Jv0JzBAfDWA4a0PVBZxEFqSlyjnMy9+dX8H1nKOHE1HZFibZdz+aSmlxNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848969; c=relaxed/simple;
	bh=37J2FedFq2slx06L2Z6thQB9dbAq/5grAfI/7vhrH9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXuc6Gt8bG4drkOLruf6IffNrh7n14sCJoKp04vDo/19dTgAOTSn4+Z0NtgZ/bjtXgESkQSlmefqpE/zHPqox2srmb5XJr1o5ypRidJPJb5MPdTAOpM5HhJOLWFWniz3876hvddB50Oyz6HDU+O3ITI9dz5ZzL911nnwC+GAxGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0bfKkfZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5EEC4CEF7;
	Mon, 30 Mar 2026 05:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774848969;
	bh=37J2FedFq2slx06L2Z6thQB9dbAq/5grAfI/7vhrH9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0bfKkfZfjuZwn6mM1WTeEaAxriNLOFG6mfcBIGKQ+khth0ZMNmyj61tqmtc3UAYA
	 8IxXapWKrI97J2BG7lJ+Dcf1u/KVgsLscMsc6gygfPqnwYT24Ucb3/skS8B63aHZSG
	 DK6UVV6fGoeoyzq7ryj4AegEIaWs85CPn/lk4+T7vkWrh0OhhXC9IHQ9Zgy77aAoJZ
	 S3EQkvtHybOTa1eTT6pLPHY9WWiifHbW2mu6yCOwx0l6tKMDcK1BCb8hjfNdmUXijs
	 uYRwrXbbrYqcQyfgSd1T+DYh6PxsTGSJkYMQC5n+YRy0McZP2BR7PgVlBF4vagEiq9
	 9yFXxg2+L+/EA==
Date: Mon, 30 Mar 2026 07:36:04 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for
 FORTIFY_SOURCE
Message-ID: <20260330053604.GA879042@ax162>
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
 <20260327221837.GA3622500@ax162>
 <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
 <202603292059.01A4CB14F2@keescook>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202603292059.01A4CB14F2@keescook>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12342-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 13F28355A4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 08:59:51PM -0700, Kees Cook wrote:
> On Fri, Mar 27, 2026 at 03:29:18PM -0700, Justin Stitt wrote:
> > On Fri, Mar 27, 2026 at 3:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > The compile time impact is not measurable (within expected noise). The
> > peak memory usage may increase by somewhere in the 0.5% to 1.5% range
> > depending on build configuration.
> > 
> > I bundled this under fortify to limit initial impact as its had
> > virtually no real-world testing and may produce unhelpful diagnostic
> > notes under its heuristic mode. I don't expect folks to use `-g1` in
> > the kernel (which would enable full-proof diagnostic notes).
> > 
> > > If not, maybe worth adding a Kconfig option that is force selected by FORTIFY_SOURCE with
> > > clang or can be optionally enabled by a user?
> > 
> > I'll defer to you on this one. We could add
> > CONFIG_SHOW_INLINING_CHAIN_NOTES or something similar?
> 
> I would prefer to just unconditionally enable this when it is supported.

Agreed. It cannot possibly be worse than the status quo, right? :) This
feels very similar to -fdiagnostics-show-context=2, so maybe add it near
there?

Cheers,
Nathan

