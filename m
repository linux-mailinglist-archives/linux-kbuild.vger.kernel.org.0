Return-Path: <linux-kbuild+bounces-11456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PFXJ5GsoGlulgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11456-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:26:57 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E35521AF191
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 21:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 90ED13021D02
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0215B44CAE2;
	Thu, 26 Feb 2026 20:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NI2yH9Er"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7044B676;
	Thu, 26 Feb 2026 20:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772137613; cv=none; b=s+DmWu/LcKYb8n684U927LCAUbfYR9iovdv/ARJFC2/QYz1MyQ8facoFoGnJ1dYtDZndCDEvblg2JwFu5f6FfIDJlwUgsYEcE86qZO7RPqBs4mpWJF7YLxtNOocIvWY6co8ut/xflX6XU1VL3CdupX2rPhtLFXoPJYFrfY+2OMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772137613; c=relaxed/simple;
	bh=6TsiiSMzsn/+vN99TSo0gm1245JHkgFkcv+M3MqwJxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc4waloHLOTR1UMsovYqXvNDrwJvqj4DSFI56Jml+lLWUpx2s+8+OFy2cFrqSCMhV9yogJYkfksGBJsR3+sZQed5Ghp7CIWXL8Ny3n0HktJhYktTD98OCBkDfE93RAoPeRBzJ4c3qeUjDB4CyX94lfaWht5GlvE0M+IcqwbI5sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NI2yH9Er; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491DFC116C6;
	Thu, 26 Feb 2026 20:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772137613;
	bh=6TsiiSMzsn/+vN99TSo0gm1245JHkgFkcv+M3MqwJxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NI2yH9Erq+gnnRebTX594C/c/iAot6jDfuXHg1ZHYQ/YqqeCWf4QJHzLI2jkIO8IG
	 0v9OpDgMIo4E8MVx/r5JGrDmZ8k11rTTeMQo1oGzj5CJmTY5E+EeNEn8po1YrnFunq
	 KfUFMF6dbeKJpDGA54MxMtro8zPQInOM1EELIRRePFYQ0GZcwKKBmx3o5L3vz8QmuU
	 pIMA5BfX7HsfutFkyIxFup5SDt+4KEuKOhZt3Bi2/6iSAMSN88/X7cDMYJuBiyRXyp
	 RTXi9MxL5IXLMQjPodKJg00qnCb/MDb+wzOu0f2QycewUbVXOy4lr4a3sVs16xyEER
	 /av9xpVa9bPqg==
Date: Thu, 26 Feb 2026 13:26:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: sun jian <sun.jian.kdev@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] genksyms: Fix parsing a declarator with a preceding
 attribute
Message-ID: <20260226202648.GA3196155@ax162>
References: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
 <CABFUUZGgnKF+C7f7yPkXybFq1KBOJNj3s73R41ru1+aGUGYUQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABFUUZGgnKF+C7f7yPkXybFq1KBOJNj3s73R41ru1+aGUGYUQw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11456-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,strlen.de,vger.kernel.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E35521AF191
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 12:36:00PM +0800, sun jian wrote:
> On Thu, Feb 26, 2026 at 6:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > After commit 07919126ecfc ("netfilter: annotate NAT helper hook pointers
> > with __rcu"), genksyms fails to parse the __rcu annotation when building
> > with CONFIG_DEBUG_INFO_BTF=y, CONFIG_PAHOLE_HAS_BTF_TAG=y, and a version
> > of clang that supports btf_type_tag.
> 
> Hi Nathan,
> 
> Thanks for tracking this down and for the minimal reproducer.
> 
> I've noticed the same thing while building on my laptop during MODPOST
> Module.symvers:
> 
> WARNING: modpost: EXPORT symbol "nf_nat_ftp_hook" [vmlinux] version
> generation failed, symbol will not be versioned.
> Is "nf_nat_ftp_hook" prototyped in <asm/asm-prototypes.h>?
> WARNING: modpost: EXPORT symbol "nf_nat_irc_hook" [vmlinux] version
> generation failed, symbol will not be versioned.
> Is "nf_nat_irc_hook" prototyped in <asm/asm-prototypes.h>?
> 
> >
> > diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
> > index efdcf07c4eb6..cabcd146f3aa 100644
> > --- a/scripts/genksyms/parse.y
> > +++ b/scripts/genksyms/parse.y
> > @@ -325,8 +325,8 @@ direct_declarator:
> >                 { $$ = $4; }
> >         | direct_declarator BRACKET_PHRASE
> >                 { $$ = $2; }
> > -       | '(' declarator ')'
> > -               { $$ = $3; }
> > +       | '(' attribute_opt declarator ')'
> > +               { $$ = $4; }
> >         ;
> >
> 
> Your grammar tweak to allow an optional attribute before the nested
> declarator looks correct to me.

Thanks a lot for taking a look!

Cheers,
Nathan

