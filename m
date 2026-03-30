Return-Path: <linux-kbuild+bounces-12341-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOL4HD31yWln3gUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12341-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 05:59:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F903551BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 05:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8FA4830031CA
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 03:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BFD390CA6;
	Mon, 30 Mar 2026 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfyxSy7D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AD5391E44;
	Mon, 30 Mar 2026 03:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774843192; cv=none; b=OyZPjzQxzvP1URAuova619/AGF2GFy7HmTSBAO5Hwxo7+sTOKRkJgD5+4qbpEoGRovxus9vQUdl7sG9pHw+FhAE1179UFfzatGClfdAAOxY9bX6gVEcdXvQEJGP09OLQxqUs+LMLkVvDRM2KAPF2vieZOiugTLrBPj6G63HZ7Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774843192; c=relaxed/simple;
	bh=rYn9Qj89E+82dsSYK9QxN7k3AGhMaODdrwEQscNw3w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1A3ZAnsbQOTYq9ViTcFJ0jS54Mg28WnyGUwbAVlY5Hsh93MLoLyq7vIe7t747fTvSYobluk9wRLoDC0U7vyUy9MXhZipwWfPtw4YvQpooyEpa8kuqnysATXWzZzZmdhp6lk7pA+bxrSgMyo0gyLc+TXk7UUE8YRNyjQBPklunk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfyxSy7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA13C4CEF7;
	Mon, 30 Mar 2026 03:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774843192;
	bh=rYn9Qj89E+82dsSYK9QxN7k3AGhMaODdrwEQscNw3w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfyxSy7D9q7IOlb1cy+hEvX02aZijVDreV7DeObat8NK0TYB9v4W+of+a8jephKpE
	 VNRVNjJY2SpFr55eJLRJTp6gi1TCN+LTr0OAX5OCiwSSU9t/dmX5xIM3f1dI2io3FH
	 7okLiEz1Jwl2sDz6JZ++jqtXoiCsGcvm7hzgu4tkminAMnCq49BOJx6w4PF7dztrxV
	 XLE2him2m3vKPSQpCLDJMn3Msc3HVfOoUi0Wjv1mPqIrwGBtQZ++m4J9hIVE3edbkP
	 d02orqhJZ6YaTLa1F6IaWGtS5XeO2mFk7j0LuWfukjGrvz/XDg1yTTOx+2+Ar1mSGr
	 jA4qVhqHPqyzQ==
Date: Sun, 29 Mar 2026 20:59:51 -0700
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: add -fdiagnostics-show-inlining-chain for
 FORTIFY_SOURCE
Message-ID: <202603292059.01A4CB14F2@keescook>
References: <20260327-kbuild-show-inlining-v1-1-730ac2cae571@google.com>
 <20260327221837.GA3622500@ax162>
 <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFhGd8pWwbjjLt=FSaDtFysqRU5k_YozDgBFMJBN4YmnAEaktw@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12341-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: E4F903551BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 03:29:18PM -0700, Justin Stitt wrote:
> On Fri, Mar 27, 2026 at 3:18 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Fri, Mar 27, 2026 at 02:59:20PM -0700, Justin Stitt wrote:
> > > Clang recently added -fdiagnostics-show-inlining-chain [1] to improve
> > > the visibility of inlining chains in diagnostics. This is particularly
> > > useful for CONFIG_FORTIFY_SOURCE where detections can happen deep in
> > > inlined functions.
> > >
> > > Add this flag to KBUILD_CFLAGS when CONFIG_FORTIFY_SOURCE is enabled
> > > and the compiler supports it.
> > >
> > > Link: https://github.com/llvm/llvm-project/pull/174892 [1]
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1571
> > > Signed-off-by: Justin Stitt <justinstitt@google.com>
> > > ---
> > >  Makefile | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index e1279c4d5b24..978726aeb1ef 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -973,6 +973,12 @@ KBUILD_CFLAGS    += $(call cc-option, -fno-stack-clash-protection)
> > >  # Get details on warnings generated due to GCC value tracking.
> > >  KBUILD_CFLAGS        += $(call cc-option, -fdiagnostics-show-context=2)
> > >
> > > +# Show inlining chain notes for FORTIFY_SOURCE-related diagnostics.
> > > +# GCC does this by default while Clang 23+ supports a flag.
> > > +ifdef CONFIG_FORTIFY_SOURCE
> >
> > While this is indeed particularly useful for CONFIG_FORTIFY_SOURCE, this
> > impacts the warning and error attributes, which can be used anywhere
> > (see __bad_copy_from() for example). Is this being wrapped due to the
> > potential compile time impact? Can we use something like hyperfine to
> > quantify it and see if the impact is worth the trade off of always
> > having it enabled for friendlier diagnostics?
> 
> The compile time impact is not measurable (within expected noise). The
> peak memory usage may increase by somewhere in the 0.5% to 1.5% range
> depending on build configuration.
> 
> I bundled this under fortify to limit initial impact as its had
> virtually no real-world testing and may produce unhelpful diagnostic
> notes under its heuristic mode. I don't expect folks to use `-g1` in
> the kernel (which would enable full-proof diagnostic notes).
> 
> > If not, maybe worth adding a Kconfig option that is force selected by FORTIFY_SOURCE with
> > clang or can be optionally enabled by a user?
> 
> I'll defer to you on this one. We could add
> CONFIG_SHOW_INLINING_CHAIN_NOTES or something similar?

I would prefer to just unconditionally enable this when it is supported.

-- 
Kees Cook

