Return-Path: <linux-kbuild+bounces-10768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMC8INPFcGkNZwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10768-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 13:25:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1207656B8A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 13:25:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2561982733
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225AD36C0B0;
	Wed, 21 Jan 2026 12:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8oQbCz7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FC0280018;
	Wed, 21 Jan 2026 12:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768997992; cv=none; b=ejjM6fYKtL5h8B5693tyOF4FnghTwglS7SvHlbR7ccy18foDoQCsSfP02GnUR5FZspjM3hlvUFBUgIUpNcAdfydS++Ssktb1CjLLsOjzACoxVSi2wfNwrt7tzphLn650pfslve7C+OeY5xMzWh4fL6erMaWR6csvSlEsG4Q0wDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768997992; c=relaxed/simple;
	bh=w/i8Z8C7rk6FPxJd4MOpnsDHwSjwDb0IiSKlIhqWLc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/vC0jPqpC0PrJKoHl51GYysiCBRD8lU1ROfakmg7P50Pj2JhrFlMTa7oTBe64X3y3/djKHPM46j25fX+1Ri/fLxMvH1RY3CcZ+8MhJZDCRJc/U3Og6JpMaQ0OER5qy+OR3S3PefheNpKqY1EVmZv0T3YRTyc42R7JPwFX3I0qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8oQbCz7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005ACC116D0;
	Wed, 21 Jan 2026 12:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768997989;
	bh=w/i8Z8C7rk6FPxJd4MOpnsDHwSjwDb0IiSKlIhqWLc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8oQbCz7ENGqGjBcJajL6ZoW5YLFQqORg+xHcbsssytdohP12BOyWoB1X3DaAvVP2
	 AZlxNzfHJmYOjUEPURYy1KoqjB8jJ99rM+rgrgjG2r5naABBOIvsm9AvWzAquzHoM4
	 G0RBzvkobzzkyZThf6/uskHPDdS61cL2r9O9OpmJnvyhIE5NOoO3ihLkcDxFQlLFSq
	 MzzUbEajYhGVis7bXBUP/kXEhzt4Nn8OsXltbgOosb1TM63Dn+nm1O8pa3Ob1psu7D
	 pL/QHTtQ7VUNE+HYrnHUcI9HBVlA8pZKahTIfrBxUrkh+xIspO6TFNenGNVsGikcFN
	 oM6ziuEMySDHA==
Date: Wed, 21 Jan 2026 13:08:36 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Reject unexpected values for LLVM=
Message-ID: <aXDBxHyvrFK2XrMN@derry.ads.avm.de>
Mail-Followup-To: Nathan Chancellor <nathan@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
 <20260112231624.GA2272167@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112231624.GA2272167@ax162>
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[weissschuh.net,gmail.com,google.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10768-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,weissschuh.net:email]
X-Rspamd-Queue-Id: 1207656B8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 12, 2026 at 04:16:24PM -0700, Nathan Chancellor wrote:
> On Mon, Jan 12, 2026 at 07:43:52AM +0100, Thomas Weiﬂschuh wrote:
> > The LLVM argument is documented to accept one of three forms:
> > * a literal '1' to use the default 'clang',
> > * a toolchain prefix path, ending in a trailing '/',
> > * a version suffix.
> > 
> > All other values are silently treated as '1'. If for example
> > the user accidentally forgets the trailing '/' of a toolchain prefix,
> > kbuild will unexpectedly and silently fall back to the system toolchain.
> 
> Yeah, I do not think falling back to the system toolchain is great here.
> This would also catch misuse of LLVM=0, since that is treated as LLVM=1,
> rather than reverting to GCC + binutils.
> 
> > Instead report an error if the user specified an invalid value for LLVM.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> > ---
> >  Makefile | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index e404e4767944..2a085a1b6875 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -447,6 +447,8 @@ ifneq ($(filter %/,$(LLVM)),)
> >  LLVM_PREFIX := $(LLVM)
> >  else ifneq ($(filter -%,$(LLVM)),)
> >  LLVM_SUFFIX := $(LLVM)
> > +else ifneq ($(LLVM),1)
> > +$(error Invalid value for LLVM=)
> 
> If having a hard error is untenable (I am not sure that it is), we could
> just warn. Pointing to Documentation/kbuild/llvm.rst might be worthwhile
> in the message as well.

I second to have a hard error here with the documentation pointer to
prevent building with an unexpected toolchain, and as there is also no
fallback for gcc toolchains.

Kind regards,
Nicolas

